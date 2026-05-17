-- ============================================================
-- Appointment Management System — DML Insert Script
-- Matches ORIGINAL schema.sql exactly
-- Milestone 5: Data Population
-- Muhammad Talha & Usman Syed | IMS Peshawar | May 2026
-- ============================================================

USE appointment_db;

-- ─────────────────────────────────────────────────────────
-- TABLE 1: appointment_types (4 rows)
-- ─────────────────────────────────────────────────────────
INSERT INTO appointment_types (id, type_code, type_name) VALUES (1, 'DOC', 'Doctor Appointment');
INSERT INTO appointment_types (id, type_code, type_name) VALUES (2, 'HOME', 'Home Service');
INSERT INTO appointment_types (id, type_code, type_name) VALUES (3, 'LAW', 'Lawyer/Court');
INSERT INTO appointment_types (id, type_code, type_name) VALUES (4, 'UNI', 'University/Office');

-- ─────────────────────────────────────────────────────────
-- TABLE 2: users (30 rows)
-- ─────────────────────────────────────────────────────────
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (1, 'USR-2025-00001', 'Allison Hill', 'donaldgarcia@example.net', '03171419610', 'b23f41afa5f47b191d275cc24f063272e9a95f5b36225f9c2de2821b6b274b8c', 'user', '2026-05-17 04:55:25');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (2, 'USR-2025-00002', 'Allen Robinson', 'hoffmanjennifer@example.net', '03275108603', 'aa91bb1289552259250e1b2a3cc07a788779cc744490e7f50a6cba9cd8eb48b4', 'user', '2026-05-17 04:56:13');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (3, 'USR-2025-00003', 'Rhonda Smith', 'helenpeterson@example.org', '03243341057', 'b148641d5fd710c862eee130b08b9963cef6207876a8b197a4dbadde4c33ca65', 'user', '2026-05-17 04:59:28');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (4, 'USR-2025-00004', 'James Howard', 'cassandra07@example.net', '03162458591', '55f7e1eba55c9e0b77ab1e2a3e310a17198883525b6ba414f5fec31afaa11006', 'user', '2026-05-17 05:00:26');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (5, 'USR-2025-00005', 'Edward Fuller', 'barbara10@example.net', '03478078673', '4e132b417a4596b2edd634bb466f602660787cfd9bfa68884ba1e5da53632f94', 'user', '2026-05-17 04:56:38');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (6, 'USR-2025-00006', 'David Garcia', 'shawn52@example.com', '03121499914', 'de8fb81dd7f7c6712c06fa64e687c301227da9eb1636529bbe51cea766deb27a', 'user', '2026-05-17 04:58:55');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (7, 'USR-2025-00007', 'Melinda Jones', 'amandasanchez@example.com', '03154668136', '4cbc791290affec0a98c477172f35395c5af7640abdffc8a0d8cd9627810b73d', 'user', '2026-05-17 05:00:50');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (8, 'USR-2025-00008', 'Kristin Cohen', 'perezantonio@example.com', '03249478454', '10ec5a14455d0439147c431f997ad7a4c58d5d7be4e55e994d7d0cc3343c302a', 'user', '2026-05-17 04:55:17');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (9, 'USR-2025-00009', 'Latoya Robbins', 'dianafoster@example.net', '03481445199', 'abb346954e29a8141c8cb94eddfb8190b61b3051dfa0b4ec95d5e29d93e182d8', 'user', '2026-05-17 04:56:29');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (10, 'USR-2025-00010', 'Justin Baker', 'zhurst@example.com', '03454335942', '528a0ba6937407022a0b6ab2b585d67c2d34910b599f40a76b083229b39904be', 'user', '2026-05-17 05:00:53');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (11, 'USR-2025-00011', 'Ann Williams', 'hernandezernest@example.net', '03448038374', '2ad65417b39b8b803218700a5393303946d02d0e26267e06667390f0f2f8c5b1', 'user', '2026-05-17 04:55:16');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (12, 'USR-2025-00012', 'Zachary Rice', 'frazierdanny@example.net', '03248536477', '32c23b80181cdf52be16c3fbf2bc5bc3b713cb596449a76be09e5bfed67a14a7', 'user', '2026-05-17 04:59:30');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (13, 'USR-2025-00013', 'Edward Moore', 'mckaynancy@example.com', '03475667265', '869f59ba80f7ddebc5e783f2031b0921e505a7810ee71c9d27ac63b46eda8227', 'user', '2026-05-17 04:59:28');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (14, 'USR-2025-00014', 'Ashley Garrett', 'ericfarmer@example.net', '03103678638', 'beae37ac789535f7cee792493bc81f78c9400a22f73183e6c8e5cca9ce50cfdd', 'user', '2026-05-17 05:00:26');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (15, 'USR-2025-00015', 'Linda Burns', 'hickmannatasha@example.com', '03376708456', '399d30176e2afc4addb2357767cce2f5266f2b9758539adaca7c8fe08bafc022', 'user', '2026-05-17 04:56:20');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (16, 'USR-2025-00016', 'Angela Dennis', 'spenceamanda@example.org', '03273608513', '5448189b901c4bf193dff3db9dcbefcbfe46851d9438b9626843bc8869619c9e', 'user', '2026-05-17 04:57:45');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (17, 'USR-2025-00017', 'Deborah Brennan', 'ibrandt@example.net', '03236647119', '7e9739c7d1ac5cbb5101e4480a133e65f966ae9d0325c4fd463972cef6c9731d', 'user', '2026-05-17 04:59:10');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (18, 'USR-2025-00018', 'Michael Brooks', 'omartinez@example.org', '03162556017', 'e901ca7cf8dd3bd6503db5a64cc84076fdf0c33906ccbf83bfaa5874e4933c9c', 'user', '2026-05-17 04:58:25');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (19, 'USR-2025-00019', 'Daniel Jones', 'perezrebecca@example.com', '03342622631', '3436965836d671702082f5d5b210d3c0613393dd22099438136f964356534c05', 'user', '2026-05-17 04:56:19');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (20, 'USR-2025-00020', 'Cindy Anderson', 'esanchez@example.com', '03326770619', '8111b62d5150f0ec6dc6a65e87fa1f3e8edcb094d842ab4d6dbb0a06e5b152bc', 'user', '2026-05-17 04:55:28');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (21, 'USR-2025-00021', 'Jeff Owens', 'nuneztracey@example.org', '03485437923', 'e995646fb19d8824a5b315e3443bbc18184872ce6e9cbe45209753b07c839676', 'user', '2026-05-17 04:59:16');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (22, 'USR-2025-00022', 'Ashley Lee', 'ltaylor@example.com', '03128707870', '09e637ff7d74149186e53ac39cc9f7a2393b55f62a92088646a7b6e3a7ff4d7d', 'user', '2026-05-17 05:00:08');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (23, 'USR-2025-00023', 'Robert Chase', 'williamsyvette@example.org', '03443094235', 'c7851c0f1530640d469066362549c79ff9663512e68519975f1389a37198061e', 'user', '2026-05-17 05:00:27');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (24, 'USR-2025-00024', 'Carol Tucker', 'michellebarrera@example.org', '03342322047', '9464d4b576d91a15044ff6a460b1090b5ab23448f56830d87b3eba90416590ab', 'user', '2026-05-17 05:00:48');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (25, 'USR-2025-00025', 'Richard Gibson', 'uhorton@example.net', '03455918715', 'ccc9afc0a780ab212f88c7192975fd5919533c5133d1290de35a5c52dedc9fd3', 'user', '2026-05-17 04:57:49');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (26, 'USR-2025-00026', 'Daniel Brown', 'adkinsbrian@example.net', '03497067228', 'bf46084063b1b8356f006ef9911c394788462ca434028f9a9d172cb0ecf9480a', 'user', '2026-05-17 05:00:24');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (27, 'USR-2025-00027', 'Amy Romero', 'caseyjones@example.org', '03464226067', '768c3642324be3e2bb6241270f208f8aa71987ea10394f356e0751ece782de87', 'user', '2026-05-17 05:00:32');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (28, 'USR-2025-00028', 'Lauren Williams', 'barnesbrandy@example.net', '03141768805', '6e154cb4cbfa2f495c4cf9fb49ac7200ed815202db5f28c8a13f33d5c3a41ffb', 'user', '2026-05-17 04:56:27');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (29, 'USR-2025-00029', 'Emily Baker', 'emilyevans@example.com', '03245855124', '954051377de172972eee0825eadfddf3754c0f6ad1320fc30a51f77d9016a2e9', 'user', '2026-05-17 05:00:30');
INSERT INTO users (id, user_id, name, email, phone, password, role, created_at) VALUES (30, 'USR-2025-00030', 'Marc Hart', 'jonesjason@example.com', '03154905582', '2f20d6265cfd212b8b69eba30619f3efe1eb4504cfafb15654e80f37eedddfed', 'user', '2026-05-17 04:56:59');

