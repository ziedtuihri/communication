-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 13, 2021 at 11:52 PM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `5mrruYpkTT`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `id_adresse` int(11) NOT NULL,
  `code_postale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rue` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gouvernorat_adresse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `code_postale`, `rue`, `ville`, `gouvernorat_adresse`, `pays`, `id_user`) VALUES
(2, '5015', 'rue fredj bouzid', 'Bouhjar', 'Monastir', 'Tunisie', 1),
(3, '5045', 'Rue Liberté', 'Tunis', 'Tunis', 'Tunisie', 3),
(4, '5111', 'rue bourguiba', 'Tunis', 'Tunis', 'Tunisie', 4),
(5, '5452', 'rue aziza othmana', 'Sousse', 'Sousse', 'Tunisie', 5),
(6, '5444', 'rue Manzah', 'Tunis', 'Manzah 5', 'Tunisie', 2);

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL COMMENT 'exemple : MPDAM, L3-DSI2',
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `nb_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`id_classe`, `libelle`, `id_responsable`, `nb_etudiant`) VALUES
(1, 'M1MPDAM', 2, 20),
(2, 'M2MPDAM', 2, 19),
(3, 'M1BI', 2, 15),
(4, 'M2BI', 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `id_club` int(11) NOT NULL,
  `nom_club` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` date NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_domaine` int(11) NOT NULL,
  `url_fb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`id_club`, `nom_club`, `date_creation`, `logo`, `description`, `id_domaine`, `url_fb`) VALUES
