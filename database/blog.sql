-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 27 fév. 2023 à 08:15
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `categoryId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `image`, `createdAt`, `categoryId`) VALUES
(1, 'À quand la sortie de Starfield ? ', 'Je veux savoir ! La France veut savoir la vérité !', NULL, '2023-02-22 11:03:21', 1),
(2, 'Sortie du Kanzan mag ???', 'La sortie du Kanzan mag enfin dévoilée ! Les dessous de l\'ouvrage le plus attendu du monde. La sortie du Kanzan mag enfin dévoilée ! Les dessous de l\'ouvrage le plus attendu du monde. La sortie du Kanzan mag enfin dévoilée ! Les dessous de l\'ouvrage le plus attendu du monde. La sortie du Kanzan mag enfin dévoilée ! Les dessous de l\'ouvrage le plus attendu du monde.', NULL, '2023-02-22 12:22:44', 2),
(3, 'Qui dominera le ping pong game ?', 'L\'enquête exclusive !', NULL, '2023-02-22 12:34:55', 3),
(4, 'Fallout 76 ou Deep rock galactic ?', 'Le choix cornélien !', 'fallout 76.jfif', '2023-02-22 13:20:12', 1);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `idCategory` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`idCategory`, `name`) VALUES
(1, 'videoGame'),
(2, 'literature'),
(3, 'Sport');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `idComment` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `articleId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`idComment`, `createdAt`, `nickname`, `content`, `articleId`) VALUES
(2, '2023-02-23 16:54:31', ' ', '', 4),
(3, '2023-02-23 16:54:46', ' ', '', 4),
(4, '2023-02-23 16:54:47', ' ', '', 4),
(5, '2023-02-23 16:56:14', ' ', '', 4),
(6, '2023-02-23 16:57:56', ' ', '', 4),
(7, '2023-02-23 16:58:03', ' ', '', 4),
(8, '2023-02-23 16:58:08', ' ss', 'css', 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkCategoryArticle` (`categoryId`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `fkarticleComment` (`articleId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fkCategoryArticle` FOREIGN KEY (`categoryId`) REFERENCES `category` (`idCategory`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fkarticleComment` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