-- ─────────────────────────────────────────────────────────
-- TABLE 3: admins (3 rows)
-- ─────────────────────────────────────────────────────────
INSERT INTO admins (id, admin_id, name, email, password, created_at) VALUES (1, 'ADM-2025-00001', 'Ali Hassan', 'ali.admin@ims.edu.pk', 'e498ea3a9531da9ea44ef5272b63a970aa107f5f730f887bf5e2428f4acada0c', '2026-05-17 04:53:23');
INSERT INTO admins (id, admin_id, name, email, password, created_at) VALUES (2, 'ADM-2025-00002', 'Sara Qureshi', 'sara.admin@ims.edu.pk', '650ca21f3bf05670ab8acdf47a6d2c99f71773574a577632251ade5aeba4c090', '2026-05-17 04:53:46');
INSERT INTO admins (id, admin_id, name, email, password, created_at) VALUES (3, 'ADM-2025-00003', 'Bilal Ahmed', 'bilal.admin@ims.edu.pk', '8fd75965a87f29910a635de2ba218b9ac849f47be67105802e99a537b25838a2', '2026-05-17 04:53:30');

-- ─────────────────────────────────────────────────────────
-- TABLE 4: appointments (50 rows)
-- ─────────────────────────────────────────────────────────
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (1, 'APT-2025-00001', 15, 2, 1, '2026-05-16', '14:30:00', 'cancelled', '2026-05-17 05:00:07');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (2, 'APT-2025-00002', 18, 1, 3, '2026-05-16', '09:15:00', 'completed', '2026-05-17 04:59:07');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (3, 'APT-2025-00003', 8, 2, 2, '2026-05-16', '13:00:00', 'cancelled', '2026-05-17 05:00:24');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (4, 'APT-2025-00004', 13, 3, 3, '2026-05-16', '11:45:00', 'confirmed', '2026-05-17 04:59:52');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (5, 'APT-2025-00005', 24, 3, 2, '2026-05-16', '16:30:00', 'cancelled', '2026-05-17 04:57:44');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (6, 'APT-2025-00006', 3, 1, 2, '2026-05-16', '16:45:00', 'confirmed', '2026-05-17 05:00:13');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (7, 'APT-2025-00007', 13, 2, 4, '2026-05-16', '17:00:00', 'cancelled', '2026-05-17 04:58:36');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (8, 'APT-2025-00008', 25, 1, 1, '2026-05-16', '09:30:00', 'completed', '2026-05-17 05:00:25');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (9, 'APT-2025-00009', 17, 3, 1, '2026-05-16', '12:15:00', 'confirmed', '2026-05-17 05:00:14');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (10, 'APT-2025-00010', 20, 1, 2, '2026-05-16', '16:00:00', 'cancelled', '2026-05-17 04:57:03');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (11, 'APT-2025-00011', 8, 1, 3, '2026-05-16', '11:00:00', 'completed', '2026-05-17 04:59:53');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (12, 'APT-2025-00012', 18, NULL, 2, '2026-05-16', '10:45:00', 'completed', '2026-05-17 04:59:50');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (13, 'APT-2025-00013', 22, 2, 2, '2026-05-16', '12:45:00', 'completed', '2026-05-17 05:00:06');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (14, 'APT-2025-00014', 1, 1, 2, '2026-05-16', '09:30:00', 'confirmed', '2026-05-17 04:57:58');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (15, 'APT-2025-00015', 29, NULL, 1, '2026-05-16', '11:00:00', 'pending', '2026-05-17 04:58:44');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (16, 'APT-2025-00016', 18, NULL, 3, '2026-05-16', '15:15:00', 'completed', '2026-05-17 04:57:48');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (17, 'APT-2025-00017', 4, NULL, 4, '2026-05-16', '14:15:00', 'cancelled', '2026-05-17 04:58:12');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (18, 'APT-2025-00018', 2, 2, 4, '2026-05-16', '08:00:00', 'confirmed', '2026-05-17 04:58:00');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (19, 'APT-2025-00019', 6, NULL, 4, '2026-05-16', '10:45:00', 'pending', '2026-05-17 05:00:49');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (20, 'APT-2025-00020', 3, 1, 1, '2026-05-16', '08:00:00', 'completed', '2026-05-17 04:57:21');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (21, 'APT-2025-00021', 6, 2, 2, '2026-05-16', '14:00:00', 'completed', '2026-05-17 05:00:45');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (22, 'APT-2025-00022', 10, NULL, 4, '2026-05-16', '10:15:00', 'pending', '2026-05-17 04:57:39');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (23, 'APT-2025-00023', 17, 3, 1, '2026-05-16', '08:45:00', 'pending', '2026-05-17 04:59:33');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (24, 'APT-2025-00024', 20, NULL, 1, '2026-05-16', '10:00:00', 'completed', '2026-05-17 05:00:17');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (25, 'APT-2025-00025', 20, NULL, 2, '2026-05-16', '17:00:00', 'cancelled', '2026-05-17 04:59:33');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (26, 'APT-2025-00026', 9, 3, 2, '2026-05-16', '13:15:00', 'cancelled', '2026-05-17 04:57:35');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (27, 'APT-2025-00027', 20, 1, 1, '2026-05-16', '08:45:00', 'confirmed', '2026-05-17 04:59:19');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (28, 'APT-2025-00028', 29, NULL, 2, '2026-05-16', '13:00:00', 'confirmed', '2026-05-17 04:59:36');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (29, 'APT-2025-00029', 22, 2, 3, '2026-05-16', '17:00:00', 'pending', '2026-05-17 04:57:16');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (30, 'APT-2025-00030', 29, NULL, 2, '2026-05-16', '12:00:00', 'confirmed', '2026-05-17 04:58:08');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (31, 'APT-2025-00031', 22, 2, 2, '2026-05-16', '13:15:00', 'completed', '2026-05-17 04:57:05');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (32, 'APT-2025-00032', 27, NULL, 1, '2026-05-16', '09:45:00', 'cancelled', '2026-05-17 04:58:26');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (33, 'APT-2025-00033', 18, 3, 3, '2026-05-16', '10:45:00', 'pending', '2026-05-17 04:59:39');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (34, 'APT-2025-00034', 27, 3, 2, '2026-05-16', '16:00:00', 'completed', '2026-05-17 05:00:26');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (35, 'APT-2025-00035', 29, 3, 3, '2026-05-16', '13:00:00', 'pending', '2026-05-17 05:00:06');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (36, 'APT-2025-00036', 30, 1, 4, '2026-05-16', '17:15:00', 'completed', '2026-05-17 04:59:07');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (37, 'APT-2025-00037', 9, NULL, 3, '2026-05-16', '14:15:00', 'pending', '2026-05-17 04:57:26');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (38, 'APT-2025-00038', 7, 2, 1, '2026-05-16', '15:15:00', 'cancelled', '2026-05-17 04:59:05');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (39, 'APT-2025-00039', 22, NULL, 2, '2026-05-16', '11:00:00', 'cancelled', '2026-05-17 04:58:39');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (40, 'APT-2025-00040', 22, 3, 3, '2026-05-16', '13:45:00', 'pending', '2026-05-17 04:58:14');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (41, 'APT-2025-00041', 2, NULL, 3, '2026-05-16', '10:30:00', 'cancelled', '2026-05-17 04:58:31');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (42, 'APT-2025-00042', 13, 1, 3, '2026-05-16', '14:00:00', 'pending', '2026-05-17 05:00:25');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (43, 'APT-2025-00043', 12, 3, 1, '2026-05-16', '16:15:00', 'cancelled', '2026-05-17 05:00:05');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (44, 'APT-2025-00044', 22, 2, 1, '2026-05-16', '12:30:00', 'cancelled', '2026-05-17 04:57:33');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (45, 'APT-2025-00045', 22, 1, 2, '2026-05-16', '14:45:00', 'cancelled', '2026-05-17 04:59:23');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (46, 'APT-2025-00046', 7, 3, 1, '2026-05-16', '12:30:00', 'cancelled', '2026-05-17 04:59:09');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (47, 'APT-2025-00047', 26, 3, 4, '2026-05-16', '11:45:00', 'pending', '2026-05-17 04:57:26');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (48, 'APT-2025-00048', 22, 1, 3, '2026-05-16', '09:15:00', 'pending', '2026-05-17 04:58:24');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (49, 'APT-2025-00049', 15, 3, 4, '2026-05-16', '17:00:00', 'confirmed', '2026-05-17 04:57:06');
INSERT INTO appointments (id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, status, created_at) VALUES (50, 'APT-2025-00050', 8, NULL, 4, '2026-05-16', '15:45:00', 'pending', '2026-05-17 04:57:41');