(1, 'IEEE', '2020-01-15', 'https://media-exp1.licdn.com/dms/image/C4E0BAQGoRdJYxmIDhQ/company-logo_200_200/0/1519856132409?e=2159024400&v=beta&t=E3bJUsDGZJOxJYvFVGwMy94eILtECRvmv4LiIeio-O8', 'IEEE', 2, NULL),
(2, 'IOT', '2019-01-15', 'https://i.pinimg.com/originals/33/4e/06/334e063ae9f247704b37549b4b0f47d1.png', 'IOT', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commentaire_publication`
--

CREATE TABLE `commentaire_publication` (
  `id_commentaire` int(11) NOT NULL,
  `date` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `heure` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_publication` int(11) NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_membre` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `commentaire_publication`
--

INSERT INTO `commentaire_publication` (`id_commentaire`, `date`, `heure`, `id_publication`, `description`, `id_membre`) VALUES
(1, '2021-4-0', '22:7:29', 1, 's', '1'),
(2, '2021-4-1', '1:35:22', 1, 'hhh', '2'),
(3, '2021-4-1', '1:50:33', 1, 'heelo', '2');

-- --------------------------------------------------------

--
-- Table structure for table `competence`
--

CREATE TABLE `competence` (
  `id_competence` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `niveau` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `competence`
--

INSERT INTO `competence` (`id_competence`, `libelle`, `niveau`) VALUES
(1, 'Soft Skills', 1),
(2, 'others', 1),
(3, 'Graphic Design', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `avatar` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `id_status_contact` int(11) NOT NULL,
  `unread` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mood` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id_contact`, `id_user`, `avatar`, `id_status_contact`, `unread`, `mood`) VALUES
(1, 1, 'https://img1.freepng.fr/20180626/ehy/kisspng-avatar-user-computer-icons-software-developer-5b327cc951ae22.8377289615300354013346.jpg', 1, 'unread', 'mood'),
(2, 2, 'https://img1.freepng.fr/20180626/ehy/kisspng-avatar-user-computer-icons-software-developer-5b327cc951ae22.8377289615300354013346.jpg', 2, 'unread', 'mood'),
(3, 2, 'https://img1.freepng.fr/20180626/ehy/kisspng-avatar-user-computer-icons-software-developer-5b327cc951ae22.8377289615300354013346.jpg', 2, 'unread', 'mood');

-- --------------------------------------------------------

--
-- Table structure for table `cursus`
--

CREATE TABLE `cursus` (
  `id_cursus` int(11) NOT NULL,
  `moyenne` double NOT NULL,
  `credit` int(11) NOT NULL,
  `mention` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `session` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note_pfe` double DEFAULT NULL,
  `id_domaine` int(11) NOT NULL,
  `id_etablissement` int(11) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `au_fin` int(4) NOT NULL,
  `au_debut` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cursus`
--

INSERT INTO `cursus` (`id_cursus`, `moyenne`, `credit`, `mention`, `session`, `note_pfe`, `id_domaine`, `id_etablissement`, `id_specialite`, `id_niveau`, `id_etudiant`, `au_fin`, `au_debut`) VALUES
(3, 15, 60, 'Tres Bien', 'Principal', NULL, 2, 2, 2, 3, 1, 2020, 2018);

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

CREATE TABLE `cv` (
  `id_cv` int(11) NOT NULL,
  `specialite` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_competence` int(11) NOT NULL,
  `id_experience` int(11) NOT NULL,
  `fichier_cv` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cv`
--

INSERT INTO `cv` (`id_cv`, `specialite`, `id_etudiant`, `id_competence`, `id_experience`, `fichier_cv`) VALUES
(1, 'web developer', 1, 3, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `demande_club`
--

CREATE TABLE `demande_club` (
  `id_demande_club` int(11) NOT NULL,
  `date` date NOT NULL,
  `motivation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_statut_demande_club` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `demande_club`
--

INSERT INTO `demande_club` (`id_demande_club`, `date`, `motivation`, `id_statut_demande_club`, `id_club`, `id_etudiant`) VALUES
(1, '2021-05-11', 'motivation', 1, 1, 1),
(2, '2021-05-11', 'motivation 2', 2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `demande_master`
--

CREATE TABLE `demande_master` (
  `id_demande` int(11) NOT NULL,
  `date_inscrit` date NOT NULL,
  `id_etat_demande_master` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `fichier` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `demande_master`
--

INSERT INTO `demande_master` (`id_demande`, `date_inscrit`, `id_etat_demande_master`, `id_master`, `id_etudiant`, `fichier`) VALUES
(1, '2021-03-01', 3, 1, 3, ''),
(2, '2021-03-01', 1, 2, 4, ''),
(3, '2021-01-12', 2, 1, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `demande_stage_entreprise`
--

CREATE TABLE `demande_stage_entreprise` (
  `id_demande_stage_entreprise` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_offre_stage` int(11) NOT NULL,
  `id_etat_demande_stage_entreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `demande_stage_entreprise`
--

INSERT INTO `demande_stage_entreprise` (`id_demande_stage_entreprise`, `id_etudiant`, `id_offre_stage`, `id_etat_demande_stage_entreprise`) VALUES
(8, 1, 8, 1),
(9, 3, 7, 3),
(10, 4, 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `demande_stage_etudiant`
--

CREATE TABLE `demande_stage_etudiant` (
  `id_demande` int(11) NOT NULL,
  `date_demande` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_etat_demande_stage_etudiant` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `demande_stage_etudiant`
--

INSERT INTO `demande_stage_etudiant` (`id_demande`, `date_demande`, `description`, `id_etat_demande_stage_etudiant`, `id_etudiant`) VALUES
(1, '2021-02-01', 'desc', 1, 1),
(2, '2021-04-01', 'desc ', 2, 3),
(3, '2021-02-01', 'desc', 3, 4),
(4, '2021-04-01', 'desc ', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

CREATE TABLE `departement` (
  `id_departement` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departement`
--

INSERT INTO `departement` (`id_departement`, `code`, `libelle`, `description`) VALUES
(3, 'TI', 'Technologie de l\'informatique ', ''),
(4, 'AL', 'Agro alimentaire ', ''),
(5, 'M', 'Mecanique ', ''),
(6, 'E', 'electrique', ''),
(7, 'GC', 'Genie Civil', '');

-- --------------------------------------------------------

--
-- Table structure for table `domaine`
--

CREATE TABLE `domaine` (
  `id_domaine` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `domaine`
--

INSERT INTO `domaine` (`id_domaine`, `libelle`) VALUES
(2, 'IT'),
(3, 'BI');

-- --------------------------------------------------------

--
-- Table structure for table `enseignement`
--

CREATE TABLE `enseignement` (
  `id_enseignement` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  `id_seance` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL COMMENT 'cette id est correspondant pour l''utilisateur qui est un role enseignant ',
  `id_classe` int(11) NOT NULL,
  `id_statut_enseignement` int(11) NOT NULL,
  `qr_code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `enseignement`
--

INSERT INTO `enseignement` (`id_enseignement`, `id_salle`, `id_seance`, `id_matiere`, `id_enseignant`, `id_classe`, `id_statut_enseignement`, `qr_code`) VALUES
(1, 12, 1, 1, 6, 1, 1, ''),
(2, 11, 2, 3, 6, 2, 1, ''),
(3, 1, 3, 1, 6, 4, 1, ''),
(4, 9, 4, 4, 6, 3, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `entreprise`
--

CREATE TABLE `entreprise` (
  `id_entreprises` int(11) NOT NULL,
  `nom_societe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `num_reg_commerce` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `localisation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_web` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_domaine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `entreprise`
--

INSERT INTO `entreprise` (`id_entreprises`, `nom_societe`, `num_reg_commerce`, `localisation`, `site_web`, `id_domaine`) VALUES
(2, 'SWConsulting', '1254789630', 'Monastir', 'www.SWConsulting.com', 2),
(3, 'ProxymIT', '7412589632', 'Sousse', 'www.ProxymIT.com', 2),
(4, 'Vermeg', '7893214560', 'Tunis', 'www.Vermeg.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `entretien`
--

CREATE TABLE `entretien` (
  `id_entretien` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` date NOT NULL,
  `salle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_professeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `entretien`
--

INSERT INTO `entretien` (`id_entretien`, `date`, `heure`, `salle`, `id_etudiant`, `id_professeur`) VALUES
(1, '2021-05-10', '2012-12-12', 'A5', 1, 1),
(2, '2021-05-04', '2021-05-12', 'A6', 3, 2),
(3, '2021-05-10', '2012-12-12', 'A7', 4, 1),
(4, '2021-05-04', '2021-05-12', 'A8', 3, 2),
(5, '2021-05-10', '2012-12-12', 'A9', 1, 1),
(6, '2021-05-04', '2021-05-12', 'A10', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `equipe_club`
--

CREATE TABLE `equipe_club` (
  `id_equipe_club` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `equipe_club`
--

INSERT INTO `equipe_club` (`id_equipe_club`, `libelle`) VALUES
(1, 'equipe 1'),
(2, 'equipe 2'),
(3, 'equipe 3');

-- --------------------------------------------------------

--
-- Table structure for table `etablissement`
--

CREATE TABLE `etablissement` (
  `id_etablissement` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code_postale` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gouvernorat_adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etablissement`
--

INSERT INTO `etablissement` (`id_etablissement`, `libelle`, `code_postale`, `rue`, `ville`, `gouvernorat_adresse`, `pays`) VALUES
(2, 'ISET Rades', '5125', 'Rue rades', 'rades', 'Ben Arous', 'Tunis'),
(3, 'ISET Mahdia', '5045', 'rue hiboun', 'sidi messaoud', 'Mahdia', 'Tunis');

-- --------------------------------------------------------

--
-- Table structure for table `etat_demande_master`
--

CREATE TABLE `etat_demande_master` (
  `id_etat_demande_master` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_demande_master`
--

INSERT INTO `etat_demande_master` (`id_etat_demande_master`, `libelle`) VALUES
(1, 'Accepter'),
(2, 'Refuser'),
(3, 'En Cours');

-- --------------------------------------------------------

--
-- Table structure for table `etat_demande_stage_entreprise`
--

CREATE TABLE `etat_demande_stage_entreprise` (
  `id_etat_demande_stage_entreprise` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_demande_stage_entreprise`
--

INSERT INTO `etat_demande_stage_entreprise` (`id_etat_demande_stage_entreprise`, `libelle`) VALUES
(1, 'etat demande stage entreprise 1'),
(2, 'etat demande stage entreprise 2'),
(3, 'etat demande stage entreprise 3'),
(4, 'etat demande stage entreprise 4');

-- --------------------------------------------------------

--
-- Table structure for table `etat_demande_stage_etudiant`
--

CREATE TABLE `etat_demande_stage_etudiant` (
  `id_etat_demande_stage_etudiant` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_demande_stage_etudiant`
--

INSERT INTO `etat_demande_stage_etudiant` (`id_etat_demande_stage_etudiant`, `libelle`) VALUES
(1, 'etat demande stage etudiant 1'),
(2, 'etat demande stage etudiant 2'),
(3, 'etat demande stage etudiant 3'),
(4, 'etat demande stage etudiant 4');

-- --------------------------------------------------------

--
-- Table structure for table `etat_offre_stage`
--

CREATE TABLE `etat_offre_stage` (
  `id_etat_offre_stage` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_offre_stage`
--

INSERT INTO `etat_offre_stage` (`id_etat_offre_stage`, `libelle`) VALUES
(1, 'offre 1'),
(2, 'offre 2');

-- --------------------------------------------------------

--
-- Table structure for table `etat_presence_enseignant`
--

CREATE TABLE `etat_presence_enseignant` (
  `id_etat_presence_enseignant` int(11) NOT NULL,
  `libelle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_presence_enseignant`
--

INSERT INTO `etat_presence_enseignant` (`id_etat_presence_enseignant`, `libelle`) VALUES
(1, 0),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `etat_presence_etudiant`
--

CREATE TABLE `etat_presence_etudiant` (
  `id_etat_presence_etudiant` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_presence_etudiant`
--

INSERT INTO `etat_presence_etudiant` (`id_etat_presence_etudiant`, `libelle`) VALUES
(1, 'present '),
(2, 'Absent');

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `id_situation_etudiont` int(11) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `id_situation_etudiont`, `id_departement`, `id_user`) VALUES
(1, 1, 3, 1),
(3, 1, 5, 1),
(4, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `evenement`
--

CREATE TABLE `evenement` (
  `id_event` int(11) NOT NULL,
  `date` date NOT NULL,
  `duree` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `heure` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `id_club` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url_fichier` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `evenement`
--

INSERT INTO `evenement` (`id_event`, `date`, `duree`, `heure`, `nom`, `prix`, `id_club`, `description`, `url_fichier`) VALUES
(1, '2021-04-01', '2 Heures', '12h', 'Improve Your Skills in IOT', 0, 2, 'Improve Your Skills in IOT', '');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `id_experience` int(11) NOT NULL,
  `nom_entreprise` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id_experience`, `nom_entreprise`, `date_debut`, `date_fin`, `description`, `post`) VALUES
(1, 'google', '2021-01-01', '2021-05-10', 'desc', 'web developer'),
(2, 'facebook', '2021-01-01', '2021-05-10', 'desc', 'front-end developer');

-- --------------------------------------------------------

--
-- Table structure for table `inscription`
--

CREATE TABLE `inscription` (
  `id_inscription` int(11) NOT NULL,
  `date_inscription` date NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `inscription`
--

INSERT INTO `inscription` (`id_inscription`, `date_inscription`, `id_classe`, `id_etudiant`) VALUES
(1, '2020-11-10', 1, 1),
(2, '2020-12-01', 2, 3),
(3, '2020-10-20', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `master`
--

CREATE TABLE `master` (
  `id_master` int(11) NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_departement` int(11) NOT NULL,
  `seuil_admission` int(11) NOT NULL,
  `seuil_admis_attente` int(11) NOT NULL,
  `date_fin_master` date NOT NULL,
  `id_etablissement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master`
--

INSERT INTO `master` (`id_master`, `nom`, `id_departement`, `seuil_admission`, `seuil_admis_attente`, `date_fin_master`, `id_etablissement`) VALUES
(1, 'MPDAM', 3, 60, 58, '2021-07-15', 2),
(2, 'BI', 3, 60, 58, '2021-07-20', 2);

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `charge_horaire` int(11) NOT NULL,
  `id_type_enseignement` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `libelle`, `charge_horaire`, `id_type_enseignement`, `id_semestre`, `id_niveau`) VALUES
(1, 'dev web', 10, 1, 1, 3),
(2, 'dev mobile', 6, 2, 2, 4),
(3, 'methodologie agile', 15, 1, 1, 3),
(4, 'projet personnel ', 15, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `membre`
--

CREATE TABLE `membre` (
  `id_membre` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `motdepasse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_role_membre_club` int(11) NOT NULL,
  `equipe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `membre`
--

INSERT INTO `membre` (`id_membre`, `username`, `motdepasse`, `id_role_membre_club`, `equipe`) VALUES
(1, 'membre 1', 'membre12345', 1, 'equipe 1'),
(2, 'membre 2', 'membre12345', 2, 'equipe 2'),
(3, 'membre 3', 'membre12345', 1, 'equipe 3');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `message_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_status_messages` int(11) NOT NULL,
  `url_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_message` date NOT NULL,
  `id_user_sender` int(11) NOT NULL,
  `id_user_receiver` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id_message`, `message_text`, `id_status_messages`, `url_file`, `date_message`, `id_user_sender`, `id_user_receiver`) VALUES
(1, 'hello', 1, '', '2021-05-11', 4, 1),
(2, 'hi', 1, '', '2021-05-11', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

CREATE TABLE `niveau` (
  `id_niveau` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `niveau`
--

INSERT INTO `niveau` (`id_niveau`, `libelle`) VALUES
(2, '1'),
(3, '2'),
(4, '3');

-- --------------------------------------------------------

--
-- Table structure for table `offre_stage`
--

CREATE TABLE `offre_stage` (
  `id_offre_stage` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `duree` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `id_etat_offre_stage` int(11) NOT NULL,
  `cahier_charge` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_responsable_entreprise` int(11) NOT NULL,
  `nbr_vue` int(11) NOT NULL DEFAULT '0',
  `nbr_postulation` int(11) NOT NULL DEFAULT '0',
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Aucune description '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `offre_stage`
--

INSERT INTO `offre_stage` (`id_offre_stage`, `type`, `duree`, `date_debut`, `date_fin`, `id_etat_offre_stage`, `cahier_charge`, `id_responsable_entreprise`, `nbr_vue`, `nbr_postulation`, `titre`, `description`) VALUES
(7, 'pfe', 3, '2021-01-01', '2021-03-31', 1, '', 2, 0, 0, 'stage de fin d\'etude', 'Aucune description '),
(8, 'initiation', 3, '2021-01-01', '2021-03-31', 2, '', 3, 0, 0, 'stage de fin d\'etude', 'Aucune description ');

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE `option` (
  `id_option` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_parcours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `option`
--

INSERT INTO `option` (`id_option`, `libelle`, `id_niveau`, `id_parcours`) VALUES
(1, 'option', 2, 1),
(2, 'option 2', 3, 1),
(3, 'option 2', 4, 1),
(4, 'option 3', 2, 1),
(5, 'option 4', 3, 1),
(6, 'option 5', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `papier_administratif`
--

CREATE TABLE `papier_administratif` (
  `id_papier` int(11) NOT NULL,
  `raison` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `id_type_papier` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_statut_papier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `papier_administratif`
--

INSERT INTO `papier_administratif` (`id_papier`, `raison`, `date`, `id_type_papier`, `id_user`, `id_statut_papier`) VALUES
(1, NULL, '2021-05-10', 1, 1, 1),
(2, NULL, '2021-05-10', 2, 2, 2),
(3, NULL, '2021-05-09', 1, 3, 1),
(4, '333', '2021-05-19', 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE `parameter` (
  `ref` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(350) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcours`
--

CREATE TABLE `parcours` (
  `id_parcours` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parcours`
--

INSERT INTO `parcours` (`id_parcours`, `libelle`) VALUES
(1, 'Licence'),
(2, 'Mastere ');

-- --------------------------------------------------------

--
-- Table structure for table `participer_club`
--

CREATE TABLE `participer_club` (
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_club` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `participer_club`
--

INSERT INTO `participer_club` (`date_debut`, `date_fin`, `id_etudiant`, `id_club`) VALUES
('2021-05-05', '2021-05-28', 3, 1),
('2021-05-02', '2021-05-19', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `participer_event`
--

CREATE TABLE `participer_event` (
  `id_etudiant` int(11) NOT NULL,
  `id_evenement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `participer_event`
--

INSERT INTO `participer_event` (`id_etudiant`, `id_evenement`) VALUES
(1, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `poste_entreprise`
--

CREATE TABLE `poste_entreprise` (
  `id_poste` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `poste_entreprise`
--

INSERT INTO `poste_entreprise` (`id_poste`, `description`) VALUES
(1, 'directeur'),
(2, 'secretaire'),
(3, 'front-end developer'),
(4, 'back-end developer'),
(5, 'graphic design'),
(6, 'mobile developer');

-- --------------------------------------------------------

--
-- Table structure for table `presence_enseignant`
--

CREATE TABLE `presence_enseignant` (
  `id_enseignement` int(11) NOT NULL,
  `etat` int(1) NOT NULL DEFAULT '0',
  `id_presence_enseignant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `presence_enseignant`
--

INSERT INTO `presence_enseignant` (`id_enseignement`, `etat`, `id_presence_enseignant`) VALUES
(4, 0, 1),
(3, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `presence_etudiant`
--

CREATE TABLE `presence_etudiant` (
  `id_presence` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_enseignement` int(11) NOT NULL,
  `etat_presence_etd` int(1) NOT NULL DEFAULT '0',
  `localisation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL,
  `id_seance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `presence_etudiant`
--

INSERT INTO `presence_etudiant` (`id_presence`, `id_etudiant`, `id_enseignement`, `etat_presence_etd`, `localisation`, `time`, `id_seance`) VALUES
(1, 4, 4, 1, 'loc', '2021-05-11', 6),
(2, 3, 3, 0, 'loc', '2021-05-26', 2);

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

CREATE TABLE `professeur` (
  `id_professeur` int(11) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `id_option` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `professeur`
--

INSERT INTO `professeur` (`id_professeur`, `id_departement`, `id_option`, `id_user`) VALUES
(1, 4, 1, 5),
(2, 6, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `publication_club`
--

CREATE TABLE `publication_club` (
  `id_publication` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `heure` int(11) NOT NULL,
  `url_document` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `publication_club`
--

INSERT INTO `publication_club` (`id_publication`, `description`, `date`, `heure`, `url_document`, `id_member`) VALUES
(1, 'description', '2021-05-11', 12, 'c://doc/d1.pdf', 1),
(2, 'description', '2021-05-27', 14, 'c://doc/d2.pdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reclamation`
--

CREATE TABLE `reclamation` (
  `id_reclamation` int(11) NOT NULL,
  `type_reclamation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contenu` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_statut_reclamation` int(11) NOT NULL,
  `date_reclamation` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reclamation`
--

INSERT INTO `reclamation` (`id_reclamation`, `type_reclamation`, `contenu`, `id_statut_reclamation`, `date_reclamation`, `id_user`) VALUES
(6, 'type reclamation ', 'contenu1', 1, '2021-05-11', 5),
(7, 'type reclamation ', 'contenu2', 2, '2021-05-12', 4),
(8, 'type reclamation ', 'contenu3', 1, '2021-05-11', 5),
(9, 'type reclamation ', 'contenu4', 2, '2021-05-12', 4);

-- --------------------------------------------------------

--
-- Table structure for table `responsable_classe`
--

CREATE TABLE `responsable_classe` (
  `id_responsable_group` int(11) NOT NULL,
  `qualite` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `responsable_classe`
--

INSERT INTO `responsable_classe` (`id_responsable_group`, `qualite`, `id_user`) VALUES
(2, 'Chef Departement', 4),
(3, 'qualite', 4);

-- --------------------------------------------------------

--
-- Table structure for table `responsable_entreprise`
--

CREATE TABLE `responsable_entreprise` (
  `id_responsable_entreprise` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `id_poste_entreprise` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `responsable_entreprise`
--

INSERT INTO `responsable_entreprise` (`id_responsable_entreprise`, `id_entreprise`, `id_poste_entreprise`, `id_user`) VALUES
(1, 3, 4, 7),
(2, 2, 3, 7),
(3, 4, 5, 7),
(4, 4, 6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `libelle`) VALUES
(2, 'etudiant'),
(3, 'Responsable Classe'),
(4, 'Admin'),
(5, 'Professeur'),
(6, 'enseignant'),
(7, 'responsable entreprise');

-- --------------------------------------------------------

--
-- Table structure for table `role_membre_club`
--

CREATE TABLE `role_membre_club` (
  `id_role_membre_club` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_membre_club`
--

INSERT INTO `role_membre_club` (`id_role_membre_club`, `libelle`) VALUES
(1, 'role 1'),
(2, 'role 2'),
(3, 'role 3'),
(4, 'role 4');

-- --------------------------------------------------------

--
-- Table structure for table `rubrique`
--

CREATE TABLE `rubrique` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `score` double NOT NULL,
  `coefficient` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_entretien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rubrique`
--

INSERT INTO `rubrique` (`id`, `libelle`, `score`, `coefficient`, `id_entretien`) VALUES
(1, 'libelle rubrique', 45, '4', 1),
(2, 'libelle rubrique 2', 30, '4', 2);

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `id_salle` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `capacite` int(11) NOT NULL,
  `localisation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_type_salle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id_salle`, `libelle`, `capacite`, `localisation`, `id_type_salle`) VALUES
(1, 'A1', 25, '', 2),
(8, 'A2', 25, '', 2),
(9, 'A3', 25, '', 2),
(10, 'Lab 1', 20, '', 1),
(11, 'Lab 2', 20, '', 1),
(12, 'A10', 25, '', 2),
(13, 'Lab IOS', 20, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seance`
--

CREATE TABLE `seance` (
  `id_seance` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_debut_seance` time NOT NULL,
  `date_fin_seance` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seance`
--

INSERT INTO `seance` (`id_seance`, `libelle`, `date_debut_seance`, `date_fin_seance`) VALUES
(1, 'S1', '00:08:30', '00:10:00'),
(2, 'S2', '00:10:00', '00:11:30'),
(3, 'S3', '00:11:30', '00:13:00'),
(4, 'S4', '00:13:00', '00:14:30'),
(5, 'S5', '00:14:30', '00:16:00'),
(6, 'S6', '00:16:00', '00:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `semestre`
--

CREATE TABLE `semestre` (
  `id_semestre` int(11) NOT NULL,
  `num_semestre` int(11) NOT NULL,
  `date_debut_annee_univ` date NOT NULL,
  `date_fin_annee_univ` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `semestre`
--

INSERT INTO `semestre` (`id_semestre`, `num_semestre`, `date_debut_annee_univ`, `date_fin_annee_univ`) VALUES
(1, 1, '2020-09-15', '2021-01-10'),
(2, 2, '2021-01-11', '2021-06-20');

-- --------------------------------------------------------

--
-- Table structure for table `situation_etudiont`
--

CREATE TABLE `situation_etudiont` (
  `id_situation_etudiont` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `situation_etudiont`
--

INSERT INTO `situation_etudiont` (`id_situation_etudiont`, `libelle`) VALUES
(1, 'celibataire'),
(2, 'Mariee'),
(3, 'divorce');

-- --------------------------------------------------------

--
-- Table structure for table `sondage`
--

CREATE TABLE `sondage` (
  `id_sondage` int(11) NOT NULL,
  `date_sondage` date NOT NULL,
  `heure_sondage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_membre` int(11) NOT NULL,
  `titre` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_club` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sondage`
--

INSERT INTO `sondage` (`id_sondage`, `date_sondage`, `heure_sondage`, `id_membre`, `titre`, `id_club`) VALUES
(4, '2021-05-04', '14:00:21', 1, 'titre sondage', 1),
(5, '2021-05-02', '13:05:30', 2, 'titre_sondage', 2),
(6, '2021-05-04', '17:00:21', 3, 'titre sondage', 1),
(7, '2021-05-02', '18:05:30', 2, 'titre_sondage', 2);

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

CREATE TABLE `specialite` (
  `id_specialite` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_domaine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `specialite`
--

INSERT INTO `specialite` (`id_specialite`, `libelle`, `id_domaine`) VALUES
(2, 'DSI', 2),
(3, 'RSI', 2),
(4, 'MDW', 2),
(5, 'SEM', 2);

-- --------------------------------------------------------

--
-- Table structure for table `status_contact`
--

CREATE TABLE `status_contact` (
  `id_status_contact` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status_contact`
--

INSERT INTO `status_contact` (`id_status_contact`, `libelle`) VALUES
(1, 'status contact 1'),
(2, 'status contact 2');

-- --------------------------------------------------------

--
-- Table structure for table `status_messages`
--

CREATE TABLE `status_messages` (
  `id_status_messages` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status_messages`
--

INSERT INTO `status_messages` (`id_status_messages`, `libelle`) VALUES
(1, 'status messages 1');

-- --------------------------------------------------------

--
-- Table structure for table `statut_demande_club`
--

CREATE TABLE `statut_demande_club` (
  `id_statut_demande_club` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut_demande_club`
--

INSERT INTO `statut_demande_club` (`id_statut_demande_club`, `libelle`) VALUES
(1, 'statut 1'),
(2, 'statut 2');

-- --------------------------------------------------------

--
-- Table structure for table `statut_enseignement`
--

CREATE TABLE `statut_enseignement` (
  `id_statut_enseignement` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut_enseignement`
--

INSERT INTO `statut_enseignement` (`id_statut_enseignement`, `libelle`) VALUES
(1, 'Statut 1'),
(2, 'Statut 2');

-- --------------------------------------------------------

--
-- Table structure for table `statut_papier`
--

CREATE TABLE `statut_papier` (
  `id_statut_papier` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut_papier`
--

INSERT INTO `statut_papier` (`id_statut_papier`, `libelle`) VALUES
(1, 'Statut 1'),
(2, 'Statut 2');

-- --------------------------------------------------------

--
-- Table structure for table `statut_reclamation`
--

CREATE TABLE `statut_reclamation` (
  `id_statut_reclamation` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut_reclamation`
--

INSERT INTO `statut_reclamation` (`id_statut_reclamation`, `libelle`) VALUES
(1, 'Statut 1'),
(2, 'Statut 2');

-- --------------------------------------------------------

--
-- Table structure for table `TMP_DATA`
--

CREATE TABLE `TMP_DATA` (
  `ref` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_enseignement`
--

CREATE TABLE `type_enseignement` (
  `id_type_enseignant` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_enseignement`
--

INSERT INTO `type_enseignement` (`id_type_enseignant`, `libelle`) VALUES
(1, 'Presentielle '),
(2, 'a distance');

-- --------------------------------------------------------

--
-- Table structure for table `type_papier`
--

CREATE TABLE `type_papier` (
  `id_type_papier` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_papier`
--

INSERT INTO `type_papier` (`id_type_papier`, `libelle`) VALUES
(1, 'type 1'),
(2, 'type 2');

-- --------------------------------------------------------

--
-- Table structure for table `type_salle`
--

CREATE TABLE `type_salle` (
  `id_typeSalle` int(11) NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_salle`
--

INSERT INTO `type_salle` (`id_typeSalle`, `libelle`) VALUES
(1, 'Laboratoire'),
(2, 'salle de cours');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `cin` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sexe` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `num_passport` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `gouvern_naissance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `id_role`, `id_user`, `nom`, `prenom`, `age`, `cin`, `sexe`, `num_passport`, `date_naissance`, `gouvern_naissance`) VALUES
('kaarimbouzid@gmail.com', '123456789', 2, 1, 'Bouzid', 'Karim', 23, '06993131', 'homme', '06993131', '1997-09-20', 'monastir'),
('ilyeshrizi@gmail.com', '123456', 2, 2, 'Hrizi', 'Ilyes', 23, '06887755', 'homme', '06887755', '1997-11-05', 'gabes'),
('test@gmail.com', '12345', 4, 3, 'test', 'test', 22, '11111111', 'Homme', '11111111', '1994-02-10', 'tunis'),
('hanen@gmail.com', '12345', 3, 4, 'hanen', 'aissa', 22, '45454545', 'Femme', '45454545', '1998-01-01', 'ben arous'),
('beji@gmail.com', '12345', 5, 5, 'Sofien', 'Beji', 49, '52525252', 'Homme', '52525252', '1980-02-10', 'tunis'),
('habib@gmail.com', '123456', 6, 6, 'smei', 'habib', 50, '12457896', 'homme', '12457896', '2020-10-06', 'tunis'),
('responsable@gmail.com', '123456', 7, 7, 'jbeli', 'mohamed ali', 24, '06875421', 'homme', '06875421', '1996-11-26', 'tunis');

-- --------------------------------------------------------

--
-- Table structure for table `vote_sondage`
--

CREATE TABLE `vote_sondage` (
  `id_membre` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `statut` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_sondage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adresse`),
  ADD KEY `FK_PersonOrderml6` (`id_user`);

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`),
  ADD KEY `FK_PersonOrder7` (`id_responsable`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id_club`),
  ADD KEY `id_domaine` (`id_domaine`);

--
-- Indexes for table `commentaire_publication`
--
ALTER TABLE `commentaire_publication`
  ADD PRIMARY KEY (`id_commentaire`),
  ADD KEY `id_membre` (`id_membre`),
  ADD KEY `fk_pub_cmtre` (`id_publication`);

--
-- Indexes for table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`id_competence`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`),
  ADD KEY `id_status_contact` (`id_status_contact`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `cursus`
--
ALTER TABLE `cursus`
  ADD PRIMARY KEY (`id_cursus`),
  ADD KEY `FK_PersonOrder36` (`id_domaine`),
  ADD KEY `FK_PersonOrder37` (`id_etablissement`),
  ADD KEY `FK_PersonOrder38` (`id_specialite`),
  ADD KEY `id_niveau` (`id_niveau`),
  ADD KEY `id_etudiant` (`id_etudiant`);

--
-- Indexes for table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`id_cv`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `FK_PersonOrder41` (`id_competence`),
  ADD KEY `FK_PersonOrder40` (`id_experience`);

--
-- Indexes for table `demande_club`
--
ALTER TABLE `demande_club`
  ADD PRIMARY KEY (`id_demande_club`),
  ADD KEY `id_club` (`id_club`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_statut_demande_club` (`id_statut_demande_club`);

--
-- Indexes for table `demande_master`
--
ALTER TABLE `demande_master`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_master` (`id_master`),
  ADD KEY `etat_demande_master` (`id_etat_demande_master`);

--
-- Indexes for table `demande_stage_entreprise`
--
ALTER TABLE `demande_stage_entreprise`
  ADD PRIMARY KEY (`id_demande_stage_entreprise`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_offre_stage` (`id_offre_stage`),
  ADD KEY `id_etat_demande_stage_entreprise` (`id_etat_demande_stage_entreprise`);

--
-- Indexes for table `demande_stage_etudiant`
--
ALTER TABLE `demande_stage_etudiant`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `demande_stage_etudiant_ibfk_2` (`id_etat_demande_stage_etudiant`);

--
-- Indexes for table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id_departement`);

--
-- Indexes for table `domaine`
--
ALTER TABLE `domaine`
  ADD PRIMARY KEY (`id_domaine`);

--
-- Indexes for table `enseignement`
--
ALTER TABLE `enseignement`
  ADD PRIMARY KEY (`id_enseignement`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_matiere` (`id_matiere`),
  ADD KEY `id_salle` (`id_salle`),
  ADD KEY `id_seance` (`id_seance`),
  ADD KEY `id_statut_enseignement` (`id_statut_enseignement`),
  ADD KEY `enseignement_ibfk_7` (`id_enseignant`);

--
-- Indexes for table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id_entreprises`),
  ADD KEY `id_domaine` (`id_domaine`);

--
-- Indexes for table `entretien`
--
ALTER TABLE `entretien`
  ADD PRIMARY KEY (`id_entretien`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_professeur` (`id_professeur`);

--
-- Indexes for table `equipe_club`
--
ALTER TABLE `equipe_club`
  ADD PRIMARY KEY (`id_equipe_club`);

--
-- Indexes for table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id_etablissement`);

--
-- Indexes for table `etat_demande_master`
--
ALTER TABLE `etat_demande_master`
  ADD PRIMARY KEY (`id_etat_demande_master`);

--
-- Indexes for table `etat_demande_stage_entreprise`
--
ALTER TABLE `etat_demande_stage_entreprise`
  ADD PRIMARY KEY (`id_etat_demande_stage_entreprise`);

--
-- Indexes for table `etat_demande_stage_etudiant`
--
ALTER TABLE `etat_demande_stage_etudiant`
  ADD PRIMARY KEY (`id_etat_demande_stage_etudiant`);

--
-- Indexes for table `etat_offre_stage`
--
ALTER TABLE `etat_offre_stage`
  ADD PRIMARY KEY (`id_etat_offre_stage`);

--
-- Indexes for table `etat_presence_enseignant`
--
ALTER TABLE `etat_presence_enseignant`
  ADD PRIMARY KEY (`id_etat_presence_enseignant`);

--
-- Indexes for table `etat_presence_etudiant`
--
ALTER TABLE `etat_presence_etudiant`
  ADD PRIMARY KEY (`id_etat_presence_etudiant`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD KEY `id_departement` (`id_departement`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_situation` (`id_situation_etudiont`);

--
-- Indexes for table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `id_club` (`id_club`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id_experience`);

--
-- Indexes for table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id_inscription`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_etudiant` (`id_etudiant`);

--
-- Indexes for table `master`
--
ALTER TABLE `master`
  ADD PRIMARY KEY (`id_master`),
  ADD KEY `id_departement` (`id_departement`),
  ADD KEY `id_etablissement` (`id_etablissement`);

--
-- Indexes for table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_matiere`),
  ADD KEY `id_niveau` (`id_niveau`),
  ADD KEY `id_semestre` (`id_semestre`),
  ADD KEY `id_type_enseignement` (`id_type_enseignement`);

--
-- Indexes for table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id_membre`),
  ADD KEY `id_role_membre_club` (`id_role_membre_club`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `id_user_receiver` (`id_user_receiver`),
  ADD KEY `id_user_sender` (`id_user_sender`),
  ADD KEY `id_status_messages` (`id_status_messages`);

--
-- Indexes for table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id_niveau`);

--
-- Indexes for table `offre_stage`
--
ALTER TABLE `offre_stage`
  ADD PRIMARY KEY (`id_offre_stage`),
  ADD KEY `id_entreprise` (`id_responsable_entreprise`),
  ADD KEY `id_etat_offre_stage` (`id_etat_offre_stage`);

--
-- Indexes for table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`id_option`),
  ADD KEY `id_niveau` (`id_niveau`),
  ADD KEY `id_parcours` (`id_parcours`);

--
-- Indexes for table `papier_administratif`
--
ALTER TABLE `papier_administratif`
  ADD PRIMARY KEY (`id_papier`),
  ADD KEY `id_etudiant` (`id_user`),
  ADD KEY `id_type_papier` (`id_type_papier`),
  ADD KEY `id_statut_papier` (`id_statut_papier`);

--
-- Indexes for table `parameter`
--
ALTER TABLE `parameter`
  ADD PRIMARY KEY (`ref`);

--
-- Indexes for table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`id_parcours`);

--
-- Indexes for table `participer_club`
--
ALTER TABLE `participer_club`
  ADD PRIMARY KEY (`id_etudiant`,`id_club`),
  ADD KEY `id_club` (`id_club`);

--
-- Indexes for table `participer_event`
--
ALTER TABLE `participer_event`
  ADD PRIMARY KEY (`id_etudiant`,`id_evenement`),
  ADD KEY `id_evenement` (`id_evenement`);

--
-- Indexes for table `poste_entreprise`
--
ALTER TABLE `poste_entreprise`
  ADD PRIMARY KEY (`id_poste`);

--
-- Indexes for table `presence_enseignant`
--
ALTER TABLE `presence_enseignant`
  ADD PRIMARY KEY (`id_presence_enseignant`),
  ADD KEY `id_enseignement` (`id_enseignement`);

--
-- Indexes for table `presence_etudiant`
--
ALTER TABLE `presence_etudiant`
  ADD PRIMARY KEY (`id_presence`),
  ADD KEY `id_enseignement` (`id_enseignement`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_seance` (`id_seance`);

--
-- Indexes for table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id_professeur`),
  ADD KEY `id_departement` (`id_departement`),
  ADD KEY `id_option` (`id_option`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `publication_club`
--
ALTER TABLE `publication_club`
  ADD PRIMARY KEY (`id_publication`),
  ADD KEY `id_member` (`id_member`);

--
-- Indexes for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD PRIMARY KEY (`id_reclamation`),
  ADD KEY `id_etudiant` (`id_user`),
  ADD KEY `id_statut_reclamation` (`id_statut_reclamation`);

--
-- Indexes for table `responsable_classe`
--
ALTER TABLE `responsable_classe`
  ADD PRIMARY KEY (`id_responsable_group`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `responsable_entreprise`
--
ALTER TABLE `responsable_entreprise`
  ADD PRIMARY KEY (`id_responsable_entreprise`),
  ADD KEY `id_poste_entreprise` (`id_poste_entreprise`),
  ADD KEY `id_entreprise` (`id_entreprise`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `role_membre_club`
--
ALTER TABLE `role_membre_club`
  ADD PRIMARY KEY (`id_role_membre_club`);

--
-- Indexes for table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_entretien` (`id_entretien`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`),
  ADD KEY `id_type_salle` (`id_type_salle`);

--
-- Indexes for table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id_seance`);

--
-- Indexes for table `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id_semestre`);

--
-- Indexes for table `situation_etudiont`
--
ALTER TABLE `situation_etudiont`
  ADD PRIMARY KEY (`id_situation_etudiont`);

--
-- Indexes for table `sondage`
--
ALTER TABLE `sondage`
  ADD PRIMARY KEY (`id_sondage`),
  ADD KEY `id_club` (`id_club`),
  ADD KEY `id_membre` (`id_membre`);

--
-- Indexes for table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`id_specialite`),
  ADD KEY `id_domaine` (`id_domaine`);

--
-- Indexes for table `status_contact`
--
ALTER TABLE `status_contact`
  ADD PRIMARY KEY (`id_status_contact`);

--
-- Indexes for table `status_messages`
--
ALTER TABLE `status_messages`
  ADD PRIMARY KEY (`id_status_messages`);

--
-- Indexes for table `statut_demande_club`
--
ALTER TABLE `statut_demande_club`
  ADD PRIMARY KEY (`id_statut_demande_club`);

--
-- Indexes for table `statut_enseignement`
--
ALTER TABLE `statut_enseignement`
  ADD PRIMARY KEY (`id_statut_enseignement`);

--
-- Indexes for table `statut_papier`
--
ALTER TABLE `statut_papier`
  ADD PRIMARY KEY (`id_statut_papier`);

--
-- Indexes for table `statut_reclamation`
--
ALTER TABLE `statut_reclamation`
  ADD PRIMARY KEY (`id_statut_reclamation`);

--
-- Indexes for table `TMP_DATA`
--
ALTER TABLE `TMP_DATA`
  ADD PRIMARY KEY (`ref`);

--
-- Indexes for table `type_enseignement`
--
ALTER TABLE `type_enseignement`
  ADD PRIMARY KEY (`id_type_enseignant`);

--
-- Indexes for table `type_papier`
--
ALTER TABLE `type_papier`
  ADD PRIMARY KEY (`id_type_papier`);

--
-- Indexes for table `type_salle`
--
ALTER TABLE `type_salle`
  ADD PRIMARY KEY (`id_typeSalle`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `vote_sondage`
--
ALTER TABLE `vote_sondage`
  ADD PRIMARY KEY (`id_membre`,`id_sondage`),
  ADD KEY `id_membre` (`id_membre`,`id_sondage`),
  ADD KEY `fk_sondage_vote` (`id_sondage`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT COMMENT 'exemple : MPDAM, L3-DSI2', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `id_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `commentaire_publication`
--
ALTER TABLE `commentaire_publication`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `competence`
--
ALTER TABLE `competence`
  MODIFY `id_competence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cursus`
--
ALTER TABLE `cursus`
  MODIFY `id_cursus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cv`
--
ALTER TABLE `cv`
  MODIFY `id_cv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `demande_club`
--
ALTER TABLE `demande_club`
  MODIFY `id_demande_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `demande_master`
--
ALTER TABLE `demande_master`
  MODIFY `id_demande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `demande_stage_entreprise`
--
ALTER TABLE `demande_stage_entreprise`
  MODIFY `id_demande_stage_entreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `demande_stage_etudiant`
--
ALTER TABLE `demande_stage_etudiant`
  MODIFY `id_demande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departement`
--
ALTER TABLE `departement`
  MODIFY `id_departement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `domaine`
--
ALTER TABLE `domaine`
  MODIFY `id_domaine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enseignement`
--
ALTER TABLE `enseignement`
  MODIFY `id_enseignement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id_entreprises` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `entretien`
--
ALTER TABLE `entretien`
  MODIFY `id_entretien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `equipe_club`
--
ALTER TABLE `equipe_club`
  MODIFY `id_equipe_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id_etablissement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `etat_demande_master`
--
ALTER TABLE `etat_demande_master`
  MODIFY `id_etat_demande_master` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `etat_demande_stage_entreprise`
--
ALTER TABLE `etat_demande_stage_entreprise`
  MODIFY `id_etat_demande_stage_entreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `etat_demande_stage_etudiant`
--
ALTER TABLE `etat_demande_stage_etudiant`
  MODIFY `id_etat_demande_stage_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `etat_offre_stage`
--
ALTER TABLE `etat_offre_stage`
  MODIFY `id_etat_offre_stage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `etat_presence_enseignant`
--
ALTER TABLE `etat_presence_enseignant`
  MODIFY `id_etat_presence_enseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `etat_presence_etudiant`
--
ALTER TABLE `etat_presence_etudiant`
  MODIFY `id_etat_presence_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id_experience` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id_inscription` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `master`
--
ALTER TABLE `master`
  MODIFY `id_master` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_matiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `membre`
--
ALTER TABLE `membre`
  MODIFY `id_membre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id_niveau` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `offre_stage`
--
ALTER TABLE `offre_stage`
  MODIFY `id_offre_stage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `option`
--
ALTER TABLE `option`
  MODIFY `id_option` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `papier_administratif`
--
ALTER TABLE `papier_administratif`
  MODIFY `id_papier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `id_parcours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `poste_entreprise`
--
ALTER TABLE `poste_entreprise`
  MODIFY `id_poste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `presence_enseignant`
--
ALTER TABLE `presence_enseignant`
  MODIFY `id_presence_enseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `presence_etudiant`
--
ALTER TABLE `presence_etudiant`
  MODIFY `id_presence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id_professeur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `publication_club`
--
ALTER TABLE `publication_club`
  MODIFY `id_publication` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reclamation`
--
ALTER TABLE `reclamation`
  MODIFY `id_reclamation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `responsable_classe`
--
ALTER TABLE `responsable_classe`
  MODIFY `id_responsable_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `responsable_entreprise`
--
ALTER TABLE `responsable_entreprise`
  MODIFY `id_responsable_entreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_membre_club`
--
ALTER TABLE `role_membre_club`
  MODIFY `id_role_membre_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `id_salle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `seance`
--
ALTER TABLE `seance`
  MODIFY `id_seance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id_semestre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `situation_etudiont`
--
ALTER TABLE `situation_etudiont`
  MODIFY `id_situation_etudiont` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sondage`
--
ALTER TABLE `sondage`
  MODIFY `id_sondage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `id_specialite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `status_contact`
--
ALTER TABLE `status_contact`
  MODIFY `id_status_contact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_messages`
--
ALTER TABLE `status_messages`
  MODIFY `id_status_messages` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statut_demande_club`
--
ALTER TABLE `statut_demande_club`
  MODIFY `id_statut_demande_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statut_enseignement`
--
ALTER TABLE `statut_enseignement`
  MODIFY `id_statut_enseignement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statut_papier`
--
ALTER TABLE `statut_papier`
  MODIFY `id_statut_papier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statut_reclamation`
--
ALTER TABLE `statut_reclamation`
  MODIFY `id_statut_reclamation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_enseignement`
--
ALTER TABLE `type_enseignement`
  MODIFY `id_type_enseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_papier`
--
ALTER TABLE `type_papier`
  MODIFY `id_type_papier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_salle`
--
ALTER TABLE `type_salle`
  MODIFY `id_typeSalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FK_PersonOrderml6` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_PersonOrder7` FOREIGN KEY (`id_responsable`) REFERENCES `responsable_classe` (`id_responsable_group`);

--
-- Constraints for table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`id_status_contact`) REFERENCES `status_contact` (`id_status_contact`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cursus`
--
ALTER TABLE `cursus`
  ADD CONSTRAINT `FK_PersonOrder36` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`),
  ADD CONSTRAINT `FK_PersonOrder37` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`),
  ADD CONSTRAINT `FK_PersonOrder38` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`),
  ADD CONSTRAINT `cursus_ibfk_1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`),
  ADD CONSTRAINT `cursus_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `FK_PersonOrder40` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`),
  ADD CONSTRAINT `FK_PersonOrder41` FOREIGN KEY (`id_competence`) REFERENCES `competence` (`id_competence`),
  ADD CONSTRAINT `cv_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `demande_club`
--
ALTER TABLE `demande_club`
  ADD CONSTRAINT `demande_club_ibfk_1` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `demande_club_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `demande_club_ibfk_3` FOREIGN KEY (`id_statut_demande_club`) REFERENCES `statut_demande_club` (`id_statut_demande_club`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `demande_master`
--
ALTER TABLE `demande_master`
  ADD CONSTRAINT `demande_master_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `demande_master_ibfk_2` FOREIGN KEY (`id_master`) REFERENCES `master` (`id_master`),
  ADD CONSTRAINT `demande_master_ibfk_3` FOREIGN KEY (`id_etat_demande_master`) REFERENCES `etat_demande_master` (`id_etat_demande_master`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `demande_stage_entreprise`
--
ALTER TABLE `demande_stage_entreprise`
  ADD CONSTRAINT `demande_stage_entreprise_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `demande_stage_entreprise_ibfk_2` FOREIGN KEY (`id_offre_stage`) REFERENCES `offre_stage` (`id_offre_stage`),
  ADD CONSTRAINT `demande_stage_entreprise_ibfk_3` FOREIGN KEY (`id_etat_demande_stage_entreprise`) REFERENCES `etat_demande_stage_entreprise` (`id_etat_demande_stage_entreprise`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `demande_stage_etudiant`
--
ALTER TABLE `demande_stage_etudiant`
  ADD CONSTRAINT `demande_stage_etudiant_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `demande_stage_etudiant_ibfk_2` FOREIGN KEY (`id_etat_demande_stage_etudiant`) REFERENCES `etat_demande_stage_etudiant` (`id_etat_demande_stage_etudiant`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `enseignement`
--
ALTER TABLE `enseignement`
  ADD CONSTRAINT `enseignement_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `enseignement_ibfk_3` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`),
  ADD CONSTRAINT `enseignement_ibfk_4` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`),
  ADD CONSTRAINT `enseignement_ibfk_5` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`),
  ADD CONSTRAINT `enseignement_ibfk_6` FOREIGN KEY (`id_statut_enseignement`) REFERENCES `type_enseignement` (`id_type_enseignant`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `enseignement_ibfk_7` FOREIGN KEY (`id_enseignant`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `entreprise`
--
ALTER TABLE `entreprise`
  ADD CONSTRAINT `entreprise_ibfk_1` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`);

--
-- Constraints for table `entretien`
--
ALTER TABLE `entretien`
  ADD CONSTRAINT `entretien_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `entretien_ibfk_2` FOREIGN KEY (`id_professeur`) REFERENCES `professeur` (`id_professeur`);

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_3` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_departement`),
  ADD CONSTRAINT `etudiant_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `etudiant_ibfk_5` FOREIGN KEY (`id_situation_etudiont`) REFERENCES `situation_etudiont` (`id_situation_etudiont`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `evenement_ibfk_1` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`);

--
-- Constraints for table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `master`
--
ALTER TABLE `master`
  ADD CONSTRAINT `master_ibfk_1` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_departement`),
  ADD CONSTRAINT `master_ibfk_2` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`);

--
-- Constraints for table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`),
  ADD CONSTRAINT `matiere_ibfk_2` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `matiere_ibfk_3` FOREIGN KEY (`id_type_enseignement`) REFERENCES `type_enseignement` (`id_type_enseignant`);

--
-- Constraints for table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `membre_ibfk_1` FOREIGN KEY (`id_role_membre_club`) REFERENCES `role_membre_club` (`id_role_membre_club`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_user_receiver`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`id_user_sender`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`id_status_messages`) REFERENCES `status_messages` (`id_status_messages`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `offre_stage`
--
ALTER TABLE `offre_stage`
  ADD CONSTRAINT `offre_stage_ibfk_1` FOREIGN KEY (`id_responsable_entreprise`) REFERENCES `responsable_entreprise` (`id_responsable_entreprise`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `offre_stage_ibfk_2` FOREIGN KEY (`id_etat_offre_stage`) REFERENCES `etat_offre_stage` (`id_etat_offre_stage`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `option`
--
ALTER TABLE `option`
  ADD CONSTRAINT `option_ibfk_1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`),
  ADD CONSTRAINT `option_ibfk_2` FOREIGN KEY (`id_parcours`) REFERENCES `parcours` (`id_parcours`);

--
-- Constraints for table `papier_administratif`
--
ALTER TABLE `papier_administratif`
  ADD CONSTRAINT `papier_administratif_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `papier_administratif_ibfk_2` FOREIGN KEY (`id_type_papier`) REFERENCES `type_papier` (`id_type_papier`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `papier_administratif_ibfk_3` FOREIGN KEY (`id_statut_papier`) REFERENCES `statut_papier` (`id_statut_papier`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `participer_club`
--
ALTER TABLE `participer_club`
  ADD CONSTRAINT `participer_club_ibfk_1` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `participer_club_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `participer_event`
--
ALTER TABLE `participer_event`
  ADD CONSTRAINT `participer_event_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `participer_event_ibfk_2` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_event`);

--
-- Constraints for table `presence_enseignant`
--
ALTER TABLE `presence_enseignant`
  ADD CONSTRAINT `presence_enseignant_ibfk_1` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`);

--
-- Constraints for table `presence_etudiant`
--
ALTER TABLE `presence_etudiant`
  ADD CONSTRAINT `presence_etudiant_ibfk_1` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`),
  ADD CONSTRAINT `presence_etudiant_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `presence_etudiant_ibfk_3` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`);

--
-- Constraints for table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_departement`),
  ADD CONSTRAINT `professeur_ibfk_2` FOREIGN KEY (`id_option`) REFERENCES `option` (`id_option`),
  ADD CONSTRAINT `professeur_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `publication_club`
--
ALTER TABLE `publication_club`
  ADD CONSTRAINT `publication_club_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `membre` (`id_membre`);

--
-- Constraints for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD CONSTRAINT `reclamation_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `reclamation_ibfk_2` FOREIGN KEY (`id_statut_reclamation`) REFERENCES `statut_reclamation` (`id_statut_reclamation`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `responsable_classe`
--
ALTER TABLE `responsable_classe`
  ADD CONSTRAINT `responsable_classe_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `responsable_entreprise`
--
ALTER TABLE `responsable_entreprise`
  ADD CONSTRAINT `responsable_entreprise_ibfk_1` FOREIGN KEY (`id_poste_entreprise`) REFERENCES `poste_entreprise` (`id_poste`),
  ADD CONSTRAINT `responsable_entreprise_ibfk_2` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprises`),
  ADD CONSTRAINT `responsable_entreprise_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `rubrique`
--
ALTER TABLE `rubrique`
  ADD CONSTRAINT `rubrique_ibfk_1` FOREIGN KEY (`id_entretien`) REFERENCES `entretien` (`id_entretien`);

--
-- Constraints for table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`id_type_salle`) REFERENCES `type_salle` (`id_typesalle`);

--
-- Constraints for table `sondage`
--
ALTER TABLE `sondage`
  ADD CONSTRAINT `sondage_ibfk_1` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sondage_ibfk_2` FOREIGN KEY (`id_membre`) REFERENCES `membre` (`id_membre`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `specialite`
--
ALTER TABLE `specialite`
  ADD CONSTRAINT `specialite_ibfk_1` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
