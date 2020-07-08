-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2020 at 11:57 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--
-- Creation: Jul 07, 2020 at 10:28 AM
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'J.R.R.', 'Tolkien');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--
-- Creation: Jul 07, 2020 at 10:39 AM
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(89) DEFAULT NULL,
  `fk_author` int(11) DEFAULT NULL,
  `fk_rent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `title`, `fk_author`, `fk_rent_id`) VALUES
(1, 'The Lord of the Rings - The Fellowship of the Ring', 1, 1),
(2, 'The Lord of the Rings - The Two Towers', 1, 2),
(3, 'The Lord of the Rings - The Return of the King', 1, 3),
(4, 'The Hobbit', 1, 4),
(5, 'The Silmarillion', 1, 5),
(6, 'The Children of Húrin', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--
-- Creation: Jul 07, 2020 at 10:38 AM
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `firts_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_c_address` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `firts_name`, `last_name`, `fk_c_address`, `phone`) VALUES
(1, 'John', 'Doe', 1, -4006),
(2, 'Maria', 'Smith', 2, -3836),
(3, 'Jamie', 'Noone', 3, -3838);

-- --------------------------------------------------------

--
-- Table structure for table `c_address`
--
-- Creation: Jul 07, 2020 at 10:36 AM
--

CREATE TABLE `c_address` (
  `c_address_id` int(11) NOT NULL,
  `city` varchar(55) DEFAULT NULL,
  `street_name` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_address`
--

INSERT INTO `c_address` (`c_address_id`, `city`, `street_name`, `country`, `zip_code`) VALUES
(1, 'Budapest', 'Nyugati tér 1.', 'Hungary', 1067),
(2, 'Vienna', 'Mariahilferstrasse 2.', 'Austria', 1060),
(3, 'Prague', 'Václavské náměstí 3.', 'Czech Republic', 110);

-- --------------------------------------------------------

--
-- Table structure for table `library`
--
-- Creation: Jul 07, 2020 at 10:40 AM
--

CREATE TABLE `library` (
  `library_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `fk_l_address` int(11) DEFAULT NULL,
  `fk_book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`library_id`, `name`, `fk_l_address`, `fk_book_id`) VALUES
(1, 'Fővárosi Szabó Ervin Könyvtár', 1, 1),
(2, 'Österreichischen Nationalbibliothek', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `l_address`
--
-- Creation: Jul 07, 2020 at 10:31 AM
--

CREATE TABLE `l_address` (
  `l_address_id` int(11) NOT NULL,
  `city` varchar(55) DEFAULT NULL,
  `street_name` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `l_address`
--

INSERT INTO `l_address` (`l_address_id`, `city`, `street_name`, `country`, `zip_code`) VALUES
(1, 'Budapest', 'Szabó Ervin tér 1', 'Hungary', 1088),
(2, 'Vienna', 'Josefsplatz 1', 'Austria', 1015);

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--
-- Creation: Jul 07, 2020 at 11:35 AM
--

CREATE TABLE `rent` (
  `rent_id` int(11) NOT NULL,
  `rent_date_strt` date DEFAULT NULL,
  `rent_date_end` date DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`rent_id`, `rent_date_strt`, `rent_date_end`, `fk_customer_id`) VALUES
(1, '2020-06-20', '2020-06-28', 1),
(2, '2020-06-28', '2020-07-02', 1),
(3, '2020-06-23', '2020-06-28', 2),
(4, '2020-06-28', '2020-06-30', 2),
(5, '2020-06-21', '2020-06-28', 3),
(6, '2020-06-28', '2020-07-07', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_rent_id` (`fk_rent_id`),
  ADD KEY `fk_author` (`fk_author`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_c_address` (`fk_c_address`);

--
-- Indexes for table `c_address`
--
ALTER TABLE `c_address`
  ADD PRIMARY KEY (`c_address_id`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`library_id`),
  ADD KEY `fk_book_id` (`fk_book_id`),
  ADD KEY `fk_l_address` (`fk_l_address`);

--
-- Indexes for table `l_address`
--
ALTER TABLE `l_address`
  ADD PRIMARY KEY (`l_address_id`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_rent_id`) REFERENCES `rent` (`rent_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_author`) REFERENCES `author` (`author_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_c_address`) REFERENCES `c_address` (`c_address_id`);

--
-- Constraints for table `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `library_ibfk_2` FOREIGN KEY (`fk_l_address`) REFERENCES `l_address` (`l_address_id`);

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