-- ─────────────────────────────────────────────────────────
-- TABLE 5: doctor_appointments (13 rows)
-- ─────────────────────────────────────────────────────────
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (1, 1, 'Cameron Caldwell', 'Neurology', 'Medicare Clinic', 'Skin rash', 'Rest advised');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (2, 8, 'Daniel Lyons', 'Neurology', 'City Care Center', 'Fever and cough', 'Ultrasound required');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (3, 9, 'Christopher Lawson', 'Cardiology', 'Medicare Clinic', 'Back pain', 'Blood test required');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (4, 15, 'Brian Weiss', 'Pediatrics', 'City Care Center', NULL, 'Ultrasound required');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (5, 20, 'Mr. Alexander Collins', 'Neurology', 'City Care Center', NULL, 'Rest advised');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (6, 23, 'Tyler Sanders', 'Pediatrics', 'Lady Reading Hospital', 'Headache', 'Rest advised');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (7, 24, 'Billy Vaughn', 'Neurology', 'KTH Peshawar', NULL, NULL);
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (8, 27, 'Brian Barton', 'Cardiology', 'KTH Peshawar', 'Chest pain', NULL);
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (9, 32, 'Kyle Martinez', 'ENT', 'Shifa Hospital', 'Joint pain', 'Follow-up in 2 weeks');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (10, 38, 'Richard Reed MD', 'Dermatology', 'Medicare Clinic', 'Back pain', 'Rest advised');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (11, 43, 'Jonathan Peterson', 'Orthopedics', 'Shifa Hospital', 'Chest pain', 'Blood test required');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (12, 44, 'Rodney Garcia', 'Orthopedics', 'KTH Peshawar', NULL, 'Blood test required');
INSERT INTO doctor_appointments (id, appointment_id, doctor_name, specialization, clinic_name, symptoms, prescription_notes) VALUES (13, 46, 'Mr. Ronald Zimmerman', 'General Physician', 'Shifa Hospital', 'Routine checkup', 'Ultrasound required');

