# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.23)
# Database: assessement_DB
# Generation Time: 2021-03-16 10:11:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_06_01_000001_create_oauth_auth_codes_table',2),
	(4,'2016_06_01_000002_create_oauth_access_tokens_table',2),
	(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',2),
	(6,'2016_06_01_000004_create_oauth_clients_table',2),
	(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `client_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `client_id` int unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,1,'amirul-client','978muUJ74bjerQ56VulxMU1EKZO4oxU7ZGHAJ07B','http://localhost/auth/callback',0,0,0,'2021-03-15 15:39:15','2021-03-15 15:39:15'),
	(2,NULL,'Laravel Personal Access Client','Uj4c8qkBKqPKiJLlLja9Zp6rBklJLYzJIDR4YWwC','http://localhost',1,0,0,'2021-03-16 08:11:11','2021-03-16 08:11:11'),
	(3,NULL,'Laravel Password Grant Client','DEl8A9hEKBbagHb12vjoNBxj0NxNcE5yQ4wujfEi','http://localhost',0,1,0,'2021-03-16 08:11:11','2021-03-16 08:11:11');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,2,'2021-03-16 08:11:11','2021-03-16 08:11:11');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'amirulazizAPI','amirul@amirul.com',NULL,'$2y$10$5tsB50lSViNv6P4SGbPi0uejpw.DfaObdqrFP4rlGJyhmnfEld5fy',NULL,'2021-03-15 14:26:26','2021-03-16 09:56:14'),
	(61,'Name','Email',NULL,'$2y$10$H4YAdk8PAJUPsU56b14MXO2iFFtGQWJK5zKyI.vfBj0dtnucmbi5S',NULL,'2021-03-16 06:35:59','2021-03-16 07:10:18'),
	(62,'test1','test1@gmail.com',NULL,'$2y$10$N67FXGhwSd4cCAnlnL.3yuL8S0TUPkUGQMZU89dJExd7dnZgLN4fK',NULL,'2021-03-16 06:35:59','2021-03-16 07:10:18'),
	(64,'test3','test3@gmail.com',NULL,'$2y$10$poH/cMgguuswXzTKZ7K0meaWBsHrP8jAuMPfax9KB89kCryB78A4K',NULL,'2021-03-16 06:36:00','2021-03-16 07:10:19'),
	(65,'test4','test4@gmail.com',NULL,'$2y$10$bcCGa7QXCnC007GVigwUSOSaosv738K9UdsqqdWaWSa3mUeGAUCWm',NULL,'2021-03-16 06:36:00','2021-03-16 07:10:19'),
	(66,'test5','test5@gmail.com',NULL,'$2y$10$wRIGBtO2PRxeQnX8h6AlgOtdGi.iZn0NbCixNI1cuYoxgQ2vTjCky',NULL,'2021-03-16 06:36:00','2021-03-16 07:10:19'),
	(67,'test22','test2@gmail.com',NULL,'$2y$10$pqCQt.ZHkr/eh6rKyqhUbOta7H1wK5alBq.aXAt5BrfBpakuJjkZO',NULL,'2021-03-16 07:10:19','2021-03-16 07:10:19'),
	(68,'api-test','api-test@gmail.com',NULL,'$2y$10$PPsOqn3oDpl2X.NJwlovX.CSzXG8Rwajg/OeJlS09NPDPndxgCCli',NULL,'2021-03-16 08:45:18','2021-03-16 08:45:18'),
	(69,'api-test','api-test2@gmail.com',NULL,'$2y$10$YO14NxxHxOyO3PmcS0sKr.Sb47al1D.5jGh97zLZiuC7c5cmPoCjW',NULL,'2021-03-16 08:49:07','2021-03-16 08:49:07'),
	(70,'api-test','api-test3@gmail.com',NULL,'$2y$10$t9uYl5ryn4asx.NzLpc0fuYvfYgNw1NkogzrmocWQHt25nYGKWyMa',NULL,'2021-03-16 08:49:44','2021-03-16 08:49:44'),
	(71,'api-test','api-test4@gmail.com',NULL,'$2y$10$5WKl0CuMxCirO5AIa6hAUOyyoFcheSJPPmib58Zxzm1/kwite/Kcq',NULL,'2021-03-16 08:53:08','2021-03-16 08:53:08'),
	(72,'api-test','api-test6@gmail.com',NULL,'$2y$10$Xq2qQGrlZOondWxwAJB7b.RfBLL3JyIwpE4I9kcPLV0is0e4KobgW',NULL,'2021-03-16 09:21:07','2021-03-16 09:21:07'),
	(73,'api-test','api-test7@gmail.com',NULL,'$2y$10$oRy1SWUIqKS.p/kGCil7j.CwL3FuQfl8YHWNi.BfxHQEhqMPGNa46',NULL,'2021-03-16 09:24:12','2021-03-16 09:24:12'),
	(74,'api-test','api-test8@gmail.com',NULL,'$2y$10$t.aCDcTFTR5Hv1htheZb4OMBKM6VeFtrSgU/p521pbjMcbm2Q2TDC',NULL,'2021-03-16 09:24:23','2021-03-16 09:24:23'),
	(75,'api-test','api-test9@gmail.com',NULL,'$2y$10$EZ.pUDBSY3e6UjgGRG.5IeEwBa8hd8J79JkKtloXMWzWVmNGDFDk2',NULL,'2021-03-16 09:24:57','2021-03-16 09:24:57'),
	(77,'api-test','api-test11@gmail.com',NULL,'$2y$10$N2TQPeWZr0gHw5X.ZHJmWuvydtXLnU3/Vre8ScneJ8p8KJ7uAY3SW',NULL,'2021-03-16 09:26:23','2021-03-16 09:26:23'),
	(79,'api-test','api-test12@gmail.com',NULL,'$2y$10$K.y8Frdo88WqPcHpAMbgkuGGMxODuCveD5i6Fv5hMRvgp/tl6jOcW',NULL,'2021-03-16 09:55:08','2021-03-16 09:55:08');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
