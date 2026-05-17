import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (without specifying database)
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',  # Empty password for root
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS appointment_db")
            print("✓ Database 'appointment_db' created successfully")

            # Use the database
            cursor.execute("USE appointment_db")

            # Read and execute schema.sql
            with open('schema.sql', 'r', encoding='utf-8') as file:
                sql_script = file.read()

            # Split the script into individual statements
            statements = sql_script.split(';')

            for statement in statements:
                statement = statement.strip()
                if statement and not statement.startswith('--') and not statement.lower().startswith('use'):
                    try:
                        cursor.execute(statement)
                        print(f"✓ Executed: {statement[:50]}...")
                    except Error as e:
                        print(f"✗ Error executing statement: {e}")
                        print(f"Statement: {statement}")

            connection.commit()
            print("✓ Database schema created successfully")

    except Error as e:
        print(f"✗ Database error: {e}")
        print("\nTroubleshooting steps:")
        print("1. Make sure MySQL Server is installed and running")
        print("2. Check if MySQL service is started (services.msc)")
        print("3. Verify root password is empty (or set MYSQL_PASSWORD env var)")
        print("4. Try connecting manually: mysql -u root -p")
        print("\nIf MySQL is not installed:")
        print("- Download from: https://dev.mysql.com/downloads/mysql/")
        print("- Install and start the service")
        return False

    except FileNotFoundError:
        print("✗ schema.sql file not found in current directory")
        return False

    finally:
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()
            print("✓ MySQL connection closed")

    return True

if __name__ == "__main__":
    success = create_database()
    if success:
        print("\n🎉 Database setup complete! You can now run 'python app.py'")
    else:
        print("\n❌ Database setup failed. Please fix the issues above and try again.")