-- ─────────────────────────────────────────────────────────
-- TABLE 6: home_service_appointments (16 rows)
-- ─────────────────────────────────────────────────────────
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (1, 3, 'Carpentry', 'Thompson-Boyd', '877 Petersen Ramp Suite 531', 'No pets in house', '180');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (2, 5, 'Cleaning', 'Keith-Sanchez', '965 Troy Islands Apt. 735', 'Gate code: 1234', '90');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (3, 6, 'Pest Control', 'Peterson-Beard', '083 John Lodge Suite 837', NULL, '120');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (4, 10, 'Carpentry', 'Joseph, West and Smith', '63495 Tran Key Suite 855', 'Call before arriving', '180');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (5, 12, 'Cleaning', 'Chavez, Parker and Hall', '1823 Joanna Harbor', 'No pets in house', '90');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (6, 13, 'Cleaning', 'Lawrence, Wolf and Carlson', '43524 Jean Crossroad', 'Gate code: 1234', '120');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (7, 14, 'Carpentry', 'Williams-Brown', '271 Audrey Mountains Suite 752', 'No pets in house', '60');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (8, 21, 'Electrician', 'King Group', '67190 Edward Port', 'Bring own tools', '180');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (9, 25, 'Cleaning', 'Miller-Wright', '993 Hayes Mills Suite 964', 'Bring own tools', '180');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (10, 26, 'Plumbing', 'Oliver, Lynch and Singh', '341 John Plaza', 'No pets in house', '60');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (11, 28, 'Electrician', 'Moore Group', '974 Jesse Squares Suite 713', 'No pets in house', '90');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (12, 30, 'AC Repair', 'French-Weber', '1832 Serrano Cliffs', 'Gate code: 1234', '120');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (13, 31, 'AC Repair', 'Martin LLC', '1746 Mason Park Suite 190', 'No pets in house', '90');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (14, 34, 'AC Repair', 'Navarro-Munoz', '39904 Kathryn Extensions', 'Bring own tools', '120');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (15, 39, 'Carpentry', 'Stone-Ramos', '96717 Ortiz Islands Apt. 256', 'Gate code: 1234', '30');
INSERT INTO home_service_appointments (id, appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (16, 45, 'Electrician', 'Simpson, Bates and Morales', '1545 Tara Lodge', 'Bring own tools', '30');

-- ─────────────────────────────────────────────────────────
-- TABLE 7: lawyer_court_appointments (12 rows)
-- ─────────────────────────────────────────────────────────
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (1, 2, 'Adv. April Booth', 'Criminal', 'District Court Peshawar', '2026-05-16', 'CASE-1333/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (2, 4, 'Adv. Jessica Wolfe', 'Property', 'District Court Peshawar', '2026-05-16', 'CASE-4908/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (3, 11, 'Adv. Jason Walker', 'Criminal', 'Supreme Court Branch', '2026-05-16', 'CASE-2874/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (4, 16, 'Adv. Denise Davenport', 'Property', 'District Court Peshawar', '2026-05-16', 'CASE-8619/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (5, 29, 'Adv. Jennifer Villa', 'Labour', 'Civil Court Mardan', '2026-05-16', 'CASE-7043/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (6, 33, 'Adv. Mr. Phillip Bennett', 'Criminal', 'Sessions Court', '2026-05-16', 'CASE-2876/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (7, 35, 'Adv. Thomas James', 'Criminal', 'Civil Court Mardan', '2026-05-16', 'CASE-2771/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (8, 37, 'Adv. Jessica Fox', 'Property', 'Peshawar High Court', '2026-05-16', 'CASE-6111/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (9, 40, 'Adv. Bobby Murphy', 'Property', 'Supreme Court Branch', '2026-05-16', 'CASE-7498/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (10, 41, 'Adv. Yolanda Francis', 'Labour', 'District Court Peshawar', '2026-05-16', 'CASE-2245/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (11, 42, 'Adv. Anthony Howard', 'Property', 'District Court Peshawar', '2026-05-16', 'CASE-2669/2026');
INSERT INTO lawyer_court_appointments (id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (12, 48, 'Adv. Cynthia Durham', 'Labour', 'Civil Court Mardan', '2026-05-16', 'CASE-2983/2026');

-- ─────────────────────────────────────────────────────────
-- TABLE 8: university_office_appointments (9 rows)
-- ─────────────────────────────────────────────────────────
INSERT INTO university_office_appointments (id, appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (1, 7, 'Qurtuba University', 'Admissions', 'Julie Roberts', 'NOC Request', 'Room 372', 'Transcript, photo');
INSERT INTO university_office_appointments (id, appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (2, 17, 'CECOS University', 'Admissions', 'Angela Landry', 'Degree Verification', 'Room 431', 'Application form');
INSERT INTO university_office_appointments (id, appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (3, 18, 'Institute of Management Sciences', 'IT Department', 'Elizabeth Hayden DDS', 'Transcript Request', 'Room 154', 'Transcript, photo');
INSERT INTO university_office_appointments (id, appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (4, 19, 'CECOS University', 'Registrar Office', 'Eric Kidd', 'Transcript Request', 'Room 462', 'Original degree, CNIC');
INSERT INTO university_office_appointments (id, appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (5, 22, 'Islamia College', 'Finance', 'Ashley James', 'Meeting with HOD', 'Room 367', NULL);
INSERT INTO university_office_appointments (id, appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (6, 36, 'CECOS University', 'HR Department', 'Edward Lyons', 'Degree Verification', 'Room 496', 'Transcript, photo');
INSERT INTO university_office_appointments (id, appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (7, 47, 'Islamia College', 'IT Department', 'Ronald Foster', 'Meeting with HOD', 'Room 403', 'Application form');
INSERT INTO university_office_appointments (id, appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (8, 49, 'CECOS University', 'Finance', 'Sean Osborne', 'Admission Query', 'Room 242', 'Transcript, photo');
INSERT INTO university_office_appointments (id, appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (9, 50, 'University of Peshawar', 'IT Department', 'Susan Mcgee', 'Degree Verification', 'Room 412', NULL);

-- ─────────────────────────────────────────────────────────
-- VERIFICATION: Row counts after insert
-- ─────────────────────────────────────────────────────────
SELECT 'appointment_types'                AS table_name, COUNT(*) AS rows FROM appointment_types
UNION ALL SELECT 'users',                               COUNT(*) FROM users
UNION ALL SELECT 'admins',                              COUNT(*) FROM admins
UNION ALL SELECT 'appointments',                        COUNT(*) FROM appointments
UNION ALL SELECT 'doctor_appointments',                 COUNT(*) FROM doctor_appointments
UNION ALL SELECT 'home_service_appointments',           COUNT(*) FROM home_service_appointments
UNION ALL SELECT 'lawyer_court_appointments',           COUNT(*) FROM lawyer_court_appointments
UNION ALL SELECT 'university_office_appointments',      COUNT(*) FROM university_office_appointments;

-- ============================================================
-- END OF DML SCRIPT
-- Total rows inserted: 137
-- Insert order: appointment_types → users → admins →
--               appointments → [4 child tables]
-- ============================================================