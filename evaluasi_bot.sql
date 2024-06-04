-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 09:01 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluasi_bot`
--

-- --------------------------------------------------------

--
-- Table structure for table `asisten`
--

CREATE TABLE `asisten` (
  `id_asisten` int(11) NOT NULL,
  `nim_asisten` int(11) NOT NULL,
  `nama_asisten` varchar(100) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asisten`
--

INSERT INTO `asisten` (`id_asisten`, `nim_asisten`, `nama_asisten`, `id_kelas`) VALUES
(1, 71190001, 'Andi', 2),
(2, 71190002, 'Budi', 2),
(3, 71190003, 'Bobi', 3),
(4, 71190004, 'Deni', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nama_dosen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama_dosen`) VALUES
(1, 'Yuan Lukito, S.Kom., M.Cs.'),
(2, 'Matahari Bhakti Nendya, S.Kom., M.T'),
(3, 'Nugroho Agus Haryono, S.Si., M.Si.'),
(4, 'Drs. R. Gunawan Santosa Msi.');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `id_enrollment` int(11) NOT NULL,
  `id_peserta` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`id_enrollment`, `id_peserta`, `id_kelas`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 5),
(4, 2, 1),
(5, 2, 3),
(6, 2, 4),
(7, 3, 3),
(8, 3, 4),
(9, 3, 5),
(10, 4, 2),
(11, 4, 4),
(12, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `input_user`
--

CREATE TABLE `input_user` (
  `id_input` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `input_result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`input_result`)),
  `waktu_input` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `input_user`
--

INSERT INTO `input_user` (`id_input`, `username`, `first_name`, `last_name`, `input_result`, `waktu_input`) VALUES
(2, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9994756350469779, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"halo\", \"traits\": {}}', '2024-05-27 06:30:23'),
(3, 'chvenka', 'chika', 'venesa', '{\"entities\": {}, \"intents\": [], \"text\": \"71220838\", \"traits\": {}}', '2024-05-27 06:34:20'),
(4, 'chvenka', 'chika', 'venesa', '{\"entities\": {}, \"intents\": [], \"text\": \"Maksudnya apa yh\", \"traits\": {}}', '2024-05-27 06:34:43'),
(5, 'chvenka', 'chika', 'venesa', '{\"entities\": {\"pertemuan:pertemuan_ke\": [{\"body\": \"pertemuan \", \"confidence\": 1, \"end\": 94, \"entities\": [], \"id\": \"1151099762870847\", \"name\": \"pertemuan\", \"role\": \"pertemuan_ke\", \"start\": 84, \"type\": \"value\", \"value\": \"9\"}]}, \"intents\": [], \"text\": \"list matakuliah, deskripsi matakuliah, jadwal, pengajar\\ntopik materi pada pertemuan-pertemuan matakuliah, link materi\\nlist pengumuman\\nlist tugas, deadline tugas\\nnilai tugas dari matakuliah\\npresensi matakuliah\", \"traits\": {}}', '2024-05-27 06:40:16'),
(6, 'chvenka', 'chika', 'venesa', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9938544957704443, \"id\": \"2620654441466488\", \"name\": \"daftar_kelas\"}], \"text\": \"list matakuliah\", \"traits\": {}}', '2024-05-27 06:40:24'),
(7, 'chvenka', 'chika', 'venesa', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9856223304887114, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"tugas saya apa aja?\", \"traits\": {}}', '2024-05-27 06:41:14'),
(8, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9790245086499059, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"tes\", \"traits\": {}}', '2024-05-27 06:46:57'),
(9, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9997000402096589, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hii\", \"traits\": {}}', '2024-05-27 06:53:53'),
(10, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9973285231941017, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"k\", \"traits\": {}}', '2024-05-27 07:15:34'),
(11, 'michaelfidef', 'Fidef', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 32, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 23, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [], \"text\": \"presensikan matakuliah statistik\", \"traits\": {}}', '2024-05-27 08:03:10'),
(12, 'michaelfidef', 'Fidef', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 32, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 23, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.8796321955590437, \"id\": \"1205332510468487\", \"name\": \"cek_pengumuman_matakuliah\"}], \"text\": \"pengumuman mata kuliah statistik\", \"traits\": {}}', '2024-05-27 08:06:13'),
(13, 'michaelfidef', 'Fidef', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9510289583361791, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"ada tugas apa saja?\", \"traits\": {}}', '2024-05-27 08:07:21'),
(14, 'michaelfidef', 'Fidef', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9573585202984031, \"id\": \"965041121616853\", \"name\": \"deadline_tugas_terdekat\"}], \"text\": \"deadline tugas yang terdekat\", \"traits\": {}}', '2024-05-27 08:07:59'),
(15, 'michaelfidef', 'Fidef', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"praktikum algoritma\", \"confidence\": 0.999, \"end\": 42, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 23, \"suggested\": true, \"type\": \"value\", \"value\": \"praktikum algoritma\"}], \"tugas:nama_tugas\": [{\"body\": \"tas\", \"confidence\": 1, \"end\": 22, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 19, \"type\": \"value\", \"value\": \"UAS\"}]}, \"intents\": [], \"text\": \"sudah mengumpulkan tas praktikum algoritma?\", \"traits\": {}}', '2024-05-27 08:25:59'),
(16, 'michaelfidef', 'Fidef', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"praktikum algoritma\", \"confidence\": 0.999, \"end\": 43, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 24, \"suggested\": true, \"type\": \"value\", \"value\": \"praktikum algoritma\"}]}, \"intents\": [], \"text\": \"sudah mengmpulkan tugas praktikum algoritma?\", \"traits\": {}}', '2024-05-27 08:25:59'),
(17, 'michaelfidef', 'Fidef', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.8441366580117313, \"id\": \"418784234260265\", \"name\": \"daftar_pengumuman\"}], \"text\": \"pengumuman yang masih ada?\", \"traits\": {}}', '2024-05-27 08:26:03'),
(18, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9998774678668052, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hi\", \"traits\": {}}', '2024-05-27 08:48:25'),
(19, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.999778796504017, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hai\", \"traits\": {}}', '2024-05-27 09:04:18'),
(20, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9994817083514865, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"halo\", \"traits\": {}}', '2024-05-27 09:04:18'),
(21, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.995667829669193, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hewwo\", \"traits\": {}}', '2024-05-27 09:35:56'),
(22, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9955690417782169, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"p\", \"traits\": {}}', '2024-05-27 10:19:09'),
(23, 'cheesecakepud', 'A', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.8510327748699192, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"tampilkan tugas tugas saya\", \"traits\": {}}', '2024-05-27 10:30:26'),
(24, 'cheesecakepud', 'A', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9625886746690973, \"id\": \"965041121616853\", \"name\": \"deadline_tugas_terdekat\"}], \"text\": \"tugas dengan deadline terdekat\", \"traits\": {}}', '2024-05-27 10:30:55'),
(25, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"waktu:jangka_waktu\": [{\"body\": \"minggu ini\", \"confidence\": 0.9995, \"end\": 10, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 0, \"type\": \"value\", \"value\": \"minggu ini\"}]}, \"intents\": [{\"confidence\": 0.8577733314895754, \"id\": \"451006697300342\", \"name\": \"tugas_minggu_ini\"}], \"text\": \"minggu ini ada tugas apa saja\", \"traits\": {}}', '2024-05-27 10:33:07'),
(26, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 26, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 17, \"type\": \"value\", \"value\": \"Statistik\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 4\", \"confidence\": 0.9995, \"end\": 16, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 9, \"type\": \"value\", \"value\": \"Tugas 4\"}]}, \"intents\": [{\"confidence\": 0.8718706943955552, \"id\": \"3081420865331274\", \"name\": \"deadline_tugas_matakuliah\"}], \"text\": \"deadline tugas 4 statistik\", \"traits\": {}}', '2024-05-27 10:33:46'),
(27, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 20, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 11, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.6448310140274989, \"id\": \"965504128218420\", \"name\": \"tugas_terbaru_matakuliah\"}], \"text\": \"tugas baru statistik\", \"traits\": {}}', '2024-05-27 10:34:44'),
(28, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"prakAlpro\", \"confidence\": 0.9995, \"end\": 48, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 39, \"type\": \"value\", \"value\": \"Praktikum Algoritma dan Pemrograman\"}], \"tugas:nama_tugas\": [{\"body\": \"laporan 1\", \"confidence\": 0.9995, \"end\": 38, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 29, \"type\": \"value\", \"value\": \"Laporan 1\"}]}, \"intents\": [{\"confidence\": 0.8742381532402723, \"id\": \"3081420865331274\", \"name\": \"deadline_tugas_matakuliah\"}], \"text\": \"cek status pengumpulan tugas laporan 1 prakAlpro\", \"traits\": {}}', '2024-05-27 10:35:36'),
(29, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"prakAlpro\", \"confidence\": 0.9995, \"end\": 55, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 46, \"type\": \"value\", \"value\": \"Praktikum Algoritma dan Pemrograman\"}], \"tugas:nama_tugas\": [{\"body\": \"laporan 1\", \"confidence\": 0.9995, \"end\": 45, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 36, \"type\": \"value\", \"value\": \"Laporan 1\"}]}, \"intents\": [{\"confidence\": 0.8332573974851112, \"id\": \"2705740909579095\", \"name\": \"cek_tugas_belum_dikumpulkan\"}], \"text\": \"apakah saya sudah menumpulkan tugas laporan 1 prakAlpro\", \"traits\": {}}', '2024-05-27 10:37:06'),
(30, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 45, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 39, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 2\", \"confidence\": 0.9995, \"end\": 38, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 31, \"type\": \"value\", \"value\": \"Tugas 2\"}]}, \"intents\": [], \"text\": \"apakah saya sudah mengunpulkan tugas 2 matdis\", \"traits\": {}}', '2024-05-27 10:38:10'),
(31, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"grup:grup_kelas\": [{\"body\": \"B\", \"confidence\": 0.9995, \"end\": 59, \"entities\": [], \"id\": \"970173261493978\", \"name\": \"grup\", \"role\": \"grup_kelas\", \"start\": 58, \"type\": \"value\", \"value\": \"B\"}], \"matakuliah:nama_matakuliah\": [{\"body\": \"matematika diskrit\", \"confidence\": 0.9995, \"end\": 57, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 39, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 2\", \"confidence\": 0.9995, \"end\": 38, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 31, \"type\": \"value\", \"value\": \"Tugas 2\"}]}, \"intents\": [{\"confidence\": 0.9652844984205315, \"id\": \"956000989872681\", \"name\": \"cek_status_pengumpulan_tugas\"}], \"text\": \"apakah saya sudah mengumpulkan tugas 2 matematika diskrit B\", \"traits\": {}}', '2024-05-27 10:38:47'),
(32, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 17, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 11, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [], \"text\": \"list nilai matdis\", \"traits\": {}}', '2024-05-27 10:39:38'),
(33, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matematika diskrit\", \"confidence\": 0.9995, \"end\": 29, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 11, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.5636903130647983, \"id\": \"807668731298896\", \"name\": \"cek_materi_matakuliah\"}], \"text\": \"list nilai matematika diskrit\", \"traits\": {}}', '2024-05-27 10:39:50'),
(34, 'cheesecakepud', 'A', NULL, '{\"entities\": {}, \"intents\": [], \"text\": \"tugas yang sudah dikumpulkan\", \"traits\": {}}', '2024-05-27 10:41:35'),
(35, 'cheesecakepud', 'A', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9674178644157291, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"list tugas\", \"traits\": {}}', '2024-05-27 10:41:48'),
(36, 'cheesecakepud', 'A', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9845205109996539, \"id\": \"418784234260265\", \"name\": \"daftar_pengumuman\"}], \"text\": \"list pengumuman\", \"traits\": {}}', '2024-05-27 10:43:47'),
(37, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 25, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 19, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.8725184634892311, \"id\": \"1496405871305073\", \"name\": \"pengumuman_terbaru_matakuliah\"}], \"text\": \"pengumuman terbaru matdis\", \"traits\": {}}', '2024-05-27 10:44:41'),
(38, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 25, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 19, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [], \"text\": \"topik pembelajaran matdis\", \"traits\": {}}', '2024-05-27 10:45:19'),
(39, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 26, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 20, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.9553994713556235, \"id\": \"807668731298896\", \"name\": \"cek_materi_matakuliah\"}], \"text\": \"materi pembelajaran matdis\", \"traits\": {}}', '2024-05-27 10:45:28'),
(40, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 13, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 7, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}], \"waktu:jangka_waktu\": [{\"body\": \"minggu depan\", \"confidence\": 0.999, \"end\": 26, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 14, \"suggested\": true, \"type\": \"value\", \"value\": \"minggu depan\"}]}, \"intents\": [], \"text\": \"materi matdis minggu depan\", \"traits\": {}}', '2024-05-27 10:46:18'),
(41, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matematika diskrit\", \"confidence\": 0.9995, \"end\": 25, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 7, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}], \"waktu:jangka_waktu\": [{\"body\": \"minggu depan\", \"confidence\": 0.999, \"end\": 38, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 26, \"suggested\": true, \"type\": \"value\", \"value\": \"minggu depan\"}]}, \"intents\": [{\"confidence\": 0.8404746744562029, \"id\": \"807668731298896\", \"name\": \"cek_materi_matakuliah\"}], \"text\": \"materi matematika diskrit minggu depan\", \"traits\": {}}', '2024-05-27 10:46:40'),
(42, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matematika diskrit\", \"confidence\": 0.9995, \"end\": 25, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 7, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [], \"text\": \"materi matematika diskrit sebelumnya\", \"traits\": {}}', '2024-05-27 10:46:52'),
(43, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matematika diskrit\", \"confidence\": 0.9995, \"end\": 25, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 7, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}], \"pertemuan:pertemuan_ke\": [{\"body\": \"pertemuan \", \"confidence\": 1, \"end\": 39, \"entities\": [], \"id\": \"1151099762870847\", \"name\": \"pertemuan\", \"role\": \"pertemuan_ke\", \"start\": 29, \"type\": \"value\", \"value\": \"9\"}]}, \"intents\": [], \"text\": \"materi matematika diskrit di pertemuan sebelumnya\", \"traits\": {}}', '2024-05-27 10:47:21'),
(44, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 16, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 11, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}], \"pertemuan:pertemuan_ke\": [{\"body\": \"pertemuan \", \"confidence\": 1, \"end\": 30, \"entities\": [], \"id\": \"1151099762870847\", \"name\": \"pertemuan\", \"role\": \"pertemuan_ke\", \"start\": 20, \"type\": \"value\", \"value\": \"9\"}]}, \"intents\": [{\"confidence\": 0.9645704709411346, \"id\": \"768013645464885\", \"name\": \"cek_materi_terdekat_matakuliah\"}], \"text\": \"apa materi alpro di pertemuan selanjutnya\", \"traits\": {}}', '2024-05-27 10:48:07'),
(45, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matematika diskrit\", \"confidence\": 0.9995, \"end\": 35, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 17, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [], \"text\": \"list file materi matematika diskrit\", \"traits\": {}}', '2024-05-27 10:49:46'),
(46, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matematika diskrit\", \"confidence\": 0.9995, \"end\": 40, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 22, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.5112762765242398, \"id\": \"643374277997193\", \"name\": \"file_materi\"}], \"text\": \"tampilkan file materi matematika diskrit\", \"traits\": {}}', '2024-05-27 10:50:59'),
(47, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"waktu:waktu_hari\": [{\"body\": \"hari ini\", \"confidence\": 0.9995, \"end\": 8, \"entities\": [], \"id\": \"751078420572549\", \"name\": \"waktu\", \"role\": \"waktu_hari\", \"start\": 0, \"type\": \"value\", \"value\": \"hari ini\"}]}, \"intents\": [{\"confidence\": 0.989687024496969, \"id\": \"3634299166834899\", \"name\": \"kelas_hari_ini\"}], \"text\": \"hari ini kelas apa\", \"traits\": {}}', '2024-05-27 10:51:46'),
(48, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matematika diskrit\", \"confidence\": 0.9995, \"end\": 41, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 23, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.9805565099497666, \"id\": \"780468447398164\", \"name\": \"cek_presensi\"}], \"text\": \"persentase presensi di matematika diskrit\", \"traits\": {}}', '2024-05-27 10:52:25'),
(49, 'cheesecakepud', 'A', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 26, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 20, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.9914745047484966, \"id\": \"1136336091031363\", \"name\": \"sistem_penilaian\"}], \"text\": \"sistem penilaian di matdis\", \"traits\": {}}', '2024-05-27 10:53:33'),
(50, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9975378487398494, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"h\", \"traits\": {}}', '2024-05-27 10:57:51'),
(51, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9982239613001419, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hee\", \"traits\": {}}', '2024-05-28 02:09:56'),
(52, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9998772295065687, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hi\", \"traits\": {}}', '2024-05-28 03:22:07'),
(53, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9999185866873171, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hi\", \"traits\": {}}', '2024-05-28 13:03:36'),
(54, 'apaanyak78', 'Graciano', '~', '{\"entities\": {}, \"intents\": [], \"text\": \"71200001\", \"traits\": {}}', '2024-05-28 13:03:38'),
(55, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"test\", \"confidence\": 1, \"end\": 4, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 0, \"type\": \"value\", \"value\": \"test\"}]}, \"intents\": [{\"confidence\": 0.9969620294702066, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"test\", \"traits\": {}}', '2024-05-28 13:03:40'),
(56, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9972756423287974, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"jj\", \"traits\": {}}', '2024-05-28 13:03:41'),
(57, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9900398914931209, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"kk\", \"traits\": {}}', '2024-05-28 13:03:45'),
(58, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9997899973461599, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"haloooo\", \"traits\": {}}', '2024-05-28 13:03:48'),
(59, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9975768773365857, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \".\", \"traits\": {}}', '2024-05-28 13:05:28'),
(60, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {}, \"intents\": [], \"text\": \"71200001\", \"traits\": {}}', '2024-05-28 13:05:28'),
(61, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9997413827291892, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hei\", \"traits\": {}}', '2024-05-28 13:05:31'),
(62, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9977669623455457, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"...\", \"traits\": {}}', '2024-05-28 13:05:59'),
(63, 'apaanyak78', 'Graciano', '~', '{\"entities\": {}, \"intents\": [], \"text\": \"71200001\", \"traits\": {}}', '2024-05-28 13:06:05'),
(64, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.687053805046173, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"71200002\", \"traits\": {}}', '2024-05-28 13:06:22'),
(65, 'apaanyak78', 'Graciano', '~', '{\"entities\": {}, \"intents\": [], \"text\": \"71200001\", \"traits\": {}}', '2024-05-28 13:07:11'),
(66, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9886590589248377, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"Tugas saya apa saja?\", \"traits\": {}}', '2024-05-28 13:07:19'),
(67, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.7513428591631084, \"id\": \"1393568741356414\", \"name\": \"deadline_tugas_hari_ini\"}], \"text\": \"Deadline tugasku yang terdekat apa ya?\", \"traits\": {}}', '2024-05-28 13:07:50'),
(68, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"waktu:jangka_waktu\": [{\"body\": \"minggu ini\", \"confidence\": 0.9995, \"end\": 41, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 31, \"type\": \"value\", \"value\": \"minggu ini\"}]}, \"intents\": [{\"confidence\": 0.977549912063956, \"id\": \"979923303572406\", \"name\": \"deadline_tugas_minggu_ini\"}], \"text\": \"Apa aja tugas yang deadlinenya minggu ini?\", \"traits\": {}}', '2024-05-28 13:08:30'),
(69, NULL, 'Leif', 'Sean', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9787228391404109, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"Apa tugas saya?\", \"traits\": {}}', '2024-05-28 13:09:13'),
(70, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"praktikum algoritma dan pemrograman\", \"confidence\": 0.9995, \"end\": 60, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 25, \"type\": \"value\", \"value\": \"Praktikum Algoritma dan Pemrograman\"}], \"tugas:nama_tugas\": [{\"body\": \"laporan 2\", \"confidence\": 0.9995, \"end\": 24, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 15, \"type\": \"value\", \"value\": \"Laporan 2\"}]}, \"intents\": [{\"confidence\": 0.9964817998668223, \"id\": \"3081420865331274\", \"name\": \"deadline_tugas_matakuliah\"}], \"text\": \"Deadline tugas laporan 2 praktikum algoritma dan pemrograman kapan ya?\", \"traits\": {}}', '2024-05-28 13:09:34'),
(71, NULL, 'Leif', 'Sean', '{\"entities\": {\"grup:grup_kelas\": [{\"body\": \"A\", \"confidence\": 1, \"end\": 86, \"entities\": [], \"id\": \"970173261493978\", \"name\": \"grup\", \"role\": \"grup_kelas\", \"start\": 85, \"type\": \"value\", \"value\": \"A\"}], \"matakuliah:nama_matakuliah\": [{\"body\": \"praktikum\", \"confidence\": 0.999, \"end\": 58, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 49, \"suggested\": true, \"type\": \"value\", \"value\": \"praktikum\"}, {\"body\": \"algoritma dan pemrograman\", \"confidence\": 0.9742256575223183, \"end\": 84, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 59, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9587281876395398, \"id\": \"956000989872681\", \"name\": \"cek_status_pengumpulan_tugas\"}], \"text\": \"Apakah saya sudah mengumpulkan tugas mata kuliah praktikum algoritma dan pemrograman A?\", \"traits\": {}}', '2024-05-28 13:10:01'),
(72, 'apaanyak78', 'Graciano', '~', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9697645663430006, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"apa tugas ku\", \"traits\": {}}', '2024-05-28 13:10:04'),
(73, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 11, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 6, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [], \"text\": \"Tugas alpro ada yang baru ga?\", \"traits\": {}}', '2024-05-28 13:10:09'),
(74, 'apaanyak78', 'Graciano', '~', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9285159837718452, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"apa tgs ku\", \"traits\": {}}', '2024-05-28 13:10:20'),
(75, NULL, 'Leif', 'Sean', '{\"entities\": {\"tugas:nama_tugas\": [{\"body\": \"laporan 3\", \"confidence\": 0.9995, \"end\": 39, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 30, \"type\": \"value\", \"value\": \"Laporan 3\"}]}, \"intents\": [{\"confidence\": 0.9562802518292516, \"id\": \"2705740909579095\", \"name\": \"cek_tugas_belum_dikumpulkan\"}], \"text\": \"Apakah saya sudah mengerjakan laporan 3?\", \"traits\": {}}', '2024-05-28 13:10:29'),
(76, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"AlPro\", \"confidence\": 0.9995, \"end\": 5, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 0, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.8129825045982717, \"id\": \"965504128218420\", \"name\": \"tugas_terbaru_matakuliah\"}], \"text\": \"AlPro ada tugas yang terbaru??\", \"traits\": {}}', '2024-05-28 13:10:35'),
(77, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 34, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 29, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 1\", \"confidence\": 0.9995, \"end\": 28, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 21, \"type\": \"value\", \"value\": \"Tugas 1\"}]}, \"intents\": [{\"confidence\": 0.9800488978238449, \"id\": \"956000989872681\", \"name\": \"cek_status_pengumpulan_tugas\"}], \"text\": \"Saya sudah ngumpulin tugas 1 alpro???\", \"traits\": {}}', '2024-05-28 13:10:57'),
(78, 'apaanyak78', 'Graciano', '~', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.5798667158349111, \"id\": \"965041121616853\", \"name\": \"deadline_tugas_terdekat\"}], \"text\": \"deadline tugas\", \"traits\": {}}', '2024-05-28 13:11:12'),
(79, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 19, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 14, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 1\", \"confidence\": 0.9995, \"end\": 13, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 6, \"type\": \"value\", \"value\": \"Tugas 1\"}]}, \"intents\": [{\"confidence\": 0.9870302242465208, \"id\": \"2170328610000218\", \"name\": \"cek_nilai_tugas\"}], \"text\": \"Nilai tugas 1 alpro berapa ya?\", \"traits\": {}}', '2024-05-28 13:11:19'),
(80, 'apaanyak78', 'Graciano', '~', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.8366879180398128, \"id\": \"965041121616853\", \"name\": \"deadline_tugas_terdekat\"}], \"text\": \"tugas terdekat\", \"traits\": {}}', '2024-05-28 13:11:25'),
(81, NULL, 'Leif', 'Sean', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9764501443497736, \"id\": \"418784234260265\", \"name\": \"daftar_pengumuman\"}], \"text\": \"Apa pengumuman yang ada?\", \"traits\": {}}', '2024-05-28 13:11:29'),
(82, 'apaanyak78', 'Graciano', '~', '{\"entities\": {\"waktu:jangka_waktu\": [{\"body\": \"minggu\", \"confidence\": 0.9894309141270519, \"end\": 21, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 15, \"type\": \"value\", \"value\": \"minggu\"}]}, \"intents\": [], \"text\": \"tugas deadline minggu\", \"traits\": {}}', '2024-05-28 13:11:42'),
(83, NULL, 'Leif', 'Sean', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 15, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 6, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.5018611533950095, \"id\": \"768013645464885\", \"name\": \"cek_materi_terdekat_matakuliah\"}], \"text\": \"Topik statistik\", \"traits\": {}}', '2024-05-28 13:12:00'),
(84, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9523754814251741, \"id\": \"418784234260265\", \"name\": \"daftar_pengumuman\"}], \"text\": \"Apa aja pengumuman yang ada?\", \"traits\": {}}', '2024-05-28 13:12:08'),
(85, 'apaanyak78', 'Graciano', '~', '{\"entities\": {\"tugas:nama_tugas\": [{\"body\": \"tugas 3\", \"confidence\": 0.9995, \"end\": 16, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 9, \"type\": \"value\", \"value\": \"Tugas 3\"}]}, \"intents\": [], \"text\": \"deadline tugas 3\", \"traits\": {}}', '2024-05-28 13:12:10'),
(86, 'apaanyak78', 'Graciano', '~', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"Statistik\", \"confidence\": 0.9995, \"end\": 28, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 19, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.9247182030768998, \"id\": \"2170328610000218\", \"name\": \"cek_nilai_tugas\"}], \"text\": \"berapa nilai tugas Statistik saya\", \"traits\": {}}', '2024-05-28 13:12:41'),
(87, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"AlPro\", \"confidence\": 0.9995, \"end\": 5, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 0, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [], \"text\": \"AlPro ada pengumuman apa aja?\", \"traits\": {}}', '2024-05-28 13:12:59'),
(88, 'apaanyak78', 'Graciano', '~', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matematika diskrit\", \"confidence\": 0.9995, \"end\": 37, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 19, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.9608970302170459, \"id\": \"2170328610000218\", \"name\": \"cek_nilai_tugas\"}], \"text\": \"berapa nilai tugas matematika diskrit saya\", \"traits\": {}}', '2024-05-28 13:13:11'),
(89, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"AlPro\", \"confidence\": 0.9995, \"end\": 5, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 0, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.918604387345167, \"id\": \"1496405871305073\", \"name\": \"pengumuman_terbaru_matakuliah\"}], \"text\": \"AlPro ada pengumuman terbaru?\", \"traits\": {}}', '2024-05-28 13:13:27'),
(90, 'apaanyak78', 'Graciano', '~', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"pengun\", \"confidence\": 0.9691985184563738, \"end\": 6, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 0, \"suggested\": true, \"type\": \"value\", \"value\": \"pengun\"}]}, \"intents\": [{\"confidence\": 0.8034704910027187, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"pengunguman yang ada\", \"traits\": {}}', '2024-05-28 13:13:46'),
(91, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 21, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 15, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.9986930307846813, \"id\": \"807668731298896\", \"name\": \"cek_materi_matakuliah\"}], \"text\": \"Apa aja materi matdis?\", \"traits\": {}}', '2024-05-28 13:14:11'),
(92, 'apaanyak78', 'Graciano', '~', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 35, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 30, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9507106751029687, \"id\": \"807668731298896\", \"name\": \"cek_materi_matakuliah\"}], \"text\": \"apa aja topik yang dibahas di alpro\", \"traits\": {}}', '2024-05-28 13:14:17'),
(93, 'apaanyak78', 'Graciano', '~', '{\"entities\": {\"waktu:waktu_hari\": [{\"body\": \"hari ini\", \"confidence\": 0.9995, \"end\": 19, \"entities\": [], \"id\": \"751078420572549\", \"name\": \"waktu\", \"role\": \"waktu_hari\", \"start\": 11, \"type\": \"value\", \"value\": \"hari ini\"}]}, \"intents\": [{\"confidence\": 0.9862442532011336, \"id\": \"3634299166834899\", \"name\": \"kelas_hari_ini\"}], \"text\": \"kelas saya hari ini apa aja\", \"traits\": {}}', '2024-05-28 13:14:49'),
(94, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 26, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 20, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.9319284881915574, \"id\": \"768013645464885\", \"name\": \"cek_materi_terdekat_matakuliah\"}], \"text\": \"Apa materi terdekat matdis?\", \"traits\": {}}', '2024-05-28 13:14:52'),
(95, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {}, \"intents\": [], \"text\": \"71200001\", \"traits\": {}}', '2024-05-28 13:15:59'),
(96, 'slimsofa19', 'Yudha', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"matdis\", \"confidence\": 0.9995, \"end\": 22, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 16, \"type\": \"value\", \"value\": \"Matematika Diskrit\"}]}, \"intents\": [{\"confidence\": 0.8866047285692034, \"id\": \"807668731298896\", \"name\": \"cek_materi_matakuliah\"}], \"text\": \"Tampilin materi matdis\", \"traits\": {}}', '2024-05-28 13:15:59'),
(97, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {}, \"intents\": [], \"text\": \"71200001\", \"traits\": {}}', '2024-05-28 13:16:04'),
(98, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9975768773365857, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \".\", \"traits\": {}}', '2024-05-28 13:17:16'),
(99, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9719006901991206, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"tugas saya apa?\", \"traits\": {}}', '2024-05-28 13:18:21'),
(100, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {}, \"intents\": [], \"text\": \"tgs saya apa?\", \"traits\": {}}', '2024-05-28 13:18:32'),
(101, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.813201768156404, \"id\": \"965041121616853\", \"name\": \"deadline_tugas_terdekat\"}], \"text\": \"deadline tugas terdekat saya?\", \"traits\": {}}', '2024-05-28 13:19:15'),
(102, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"waktu:jangka_waktu\": [{\"body\": \"minggu ini\", \"confidence\": 0.9995, \"end\": 19, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 9, \"type\": \"value\", \"value\": \"minggu ini\"}]}, \"intents\": [], \"text\": \"deadline minggu ini?\", \"traits\": {}}', '2024-05-28 13:19:55'),
(103, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"waktu:jangka_waktu\": [{\"body\": \"minggu ini\", \"confidence\": 0.9995, \"end\": 25, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 15, \"type\": \"value\", \"value\": \"minggu ini\"}]}, \"intents\": [{\"confidence\": 0.6266124096096939, \"id\": \"979923303572406\", \"name\": \"deadline_tugas_minggu_ini\"}], \"text\": \"tugas deadline minggu ini?\", \"traits\": {}}', '2024-05-28 13:20:05'),
(104, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 26, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 17, \"type\": \"value\", \"value\": \"Statistik\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 3\", \"confidence\": 0.9995, \"end\": 16, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 9, \"type\": \"value\", \"value\": \"Tugas 3\"}]}, \"intents\": [{\"confidence\": 0.9853905412823852, \"id\": \"3081420865331274\", \"name\": \"deadline_tugas_matakuliah\"}], \"text\": \"deadline tugas 3 statistik kapan ya?\", \"traits\": {}}', '2024-05-28 13:20:59'),
(105, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"prakalpro\", \"confidence\": 0.9995, \"end\": 9, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 0, \"type\": \"value\", \"value\": \"Praktikum Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9362913736316651, \"id\": \"965504128218420\", \"name\": \"tugas_terbaru_matakuliah\"}], \"text\": \"prakalpro ada tugas terbaru gak?\", \"traits\": {}}', '2024-05-28 13:21:44'),
(106, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {}, \"intents\": [], \"text\": \"Presensi\", \"traits\": {}}', '2024-05-28 13:21:54'),
(107, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9531376143421645, \"id\": \"418784234260265\", \"name\": \"daftar_pengumuman\"}], \"text\": \"List pengumuman\", \"traits\": {}}', '2024-05-28 13:22:08'),
(108, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 35, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 26, \"type\": \"value\", \"value\": \"Statistik\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 1\", \"confidence\": 0.9995, \"end\": 25, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 18, \"type\": \"value\", \"value\": \"Tugas 1\"}]}, \"intents\": [{\"confidence\": 0.9938743954253125, \"id\": \"956000989872681\", \"name\": \"cek_status_pengumpulan_tugas\"}], \"text\": \"saya sudah kumpul tugas 1 statistik belum ya?\", \"traits\": {}}', '2024-05-28 13:22:21'),
(109, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.865559415334094, \"id\": \"2620654441466488\", \"name\": \"daftar_kelas\"}], \"text\": \"Jadwal\", \"traits\": {}}', '2024-05-28 13:22:23'),
(110, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9767410888357908, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"Tugas saya apa aja?\", \"traits\": {}}', '2024-05-28 13:22:47'),
(111, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 30, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 21, \"type\": \"value\", \"value\": \"Statistik\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 1\", \"confidence\": 0.9995, \"end\": 20, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 13, \"type\": \"value\", \"value\": \"Tugas 1\"}]}, \"intents\": [{\"confidence\": 0.9709523644901391, \"id\": \"2170328610000218\", \"name\": \"cek_nilai_tugas\"}], \"text\": \"berapa nilai tugas 1 statistik saya?\", \"traits\": {}}', '2024-05-28 13:23:01'),
(112, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {}, \"intents\": [], \"text\": \"Deadline tugas terdekatku\", \"traits\": {}}', '2024-05-28 13:23:08'),
(113, 'Undisplay', 'Jonathan', 'Jesse S.', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9767410888357908, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"Tugas saya apa aja?\", \"traits\": {}}', '2024-05-28 13:23:16'),
(114, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {}, \"intents\": [], \"text\": \"Deadline tugas terdekat saya\", \"traits\": {}}', '2024-05-28 13:23:21'),
(115, 'Undisplay', 'Jonathan', 'Jesse S.', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 28, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 19, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.9802435867008075, \"id\": \"2170328610000218\", \"name\": \"cek_nilai_tugas\"}], \"text\": \"Berapa nilai tugas statistik saya\", \"traits\": {}}', '2024-05-28 13:23:51'),
(116, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9757319958742068, \"id\": \"418784234260265\", \"name\": \"daftar_pengumuman\"}], \"text\": \"apa saja pengumuman yang ada?\", \"traits\": {}}', '2024-05-28 13:23:51'),
(117, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.6365981074947353, \"id\": \"1393568741356414\", \"name\": \"deadline_tugas_hari_ini\"}], \"text\": \"Deadline tugasku yang terdekat apa ya\", \"traits\": {}}', '2024-05-28 13:23:54'),
(118, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {\"waktu:jangka_waktu\": [{\"body\": \"minggu ini\", \"confidence\": 0.9995, \"end\": 28, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 18, \"type\": \"value\", \"value\": \"minggu ini\"}]}, \"intents\": [{\"confidence\": 0.8535066322778233, \"id\": \"979923303572406\", \"name\": \"deadline_tugas_minggu_ini\"}], \"text\": \"Apa saja deadline minggu ini\", \"traits\": {}}', '2024-05-28 13:24:23'),
(119, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 26, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 17, \"type\": \"value\", \"value\": \"Statistik\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 3\", \"confidence\": 0.9995, \"end\": 16, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 9, \"type\": \"value\", \"value\": \"Tugas 3\"}]}, \"intents\": [{\"confidence\": 0.9886733915866733, \"id\": \"3081420865331274\", \"name\": \"deadline_tugas_matakuliah\"}], \"text\": \"Deadline tugas 3 statistik kapan ya\", \"traits\": {}}', '2024-05-28 13:24:40'),
(120, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9226978628914582, \"id\": \"7234937029950203\", \"name\": \"pengumuman_terbaru\"}], \"text\": \"apa pengumuman terbaru?\", \"traits\": {}}', '2024-05-28 13:24:48'),
(121, NULL, 'Stefanus', 'Kurniawan', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"Prakrplbo\", \"confidence\": 0.999, \"end\": 9, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 0, \"suggested\": true, \"type\": \"value\", \"value\": \"Prakrplbo\"}]}, \"intents\": [{\"confidence\": 0.8676094746102143, \"id\": \"980711796792204\", \"name\": \"tugas_terbaru\"}], \"text\": \"Prakrplbo apakah ada tugas terbaru\", \"traits\": {}}', '2024-05-28 13:24:57'),
(122, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 37, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 28, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [], \"text\": \"apa pengumuman terbaru dari statistik?\", \"traits\": {}}', '2024-05-28 13:25:05'),
(123, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"prakalpro\", \"confidence\": 0.9995, \"end\": 37, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 28, \"type\": \"value\", \"value\": \"Praktikum Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9486416954088851, \"id\": \"1496405871305073\", \"name\": \"pengumuman_terbaru_matakuliah\"}], \"text\": \"apa pengumuman terbaru dari prakalpro?\", \"traits\": {}}', '2024-05-28 13:25:24'),
(124, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 36, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 31, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [], \"text\": \"apa saja topik yang dibahas di alpro?\", \"traits\": {}}', '2024-05-28 13:25:54');
INSERT INTO `input_user` (`id_input`, `username`, `first_name`, `last_name`, `input_result`, `waktu_input`) VALUES
(125, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 35, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 30, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [], \"text\": \"apa aja topik yang dibahas di alpro?\", \"traits\": {}}', '2024-05-28 13:26:16'),
(126, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 16, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 11, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}], \"pertemuan:pertemuan_ke\": [{\"body\": \"pertemuan \", \"confidence\": 1, \"end\": 30, \"entities\": [], \"id\": \"1151099762870847\", \"name\": \"pertemuan\", \"role\": \"pertemuan_ke\", \"start\": 20, \"type\": \"value\", \"value\": \"9\"}]}, \"intents\": [{\"confidence\": 0.9777150059660606, \"id\": \"768013645464885\", \"name\": \"cek_materi_terdekat_matakuliah\"}], \"text\": \"apa materi alpro di pertemuan selanjutnya?\", \"traits\": {}}', '2024-05-28 13:26:40'),
(127, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 31, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 22, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.998622529310163, \"id\": \"643374277997193\", \"name\": \"file_materi\"}], \"text\": \"tampilkan file materi statistik\", \"traits\": {}}', '2024-05-28 13:26:57'),
(128, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"waktu:waktu_hari\": [{\"body\": \"hari ini\", \"confidence\": 0.9995, \"end\": 19, \"entities\": [], \"id\": \"751078420572549\", \"name\": \"waktu\", \"role\": \"waktu_hari\", \"start\": 11, \"type\": \"value\", \"value\": \"hari ini\"}]}, \"intents\": [{\"confidence\": 0.9618556937420978, \"id\": \"3634299166834899\", \"name\": \"kelas_hari_ini\"}], \"text\": \"kelas saya hari ini apa saja>\", \"traits\": {}}', '2024-05-28 13:27:48'),
(129, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"prakalpro\", \"confidence\": 0.9995, \"end\": 43, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 34, \"type\": \"value\", \"value\": \"Praktikum Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9595785662671997, \"id\": \"780468447398164\", \"name\": \"cek_presensi\"}], \"text\": \"bagaimana presensi saya di matkul prakalpro?\", \"traits\": {}}', '2024-05-28 13:28:15'),
(130, 'Farrelsap', 'Farrel Ardiyanto', 'Saputro', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 46, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 37, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.9905942878884592, \"id\": \"1136336091031363\", \"name\": \"sistem_penilaian\"}], \"text\": \"bagaimana sistem penilaian di matkul statistik?\", \"traits\": {}}', '2024-05-28 13:28:37'),
(131, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9767410888357908, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"Tugas saya apa aja?\", \"traits\": {}}', '2024-05-28 14:19:17'),
(132, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {}, \"intents\": [], \"text\": \"Deadline-nya kapan?\", \"traits\": {}}', '2024-05-28 14:19:47'),
(133, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {}, \"intents\": [], \"text\": \"Deadline tugasku yang terdekat apa aja?\", \"traits\": {}}', '2024-05-28 14:20:11'),
(134, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.7513428591631084, \"id\": \"1393568741356414\", \"name\": \"deadline_tugas_hari_ini\"}], \"text\": \"Deadline tugasku yang terdekat apa ya?\", \"traits\": {}}', '2024-05-28 14:20:37'),
(135, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"waktu:jangka_waktu\": [{\"body\": \"Minggu ini\", \"confidence\": 0.9995, \"end\": 41, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 31, \"type\": \"value\", \"value\": \"minggu ini\"}]}, \"intents\": [{\"confidence\": 0.9758897771757442, \"id\": \"979923303572406\", \"name\": \"deadline_tugas_minggu_ini\"}], \"text\": \"Apa aja tugas yang deadlinenya Minggu ini?\", \"traits\": {}}', '2024-05-28 14:21:12'),
(136, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 26, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 17, \"type\": \"value\", \"value\": \"Statistik\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 3\", \"confidence\": 0.9995, \"end\": 16, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 9, \"type\": \"value\", \"value\": \"Tugas 3\"}]}, \"intents\": [{\"confidence\": 0.9839077994713722, \"id\": \"3081420865331274\", \"name\": \"deadline_tugas_matakuliah\"}], \"text\": \"Deadline tugas 3 statistik kapan ya?\", \"traits\": {}}', '2024-05-28 14:21:36'),
(137, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"Prakalpro\", \"confidence\": 0.9995, \"end\": 9, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 0, \"type\": \"value\", \"value\": \"Praktikum Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9051224611983281, \"id\": \"965504128218420\", \"name\": \"tugas_terbaru_matakuliah\"}], \"text\": \"Prakalpro ada tugas terbaru gak?\", \"traits\": {}}', '2024-05-28 14:21:57'),
(138, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 35, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 26, \"type\": \"value\", \"value\": \"Statistik\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 1\", \"confidence\": 0.9995, \"end\": 25, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 18, \"type\": \"value\", \"value\": \"Tugas 1\"}]}, \"intents\": [{\"confidence\": 0.9993554933867581, \"id\": \"956000989872681\", \"name\": \"cek_status_pengumpulan_tugas\"}], \"text\": \"Saya sudah kumpul tugas 1 statistik belum ya?\", \"traits\": {}}', '2024-05-28 14:22:18'),
(139, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 35, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 26, \"type\": \"value\", \"value\": \"Statistik\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 1\", \"confidence\": 0.9995, \"end\": 25, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 18, \"type\": \"value\", \"value\": \"Tugas 1\"}]}, \"intents\": [{\"confidence\": 0.9996199860349345, \"id\": \"956000989872681\", \"name\": \"cek_status_pengumpulan_tugas\"}], \"text\": \"Saya sudah kumpul tugas 1 statistik belum ya\", \"traits\": {}}', '2024-05-28 14:22:37'),
(140, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 30, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 21, \"type\": \"value\", \"value\": \"Statistik\"}], \"tugas:nama_tugas\": [{\"body\": \"tugas 1\", \"confidence\": 0.9995, \"end\": 20, \"entities\": [], \"id\": \"1006066647080329\", \"name\": \"tugas\", \"role\": \"nama_tugas\", \"start\": 13, \"type\": \"value\", \"value\": \"Tugas 1\"}]}, \"intents\": [{\"confidence\": 0.9761753889798952, \"id\": \"2170328610000218\", \"name\": \"cek_nilai_tugas\"}], \"text\": \"Berapa nilai tugas 1 statistik saya\", \"traits\": {}}', '2024-05-28 14:22:58'),
(141, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9874444266643678, \"id\": \"418784234260265\", \"name\": \"daftar_pengumuman\"}], \"text\": \"Apa aja pengumuman yang ada\", \"traits\": {}}', '2024-05-28 14:24:00'),
(142, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9681557764666516, \"id\": \"7234937029950203\", \"name\": \"pengumuman_terbaru\"}], \"text\": \"Apa pengumuman terbaru\", \"traits\": {}}', '2024-05-28 14:24:19'),
(143, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"prakalpro\", \"confidence\": 0.9995, \"end\": 37, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 28, \"type\": \"value\", \"value\": \"Praktikum Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9869267568605559, \"id\": \"1496405871305073\", \"name\": \"pengumuman_terbaru_matakuliah\"}], \"text\": \"Apa pengumuman terbaru dari prakalpro\", \"traits\": {}}', '2024-05-28 14:24:40'),
(144, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 34, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 29, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9729920336260361, \"id\": \"807668731298896\", \"name\": \"cek_materi_matakuliah\"}], \"text\": \"Apa aja topikyang dibahas di alpro\", \"traits\": {}}', '2024-05-28 14:25:17'),
(145, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 35, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 30, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9798746599777827, \"id\": \"807668731298896\", \"name\": \"cek_materi_matakuliah\"}], \"text\": \"Apa aja topik yang dibahas di alpro\", \"traits\": {}}', '2024-05-28 14:25:50'),
(146, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 26, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 21, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}], \"pertemuan:pertemuan_ke\": [{\"body\": \"pertemuan \", \"confidence\": 1, \"end\": 21, \"entities\": [], \"id\": \"1151099762870847\", \"name\": \"pertemuan\", \"role\": \"pertemuan_ke\", \"start\": 11, \"type\": \"value\", \"value\": \"9\"}]}, \"intents\": [{\"confidence\": 0.9730560276043216, \"id\": \"768013645464885\", \"name\": \"cek_materi_terdekat_matakuliah\"}], \"text\": \"Apa materi pertemuan alpro selanjutnya\", \"traits\": {}}', '2024-05-28 14:26:10'),
(147, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"stati\", \"confidence\": 0.7578043719640969, \"end\": 27, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 22, \"suggested\": true, \"type\": \"value\", \"value\": \"stati\"}]}, \"intents\": [{\"confidence\": 0.9976245697501501, \"id\": \"643374277997193\", \"name\": \"file_materi\"}], \"text\": \"Tampilkan file materi statisik\", \"traits\": {}}', '2024-05-28 14:26:33'),
(148, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"waktu:waktu_hari\": [{\"body\": \"hari ini\", \"confidence\": 0.9995, \"end\": 19, \"entities\": [], \"id\": \"751078420572549\", \"name\": \"waktu\", \"role\": \"waktu_hari\", \"start\": 11, \"type\": \"value\", \"value\": \"hari ini\"}]}, \"intents\": [{\"confidence\": 0.9973538985806845, \"id\": \"3634299166834899\", \"name\": \"kelas_hari_ini\"}], \"text\": \"Kelas saya hari ini apa aja?\", \"traits\": {}}', '2024-05-28 14:27:21'),
(149, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"prakalpro\", \"confidence\": 0.9995, \"end\": 43, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 34, \"type\": \"value\", \"value\": \"Praktikum Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9479925655389012, \"id\": \"780468447398164\", \"name\": \"cek_presensi\"}], \"text\": \"Bagaimana presensi saya di matkul prakalpro\", \"traits\": {}}', '2024-05-28 14:27:44'),
(150, 'bobehuddd', 'Bob', 'Gultom', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 39, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 30, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.905227655353776, \"id\": \"1136336091031363\", \"name\": \"sistem_penilaian\"}], \"text\": \"Bagaimana sistem penilaian di statistik\", \"traits\": {}}', '2024-05-28 14:28:08'),
(151, 'Ohyayyyyyy', 'Vina josephine', NULL, '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9757319958742068, \"id\": \"418784234260265\", \"name\": \"daftar_pengumuman\"}], \"text\": \"apa saja pengumuman yang ada?\", \"traits\": {}}', '2024-05-28 14:34:55'),
(152, 'Ohyayyyyyy', 'Vina josephine', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 19, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 14, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.9023809290179209, \"id\": \"828754059149468\", \"name\": \"cek_jadwal_matakuliah\"}], \"text\": \"jadwal matkul alpro\", \"traits\": {}}', '2024-05-28 14:41:56'),
(153, 'Ohyayyyyyy', 'Vina josephine', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 30, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 21, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.7893469187086943, \"id\": \"828754059149468\", \"name\": \"cek_jadwal_matakuliah\"}], \"text\": \"jadwal kuliah matkul statistik\", \"traits\": {}}', '2024-05-28 14:42:29'),
(154, 'Ohyayyyyyy', 'Vina josephine', NULL, '{\"entities\": {}, \"intents\": [], \"text\": \"jadwal matkul sbd\", \"traits\": {}}', '2024-05-28 14:43:46'),
(155, 'Ohyayyyyyy', 'Vina josephine', NULL, '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"sistem basis data\", \"confidence\": 0.9887156919213828, \"end\": 31, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 14, \"suggested\": true, \"type\": \"value\", \"value\": \"sistem basis data\"}]}, \"intents\": [{\"confidence\": 0.9848609153215473, \"id\": \"828754059149468\", \"name\": \"cek_jadwal_matakuliah\"}], \"text\": \"jadwal matkul sistem basis data\", \"traits\": {}}', '2024-05-28 14:44:07'),
(156, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9998296789397704, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hai\", \"traits\": {}}', '2024-05-28 15:17:17'),
(157, 'excel_svy', 'excel', NULL, '{\"entities\": {\"waktu:waktu_hari\": [{\"body\": \"hari ini\", \"confidence\": 0.9995, \"end\": 23, \"entities\": [], \"id\": \"751078420572549\", \"name\": \"waktu\", \"role\": \"waktu_hari\", \"start\": 15, \"type\": \"value\", \"value\": \"hari ini\"}]}, \"intents\": [{\"confidence\": 0.9115918845337851, \"id\": \"1393568741356414\", \"name\": \"deadline_tugas_hari_ini\"}], \"text\": \"deadline tugas hari ini\", \"traits\": {}}', '2024-05-28 23:27:28'),
(158, 'excel_svy', 'excel', NULL, '{\"entities\": {}, \"intents\": [], \"text\": \"71210785\", \"traits\": {}}', '2024-05-28 23:27:29'),
(159, 'excel_svy', 'excel', NULL, '{\"entities\": {}, \"intents\": [], \"text\": \"71200001\", \"traits\": {}}', '2024-05-28 23:27:32'),
(160, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.999829321431075, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hai\", \"traits\": {}}', '2024-05-28 23:27:59'),
(161, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9995537604275517, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"halo\", \"traits\": {}}', '2024-05-28 23:33:28'),
(162, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9979196049537467, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"h\", \"traits\": {}}', '2024-05-29 00:17:47'),
(163, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9975768773365857, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \".\", \"traits\": {}}', '2024-05-29 01:22:08'),
(164, 'VinnW96', 'Christian', 'Calvin', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9479663194411572, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"tugas saya apa\", \"traits\": {}}', '2024-05-29 01:22:20'),
(165, 'VinnW96', 'Christian', 'Calvin', '{\"entities\": {\"waktu:jangka_waktu\": [{\"body\": \"minggu ini\", \"confidence\": 0.9995, \"end\": 30, \"entities\": [], \"id\": \"2837314206425337\", \"name\": \"waktu\", \"role\": \"jangka_waktu\", \"start\": 20, \"type\": \"value\", \"value\": \"minggu ini\"}]}, \"intents\": [], \"text\": \"deadline tugas saya minggu ini\", \"traits\": {}}', '2024-05-29 01:23:03'),
(166, 'VinnW96', 'Christian', 'Calvin', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"statistik\", \"confidence\": 0.9995, \"end\": 28, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 19, \"type\": \"value\", \"value\": \"Statistik\"}]}, \"intents\": [{\"confidence\": 0.9586804158998117, \"id\": \"2170328610000218\", \"name\": \"cek_nilai_tugas\"}], \"text\": \"berapa nilai tugas statistik sya\", \"traits\": {}}', '2024-05-29 01:24:00'),
(167, 'VinnW96', 'Christian', 'Calvin', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 32, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 27, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [], \"text\": \"apa materi yang dibahas di alpro?\", \"traits\": {}}', '2024-05-29 01:25:05'),
(168, 'VinnW96', 'Christian', 'Calvin', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"alpro\", \"confidence\": 0.9995, \"end\": 35, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 30, \"type\": \"value\", \"value\": \"Algoritma dan Pemrograman\"}]}, \"intents\": [{\"confidence\": 0.8563061484587235, \"id\": \"807668731298896\", \"name\": \"cek_materi_matakuliah\"}], \"text\": \"apa aja topik yang dibahad di alpro\", \"traits\": {}}', '2024-05-29 01:25:27'),
(169, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9999151301890851, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hi\", \"traits\": {}}', '2024-05-29 06:03:42'),
(170, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9955447027191531, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"hewwo\", \"traits\": {}}', '2024-05-29 06:05:04'),
(171, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9993063258152958, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"halo\", \"traits\": {}}', '2024-05-29 09:35:40'),
(172, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.997614366545479, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \"h\", \"traits\": {}}', '2024-05-29 13:09:42'),
(173, 'sukalucu', 'Pius', 'Nando', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9847150151796921, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"tugasku apa?\", \"traits\": {}}', '2024-05-29 13:14:54'),
(174, 'sukalucu', 'Pius', 'Nando', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.8413958467576176, \"id\": \"965041121616853\", \"name\": \"deadline_tugas_terdekat\"}], \"text\": \"deadline tugas yang paling mendekatu\", \"traits\": {}}', '2024-05-29 13:15:29'),
(175, 'sukalucu', 'Pius', 'Nando', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.7612956216344888, \"id\": \"464869912605533\", \"name\": \"daftar_tugas\"}], \"text\": \"selain itu ada tugas lagi enggak yang mepet?\", \"traits\": {}}', '2024-05-29 13:16:08'),
(176, 'sukalucu', 'Pius', 'Nando', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.632806634463581, \"id\": \"418784234260265\", \"name\": \"daftar_pengumuman\"}], \"text\": \"ada pengumuman tidak?\", \"traits\": {}}', '2024-05-29 13:17:22'),
(177, 'sukalucu', 'Pius', 'Nando', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.876028496277298, \"id\": \"7234937029950203\", \"name\": \"pengumuman_terbaru\"}], \"text\": \"ada pengumuman paling baru?\", \"traits\": {}}', '2024-05-29 13:18:33'),
(178, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {\"matakuliah:nama_matakuliah\": [{\"body\": \"jaringan komputer\", \"confidence\": 1, \"end\": 33, \"entities\": [], \"id\": \"450891060652681\", \"name\": \"matakuliah\", \"role\": \"nama_matakuliah\", \"start\": 16, \"type\": \"value\", \"value\": \"jaringan komputer\"}]}, \"intents\": [{\"confidence\": 0.9921830439550168, \"id\": \"819012472981466\", \"name\": \"cek_tugas_matakuliah\"}], \"text\": \"tampilkan tugas jaringan komputer\", \"traits\": {}}', '2024-05-29 14:30:00'),
(179, 'anabelard', 'Anabela', 'Rosanti', '{\"entities\": {}, \"intents\": [{\"confidence\": 0.9963864013052943, \"id\": \"428275816713764\", \"name\": \"sapaan\"}], \"text\": \".\", \"traits\": {}}', '2024-05-29 23:10:21');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `id_matakuliah` int(11) DEFAULT NULL,
  `grup_kelas` varchar(1) NOT NULL,
  `diadakan_hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') DEFAULT NULL,
  `waktu_mulai` time DEFAULT '00:00:00',
  `waktu_selesai` time DEFAULT '00:00:00',
  `diadakan_hari_2` varchar(10) DEFAULT NULL,
  `waktu_mulai_2` time DEFAULT '00:00:00',
  `waktu_selesai_2` time DEFAULT '00:00:00',
  `ruangan_kode` varchar(50) DEFAULT NULL,
  `ruangan_kode_2` varchar(50) DEFAULT NULL,
  `id_dosen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_matakuliah`, `grup_kelas`, `diadakan_hari`, `waktu_mulai`, `waktu_selesai`, `diadakan_hari_2`, `waktu_mulai_2`, `waktu_selesai_2`, `ruangan_kode`, `ruangan_kode_2`, `id_dosen`) VALUES
(1, 1, 'A', 'Senin', '10:30:00', '13:20:00', NULL, '00:00:00', '00:00:00', 'D.1.1', NULL, 1),
(2, 2, 'A', 'Rabu', '13:30:00', '16:20:00', 'Kamis', '13:30:00', '16:20:00', 'LAB A', 'LAB A', 2),
(3, 2, 'B', 'Selasa', '16:30:00', '19:20:00', 'Rabu', '16:30:00', '19:20:00', 'LAB A', 'LAB A', 2),
(4, 3, 'B', 'Kamis', '07:30:00', '10:20:00', NULL, '00:00:00', '00:00:00', 'D.1.1', NULL, 3),
(5, 4, 'A', 'Jumat', '07:30:00', '10:20:00', NULL, '00:00:00', '00:00:00', 'D.3.4', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id_matakuliah` int(11) NOT NULL,
  `kode_matakuliah` varchar(10) NOT NULL,
  `nama_matakuliah` varchar(100) NOT NULL,
  `sks_matakuliah` int(11) NOT NULL,
  `deskripsi_matakuliah` varchar(1000) DEFAULT NULL,
  `pustaka` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`id_matakuliah`, `kode_matakuliah`, `nama_matakuliah`, `sks_matakuliah`, `deskripsi_matakuliah`, `pustaka`) VALUES
(1, 'TI0073', 'Algoritma dan Pemrograman', 3, 'Mata kuliah Algoritma dan Pemrograman membahas mengenai konsep dan logika berpikir komputer, menjelaskan cara perancangan melalui flowchart dan pseudocode, menganalisis masalah berbasis komputer, dan menerapkan teknik/algoritma terstruktur dalam bentuk program komputer menggunakan bahasa pemrograman tertentu. Materi perkuliahan mencakup definisi, algoritma, bahasa pemrograman, flowchart, pseudocode, dan teknik-teknik dasar controlling: sekuensial, percabangan, dan perulangan. Mahasiswa juga dijelaskan tentang tipe data dasar, array, pengolahan string, dan fungsi (baik fungsi biasa dan rekursif). Dalam mata kuliah ini, mahasiswa diberi kesempatan untuk mendiskusikan, membuat, dan menganalisis program yang dibuat melalui pertemuan di kelas dalam bentuk latihan. Pada akhir mata kuliah ini, mahasiswa akan dapat membuat program-program komputer sederhana menggunakan algoritma yang tepat.', 'Flowchart and Algorithm Basics - The Art of Programming (A. B. Chaudhuri, 2021) \nGrokking Algorithms (Aditya Y. Bhargava, 2023)'),
(2, 'TI0082', 'Praktikum Algoritma dan Pemrograman', 2, 'Mata kuliah Praktikum Algoritma dan Pemrograman merupakan mata kuliah wajib yang bersifat praktikum dan membahas tentang materi pendukung teori mata kuliah Algoritma dan Pemrograman. Praktikum ini dilakukan dua kali dalam satu minggu. Mata kuliah ini berorientasi pada keterampilan teknis pada bidang pemrograman dasar menggunakan bahasa pemrograman tertentu generasi ketiga (dalam hal ini bahasa Python) dengan berbagai latihan melalui modul-modul praktikum, pre-test/post-test, dan PR. Setelah akhir perkuliahan mahasiswa akan mampu terampil menggunakan tool pemrograman dan membuat program-program untuk menyelesaikan suatu masalah komputasi.', 'Severance, C. R. (2016). Python for Everybody: Exploring Data in Python 3. CreateSpace Independent Publishing Platform. \nRachmat C., A. (2011). Algoritma pemrograman dengan bahasa C. Teori dan implementasi. Yogyakarta: Penerbit Andi. \nBhargava, A.Y. (2016). Grokking Algorithms: An illustrated guide for programmers and other curious people. Manning Publications \nForouzan, B. A. & Gilberg, R. F. (2007). A structured programming approach using C (3rd Ed.). Thomson Course Technology'),
(3, 'TI0093', 'Matematika Diskrit', 3, 'Matakuliah Matematika diskrit merupakan matakuliah wajib yang membahas tentang dasar-dasar matematika diskrit. Mata kuliah ini mengajarkan mahasiswa untuk berpikir secara logis dan matematis. Lima topik penting yang diajarkan adalah struktur diskrit, analisa kombinatorial, pembuktian matematika, dan relasi rekurensi. Penyajian mata kuliah disertai dengan aplikasi-aplikasi pada ilmu komputasi dan informatika. Pada akhir kuliah, mahasiswa mengerti tentang struktur diskrit dan dapat menggunakan berbagai teknik diskrit yang dibutuhkan untuk menyelesaikan permasalahan-permasalahan yang diberikan.', 'Rosen, Kenneth H., 2018, Discrete Mathematics and its Applications, 8th edition, McGraw-Hill Companies.'),
(4, 'TI0113', 'Statistik', 3, 'Mata kuliah statistik bertujuan untuk memberikan pengetahuan dan pemahaman kepada mahasiswa untuk dapat menggunakan statistik dalam menyelesaikan berbagai permasalahan yang relevan dengan ilmu statistik. Matakuliah ini memberikan pengetahuan berupa konsep statistik, konsep data, konsep organisasi data kualitatif dan kuantitatif, konsep ukuran pusat, konsep probabilitas dalam statistik, dan penggunaan konsep distribusi probabilitas untuk memodelkan berbagai permasalahan nyata. Dalam mata kuliah ini dibahas dua macam distribusi yang bersifat diskrit dan distribusi yang bersifat kontinu. Distribusi variabel random diskrit yang dibahas dalam mata kuliah ini adalah distribusi Binomial, Poisson dan Distribusi Hipergeometrik. Sedangkan distribusi variabel random kontinu akan memperkenalkan konsep distribusi normal dan distribusi normal standar beserta penggunaannya dalam menyelesaikan berbagai permasalahan.', 'Mann, P.S. (2010). Introductory of statistics (7th Ed.). John Wiley & Sons, Inc. \nWeiss N.A. , Introductory Statistics (10th Ed.) , Perason Inc., 2017');

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(11) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `judul_materi` varchar(100) DEFAULT NULL,
  `file_materi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id_materi`, `id_kelas`, `judul_materi`, `file_materi`) VALUES
(1, 1, 'Alpro 01 - Administratif Kuliah dan Pengantar Algoritma', '39374-Algoritma_dan_Pemrograman_01.pdf'),
(2, 1, 'Alpro 02 - Pengantar Pemrograman', '95985-Algoritma_dan_Pemrograman_02.pdf'),
(3, 1, 'Alpro 03 - Representasi Algoritma - Pseudocode', '55388-Algoritma_dan_Pemrograman_03.pdf'),
(4, 1, 'Alpro 04 - Representasi Algoritma - Flowchart', '78628-Algoritma_dan_Pemrograman_04.pdf'),
(5, 1, 'Aplikasi Flowgorithm', '66157-Flowgorithm-exe-only.zip'),
(6, 1, 'Alpro 05 - Pengenalan Bahasa Pemrograman', '34741-Algoritma_dan_Pemrograman_05.pdf'),
(7, 1, 'Alpro 06 - Struktur Kontrol Percabangan', '88330-Algoritma_dan_Pemrograman_06.pdf'),
(8, 2, 'Intro Prak Alpro', 'dwcu-my.sharepoint.com/xxxxxxx'),
(9, 3, 'Intro Prak Alpro', 'dwcu-my.sharepoint.com/xxxxxxx'),
(10, 4, 'materi 1 himpunan', '37975-Himpunan_dan_Operasi_himpunan_-_Copy.pptx'),
(11, 4, 'materi 2 relasi', '98435-3._Relasi_offline.pptx'),
(12, 4, 'induksi matematika', '32600-Induksi_Matematika.pptx'),
(13, 5, 'Buku Statistik Karangan Prem S. Mann', 'drive.google.com/xxxxxx'),
(14, 5, 'Statistik dengan Statistika', 'www.youtube.com/xxxxxx'),
(15, 5, 'Ukuran Deskriptif Statistik', '49180-Ukuran_Deskriptif_Numerik(3).pptx'),
(16, 5, 'Link Video Belajar Diagram Box Whisker dan Pengantar Probabilitas', 'drive.google.com/xxxxxx'),
(17, 5, 'Probabilitas', '38031-Probabilitas(4).pptx'),
(18, 5, 'Distribusi Variabel Random Diskrit', '39181-Distribusi_Variabel_Random_Diskrit(5).pptx'),
(19, 5, 'Faktorial, Permutasi dan kombinasi', '46155-Faktorial,_Permutasi,_Kombinasi(6).pptx'),
(20, 5, 'Distribusi Binomial, Poisson dan Hipergeometrik', '76966-Distribusi_Binomial,_Poisson,_Hipergeometrik(7).pptx'),
(21, 5, 'Distribusi Normal', '48201-Variabel_Random_Kontinu_dan_Distribusi_Normal(8).pptx');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_tugas` int(11) DEFAULT NULL,
  `id_peserta` int(11) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL,
  `nilai_peserta` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_tugas`, `id_peserta`, `checked`, `nilai_peserta`) VALUES
(1, 1, 1, 0, '0.00'),
(2, 1, 4, 0, '0.00'),
(3, 2, 1, 1, '0.00'),
(4, 2, 4, 1, '0.00'),
(5, 3, 1, 0, '0.00'),
(6, 3, 4, 0, '0.00'),
(7, 4, 2, 1, '87.50'),
(8, 4, 3, 1, '92.00'),
(9, 5, 2, 0, '0.00'),
(10, 5, 3, 0, '0.00'),
(11, 6, 2, 0, '0.00'),
(12, 6, 3, 0, '0.00'),
(13, 7, 2, 1, '9.50'),
(14, 7, 3, 1, '10.00'),
(15, 7, 4, 1, '10.00'),
(16, 8, 2, 0, '0.00'),
(17, 8, 3, 0, '0.00'),
(18, 8, 4, 0, '0.00'),
(19, 9, 2, 0, '0.00'),
(20, 9, 3, 0, '0.00'),
(21, 9, 4, 0, '0.00'),
(22, 10, 1, 1, '89.00'),
(23, 10, 3, 1, '91.50'),
(24, 10, 4, 1, '81.50'),
(25, 11, 1, 0, '0.00'),
(26, 11, 3, 0, '0.00'),
(27, 11, 4, 0, '0.00'),
(28, 12, 1, 1, '90.00'),
(29, 12, 3, 1, '95.00'),
(30, 12, 4, 1, '85.00'),
(31, 13, 1, 0, '0.00'),
(32, 13, 3, 0, '0.00'),
(33, 13, 4, 0, '0.00'),
(34, 14, 1, 0, '0.00'),
(35, 14, 4, 0, '0.00'),
(36, 15, 1, 1, '0.00'),
(37, 15, 2, 0, '0.00'),
(38, 16, 2, 0, '0.00'),
(39, 16, 3, 0, '0.00'),
(40, 16, 4, 0, '0.00'),
(41, 17, 1, 0, '0.00'),
(42, 17, 3, 0, '0.00'),
(43, 17, 4, 0, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(11) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `judul_pengumuman` varchar(50) NOT NULL,
  `isi_pengumuman` varchar(500) DEFAULT NULL,
  `tanggal_berakhir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id_pengumuman`, `id_kelas`, `judul_pengumuman`, `isi_pengumuman`, `tanggal_berakhir`) VALUES
(1, 1, 'Grup Telegram', 'Untuk keperluan koordinasi, silahkan bergabung ke grup Telegram: https://t.me/+.......l', '2024-08-31'),
(2, 2, 'LMS', 'Gabung LMS : https://lms.ukdw.ac.id/course/view.php?id=.... \npass: ******** \nGabung TelegramGrup : https://t.me/+.......', '2024-07-12'),
(3, 4, 'Kuliah ke-1 online lewat gmeet', 'Kuliah ke-1 Matematika Diskrit akan dilaksanakan online. Jadwal kuliah sesuai dengan jadwal kuliah. Kuliah dibagi dua sesi. Sesi 1, 60 menit pertama. Setelah itu istirahat 30 menit, lalu dilanjutkan sesi 2, 60 menit terakhir. \n\nAlamat gmeet sesi 1, https://meet.google.com/..... \nSelanjutnya istirahat 30 menit, lalu dilanjutkan sesi 2. \nAlamat gmeet sesi 2, https://meet.google.com/.....', '2024-02-11'),
(4, 5, 'Link Telegram Statistik B (selasa) genap 2023-2024', 'Ini link Telegram Statistik B (selasa) genap 2023-2024, https://t.me/+..... \nsilahkan bergabung ..', '2024-07-09'),
(5, 4, 'Link Rekaman', 'Berikut link untuk perkuliahan hari ini https://www.youtube.com/watch?v=......\nMaaf saya upload mentahan apa adanya, karena beberapa kali saya edit, tapi setiap dirender terus error, ada bagian dari hasil record zoom yang tidak bisa dibaca dan mengakibatkan proses render berhenti di tengah.', '2024-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `nama_penilaian` varchar(50) DEFAULT NULL,
  `bobot_penilaian` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`id_penilaian`, `id_kelas`, `nama_penilaian`, `bobot_penilaian`) VALUES
(1, 5, 'Tugas 1', 10),
(2, 5, 'Tugas 2', 10),
(3, 5, 'Tugas 3', 10),
(4, 5, 'Tugas 4', 10),
(5, 5, 'UTS', 30),
(6, 5, 'UAS', 30),
(7, 2, 'UG', 60),
(8, 2, 'UTS', 20),
(9, 2, 'UAS', 20),
(10, 3, 'UG', 60),
(11, 3, 'UTS', 20),
(12, 3, 'UAS', 20),
(13, 1, 'Quiz 1', 20),
(14, 1, 'Tugas 1', 15),
(15, 1, 'Tugas 2', 15),
(16, 1, 'UTS', 25),
(17, 1, 'UAS', 25),
(18, 4, 'Tugas 1', 6),
(19, 4, 'Tugas 2', 7),
(20, 4, 'Tugas 3', 7),
(21, 4, 'Tugas 4', 6),
(22, 4, 'Tugas 5', 7),
(23, 4, 'Tugas 6', 7),
(24, 4, 'Quiz 1', 10),
(25, 4, 'Quiz 2', 10),
(26, 4, 'UTS', 20),
(27, 4, 'UAS', 20);

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan`
--

CREATE TABLE `pertemuan` (
  `id_pertemuan` int(11) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `pertemuan_ke` int(11) NOT NULL,
  `tanggal_pelaksanaan` date NOT NULL,
  `topik_pertemuan` varchar(255) DEFAULT NULL,
  `kegiatan_kelas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pertemuan`
--

INSERT INTO `pertemuan` (`id_pertemuan`, `id_kelas`, `pertemuan_ke`, `tanggal_pelaksanaan`, `topik_pertemuan`, `kegiatan_kelas`) VALUES
(1, 1, 1, '2024-02-07', 'Silabus dan Kontrak Perkuliahan, Pengantar Algoritma', 'Latihan Soal'),
(2, 1, 2, '2024-02-14', 'Pengantar Bahasa Pemrograman', 'Latihan Soal'),
(3, 1, 3, '2024-02-21', ' Representasi Algoritma: Pseudocode', 'Latihan Soal'),
(4, 1, 4, '2024-02-28', 'Representasi Algoritma: Flowchart', 'Latihan Soal'),
(5, 1, 5, '2024-03-06', 'Pengantar Pemrograman', 'Latihan Soal'),
(6, 1, 6, '2024-03-13', 'Struktur Kontrol Percabangan', 'Latihan Soal'),
(7, 1, 7, '2024-03-20', 'Pemrograman Modular', 'Review Test 1'),
(8, 1, 8, '2024-03-27', 'UTS', 'UTS Algoritma dan Pemrograman'),
(9, 1, 9, '2024-04-17', 'Struktur Kontrol Perulangan', 'Latihan Soal'),
(10, 1, 10, '2024-04-24', 'Fungsi rekursif', 'Latihan Soal'),
(11, 1, 11, '2024-05-01', 'Analisis Algoritma', 'Latihan Soal'),
(12, 1, 12, '2024-05-08', 'Algoritma Pengurutan Data', 'Latihan Soal'),
(13, 1, 13, '2024-05-15', 'Algoritma Pencarian Data', 'Latihan Soal'),
(14, 1, 14, '2024-05-22', 'Algoritma Shortest Path', 'Latihan Soal'),
(15, 1, 15, '2024-05-29', 'Pemrograman Dinamis', 'Latihan Soal'),
(16, 1, 16, '2024-06-20', 'UAS', 'UAS Algoritma dan Pemrograman'),
(17, 2, 1, '2024-02-07', 'Pengantar Phython Programming', 'Laporan Hasil Praktikum'),
(18, 2, 2, '2024-02-08', 'Unguided Pengantar Phython Programming', 'Hasil Unguided Test'),
(19, 2, 3, '2024-02-14', 'Variabel, Expression & Statement', 'Laporan Hasil Praktikum'),
(20, 2, 4, '2024-02-15', 'Unguided Variabel, Expression & Statement', 'Hasil Unguided Test'),
(21, 2, 5, '2024-02-21', 'Struktur Kontrol Percabangan', 'Laporan Hasil Praktikum'),
(22, 2, 6, '2024-02-22', 'Unguided Struktur Kontrol Percabangan', 'Hasil Unguided Test'),
(23, 2, 7, '2024-02-28', 'Modular Programming: Fungsi', 'Laporan Hasil Praktikum'),
(24, 2, 8, '2024-02-29', 'Unguided Modular Programming: Fungsi', 'Hasil Unguided Test'),
(25, 2, 9, '2024-03-06', 'Struktur Kontrol Perulangan', 'Laporan Hasil Praktikum'),
(26, 2, 10, '2024-03-07', 'Unguided Struktur Kontrol Perulangan', 'Hasil Unguided Test'),
(27, 2, 11, '2024-03-13', 'Struktur Kontrol Kompleks', 'Laporan Hasil Praktikum'),
(28, 2, 12, '2024-03-14', 'Unguided Struktur Kontrol Kompleks', 'Hasil Unguided Test'),
(29, 2, 13, '2024-03-20', 'Pengolahan String', 'Laporan Hasil Praktikum'),
(30, 2, 14, '2024-03-21', 'Unguided Pengolahan String', 'Hasil Unguided Test'),
(31, 2, 15, '2024-04-03', 'UTS', 'UTS Praktikum Algoritma dan Pemrograman'),
(32, 2, 16, '2024-04-17', 'Membaca dan Menulis File', 'Laporan Hasil Praktikum'),
(33, 2, 17, '2024-04-18', 'Unguided Membaca dan Menulis File', 'Hasil Unguided Test'),
(34, 2, 18, '2024-04-24', 'List', 'Laporan Hasil Praktikum'),
(35, 2, 19, '2024-04-25', 'Unguided List', 'Hasil Unguided Test'),
(36, 2, 20, '2024-05-01', 'Dictionary', 'Laporan Hasil Praktikum'),
(37, 2, 21, '2024-05-02', 'Unguided Dictionary', 'Hasil Unguided Test'),
(38, 2, 22, '2024-05-08', 'Tuples', 'Laporan Hasil Praktikum'),
(39, 2, 23, '2024-05-09', 'Unguided Tuples', 'Hasil Unguided Test'),
(40, 2, 24, '2024-05-15', 'Set', 'Laporan Hasil Praktikum'),
(41, 2, 25, '2024-05-16', 'Unguided Set', 'Hasil Unguided Test'),
(42, 2, 26, '2024-05-22', 'Rekursif', 'Laporan Hasil Praktikum'),
(43, 2, 27, '2024-05-23', 'Unguided Rekursif', 'Hasil Unguided Test'),
(44, 2, 28, '2024-05-29', ' Regular Expression', 'Laporan Hasil Praktikum'),
(45, 2, 29, '2024-05-30', 'Unguided  Regular Expression', 'Hasil Unguided Test'),
(46, 2, 30, '2024-06-20', 'UAS', 'UAS Praktikum Algoritma dan Pemrograman'),
(47, 3, 1, '2024-02-06', 'Pengantar Phython Programming', 'Laporan Hasil Praktikum'),
(48, 3, 2, '2024-02-07', 'Unguided Pengantar Phython Programming', 'Hasil Unguided Test'),
(49, 3, 3, '2024-02-13', 'Variabel, Expression & Statement', 'Laporan Hasil Praktikum'),
(50, 3, 4, '2024-02-14', 'Unguided Variabel, Expression & Statement', 'Hasil Unguided Test'),
(51, 3, 5, '2024-02-20', 'Struktur Kontrol Percabangan', 'Laporan Hasil Praktikum'),
(52, 3, 6, '2024-02-21', 'Unguided Struktur Kontrol Percabangan', 'Hasil Unguided Test'),
(53, 3, 7, '2024-02-27', 'Modular Programming: Fungsi', 'Laporan Hasil Praktikum'),
(54, 3, 8, '2024-02-28', 'Unguided Modular Programming: Fungsi', 'Hasil Unguided Test'),
(55, 3, 9, '2024-03-05', 'Struktur Kontrol Perulangan', 'Laporan Hasil Praktikum'),
(56, 3, 10, '2024-03-06', 'Unguided Struktur Kontrol Perulangan', 'Hasil Unguided Test'),
(57, 3, 11, '2024-03-12', 'Struktur Kontrol Kompleks', 'Laporan Hasil Praktikum'),
(58, 3, 12, '2024-03-13', 'Unguided Struktur Kontrol Kompleks', 'Hasil Unguided Test'),
(59, 3, 13, '2024-03-19', 'Pengolahan String', 'Laporan Hasil Praktikum'),
(60, 3, 14, '2024-03-20', 'Unguided Pengolahan String', 'Hasil Unguided Test'),
(61, 3, 15, '2024-04-03', 'UTS', 'UtS Praktikum Algoritma dan Pemrograman'),
(62, 3, 16, '2024-04-16', 'Membaca dan Menulis File', 'Laporan Hasil Praktikum'),
(63, 3, 17, '2024-04-17', 'Unguided Membaca dan Menulis File', 'Hasil Unguided Test'),
(64, 3, 18, '2024-04-23', 'List', 'Laporan Hasil Praktikum'),
(65, 3, 19, '2024-04-24', 'Unguided List', 'Hasil Unguided Test'),
(66, 3, 20, '2024-04-30', 'Dictionary', 'Laporan Hasil Praktikum'),
(67, 3, 21, '2024-05-01', 'Unguided Dictionary', 'Hasil Unguided Test'),
(68, 3, 22, '2024-05-07', 'Tuples', 'Laporan Hasil Praktikum'),
(69, 3, 23, '2024-05-08', 'Unguided Tuples', 'Hasil Unguided Test'),
(70, 3, 24, '2024-05-14', 'Set', 'Laporan Hasil Praktikum'),
(71, 3, 25, '2024-05-15', 'Unguided Set', 'Hasil Unguided Test'),
(72, 3, 26, '2024-05-21', 'Rekursif', 'Laporan Hasil Praktikum'),
(73, 3, 27, '2024-05-22', 'Unguided Rekursif', 'Hasil Unguided Test'),
(74, 3, 28, '2024-05-28', ' Regular Expression', 'Laporan Hasil Praktikum'),
(75, 3, 29, '2024-05-29', 'Unguided  Regular Expression', 'Hasil Unguided Test'),
(76, 3, 30, '2024-06-20', 'UAS', 'UAS Praktikum Algoritma dan Pemrograman'),
(77, 4, 1, '2024-02-08', 'Pengantar Perkuliahan', 'Tugas 1, Tes Besar 1, UTS'),
(78, 4, 2, '2024-02-15', 'Teori Himpunan dan Operasi Himpunan', 'Tugas 1, Tes Besar 1, UTS'),
(79, 4, 3, '2024-02-22', 'Relasi-relasi di antara elemen-elemen himpunan', 'Tugas 2, Tes Besar 1, UTS'),
(80, 4, 4, '2024-02-29', 'Fungsi dan sifat-sifatnya', 'Tugas 2, Tes Besar 1, UTS'),
(81, 4, 5, '2024-03-07', 'Teori bilangan dan aplikasinya', 'Tugas 3, Tes Besar 1, UTS'),
(82, 4, 6, '2024-03-14', 'Aplikasi teori bilangan bulat', 'Tugas 3, Tes Besar 1, UTS'),
(83, 4, 7, '2024-03-21', 'Matriks, dan operasi matriks', 'Tugas 3, Tes Besar 1, UTS'),
(84, 4, 8, '2024-03-25', 'UTS', 'UTS Matematika Diskrit'),
(85, 4, 9, '2024-04-18', 'Induksi matematika', 'Tugas 4, Tes Besar 2, UAS'),
(86, 4, 10, '2024-04-25', 'Aturan perhitungan', 'Tugas 5, Tes Besar 2, UAS'),
(87, 4, 11, '2024-05-02', 'Permutasi dan Kombinasi', 'Tugas 5, Tes Besar 2, UAS'),
(88, 4, 12, '2024-05-09', 'Koefisien binomial menggunakan pendekatan kombinatorial', 'Tugas 5, Tes Besar 2, UAS'),
(89, 4, 13, '2024-05-16', 'Relasi rekurensi dan penyelesaiannya menggunakan metode iteratif', 'Tugas 6, Tes Besar 2, UAS'),
(90, 4, 14, '2024-05-23', 'Penyelesaian Relasi Rekurensi menggunakan Persamaan Karakteristik', 'Tugas 6, Tes Besar 2, UAS'),
(91, 4, 15, '2024-05-30', 'Penyelesaian Relasi Rekurensi menggunakan Fungsi Pembangkit', 'Tugas 6, Tes Besar 2, UAS'),
(92, 4, 16, '2024-06-21', 'UAS', 'UAS Matematika Diskrit'),
(93, 5, 1, '2024-02-09', 'Kontrak Kuliah, Kesepakatan, dan Pendahuluan (definisi dan Jenis Statistik)', '-'),
(94, 5, 2, '2024-02-16', 'Pengantar Statistik: Populasi dan Sample Pemahaman Istilah Dasar Tipe Variabel Data Cross', 'Tugas 1'),
(95, 5, 3, '2024-02-23', 'Organisasi Data: Baris Data dan Kualitatif, Organisasi dan Menampilkan data', '-'),
(96, 5, 4, '2024-03-01', 'Penyebaran Data: Mean, Variance, Standar Deviasi', '-'),
(97, 5, 5, '2024-03-08', 'Probabilitas dan Peristiwa Komplementer', 'Tugas 2'),
(98, 5, 6, '2024-03-15', 'Probabilitas (lanjutan)', '-'),
(99, 5, 7, '2024-03-22', 'Evaluasi', '-'),
(100, 5, 8, '2024-04-05', 'UTS', 'UTS Statistik'),
(101, 5, 9, '2024-04-19', 'Probabilitas Variabel Random Diskrit', '-'),
(102, 5, 10, '2024-04-26', 'Probabilitas Variabel Random Diskrit (lanjutan)', '-'),
(103, 5, 11, '2024-05-03', 'Lanjutan topik inggu lalu', 'Tugas 3'),
(104, 5, 12, '2024-05-10', 'Variabel Random Kontinu dan Distribusi Normal', '-'),
(105, 5, 13, '2024-05-17', 'Variabel Random Kontinu dan Distribusi Normal (lanjutan)', '-'),
(106, 5, 14, '2024-05-24', 'Variabel Random Kontinu dan Distribusi Normal (lanjutan 2)', '-'),
(107, 5, 15, '2024-05-31', 'Pendalaman Materi Distribusi Normal', 'Tugas 4'),
(108, 5, 16, '2024-06-20', 'UAS', 'UAS Statistik');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int(11) NOT NULL,
  `nim` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `otp_attempts` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `nim`, `nama`, `otp`, `otp_attempts`) VALUES
(1, '71200001', 'Peserta 1', '790581', 0),
(2, '71200002', 'Peserta 2', '827025', 0),
(3, '71200003', 'Peserta 3', '021154', 0),
(4, '71200004', 'Peserta 4', '366225', 0);

-- --------------------------------------------------------

--
-- Table structure for table `peserta_sessions`
--

CREATE TABLE `peserta_sessions` (
  `id_session` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `telegram_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peserta_sessions`
--

INSERT INTO `peserta_sessions` (`id_session`, `nim`, `telegram_id`) VALUES
(16, '71200001', '1635603544'),
(19, '71200001', '1912972234'),
(5, '71200001', '5335768777'),
(11, '71200002', '945700636'),
(20, '71200003', '1300277152');

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id_presensi` int(11) NOT NULL,
  `id_enrollment` int(11) DEFAULT NULL,
  `minggu_pertemuan` int(11) NOT NULL,
  `hadir` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`id_presensi`, `id_enrollment`, `minggu_pertemuan`, `hadir`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 0),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 0),
(6, 1, 6, 1),
(7, 1, 7, 1),
(8, 1, 8, 1),
(9, 1, 9, 0),
(10, 1, 10, 1),
(11, 1, 11, 1),
(12, 1, 12, 1),
(13, 1, 13, 0),
(14, 1, 14, 1),
(15, 2, 1, 1),
(16, 2, 2, 1),
(17, 2, 3, 1),
(18, 2, 4, 1),
(19, 2, 5, 1),
(20, 2, 6, 0),
(21, 2, 7, 1),
(22, 2, 8, 1),
(23, 2, 9, 1),
(24, 2, 10, 1),
(25, 2, 11, 1),
(26, 2, 12, 0),
(27, 2, 13, 1),
(28, 2, 14, 1),
(29, 3, 1, 1),
(30, 3, 2, 0),
(31, 3, 3, 1),
(32, 3, 4, 1),
(33, 3, 5, 0),
(34, 3, 6, 1),
(35, 3, 7, 1),
(36, 3, 8, 1),
(37, 3, 9, 0),
(38, 3, 10, 1),
(39, 3, 11, 1),
(40, 3, 12, 1),
(41, 3, 13, 0),
(42, 3, 14, 1),
(43, 4, 1, 1),
(44, 4, 2, 1),
(45, 4, 3, 1),
(46, 4, 4, 1),
(47, 4, 5, 1),
(48, 4, 6, 0),
(49, 4, 7, 1),
(50, 4, 8, 1),
(51, 4, 9, 1),
(52, 4, 10, 1),
(53, 4, 11, 1),
(54, 4, 12, 0),
(55, 4, 13, 1),
(56, 4, 14, 1),
(57, 5, 1, 1),
(58, 5, 2, 1),
(59, 5, 3, 1),
(60, 5, 4, 0),
(61, 5, 5, 1),
(62, 5, 6, 1),
(63, 5, 7, 0),
(64, 5, 8, 1),
(65, 5, 9, 1),
(66, 5, 10, 1),
(67, 5, 11, 0),
(68, 5, 12, 1),
(69, 5, 13, 1),
(70, 5, 14, 1),
(71, 6, 1, 1),
(72, 6, 2, 1),
(73, 6, 3, 1),
(74, 6, 4, 1),
(75, 6, 5, 1),
(76, 6, 6, 0),
(77, 6, 7, 1),
(78, 6, 8, 1),
(79, 6, 9, 1),
(80, 6, 10, 1),
(81, 6, 11, 1),
(82, 6, 12, 1),
(83, 6, 13, 1),
(84, 6, 14, 1),
(85, 7, 1, 1),
(86, 7, 2, 1),
(87, 7, 3, 1),
(88, 7, 4, 0),
(89, 7, 5, 1),
(90, 7, 6, 1),
(91, 7, 7, 0),
(92, 7, 8, 1),
(93, 7, 9, 1),
(94, 7, 10, 1),
(95, 7, 11, 0),
(96, 7, 12, 1),
(97, 7, 13, 1),
(98, 7, 14, 1),
(99, 8, 1, 1),
(100, 8, 2, 1),
(101, 8, 3, 1),
(102, 8, 4, 1),
(103, 8, 5, 1),
(104, 8, 6, 0),
(105, 8, 7, 1),
(106, 8, 8, 1),
(107, 8, 9, 1),
(108, 8, 10, 1),
(109, 8, 11, 1),
(110, 8, 12, 1),
(111, 8, 13, 1),
(112, 8, 14, 1),
(113, 9, 1, 1),
(114, 9, 2, 0),
(115, 9, 3, 1),
(116, 9, 4, 1),
(117, 9, 5, 0),
(118, 9, 6, 1),
(119, 9, 7, 1),
(120, 9, 8, 1),
(121, 9, 9, 0),
(122, 9, 10, 1),
(123, 9, 11, 1),
(124, 9, 12, 1),
(125, 9, 13, 0),
(126, 9, 14, 1),
(127, 10, 1, 1),
(128, 10, 2, 1),
(129, 10, 3, 1),
(130, 10, 4, 1),
(131, 10, 5, 1),
(132, 10, 6, 0),
(133, 10, 7, 1),
(134, 10, 8, 1),
(135, 10, 9, 1),
(136, 10, 10, 1),
(137, 10, 11, 1),
(138, 10, 12, 0),
(139, 10, 13, 1),
(140, 10, 14, 1),
(141, 11, 1, 1),
(142, 11, 2, 1),
(143, 11, 3, 1),
(144, 11, 4, 1),
(145, 11, 5, 1),
(146, 11, 6, 0),
(147, 11, 7, 1),
(148, 11, 8, 1),
(149, 11, 9, 1),
(150, 11, 10, 1),
(151, 11, 11, 1),
(152, 11, 12, 1),
(153, 11, 13, 1),
(154, 11, 14, 1),
(155, 12, 1, 1),
(156, 12, 2, 0),
(157, 12, 3, 1),
(158, 12, 4, 1),
(159, 12, 5, 0),
(160, 12, 6, 1),
(161, 12, 7, 1),
(162, 12, 8, 1),
(163, 12, 9, 0),
(164, 12, 10, 1),
(165, 12, 11, 1),
(166, 12, 12, 1),
(167, 12, 13, 0),
(168, 12, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating_kepuasan`
--

CREATE TABLE `rating_kepuasan` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating_kepuasan`
--

INSERT INTO `rating_kepuasan` (`id`, `user_id`, `rating`, `tanggal`) VALUES
(1, 1300277152, 5, '2024-05-27 02:02:20'),
(2, 1300277152, 5, '2024-05-27 02:36:13'),
(3, 1300277152, 4, '2024-05-27 02:36:39'),
(4, 1300277152, 2, '2024-05-27 02:37:04'),
(5, 1300277152, 3, '2024-05-27 02:38:00'),
(6, 1247357326, 4, '2024-05-27 08:03:42'),
(7, 1226921830, 4, '2024-05-27 10:58:06'),
(8, 1370232359, 5, '2024-05-28 13:13:00'),
(9, 1380149915, 3, '2024-05-28 13:16:21'),
(10, 1235163413, 5, '2024-05-28 13:25:06'),
(11, 5284514263, 5, '2024-05-28 13:25:44'),
(12, 707826621, 4, '2024-05-28 13:29:11'),
(13, 1465739501, 5, '2024-05-28 14:28:38'),
(14, 1359603615, 3, '2024-05-29 01:26:07'),
(15, 1359603615, 3, '2024-05-29 01:26:11'),
(16, 1931243442, 5, '2024-05-29 13:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `judul_tugas` varchar(50) NOT NULL,
  `deskripsi_tugas` varchar(500) DEFAULT NULL,
  `deadline` datetime NOT NULL,
  `file_tugas` varchar(50) DEFAULT NULL,
  `bobot_tugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`id_tugas`, `id_kelas`, `judul_tugas`, `deskripsi_tugas`, `deadline`, `file_tugas`, `bobot_tugas`) VALUES
(1, 2, 'Join Telegram dan Moodle', 'Silakan join telegram dan Moodle', '2024-06-30 00:00:00', '-', 0),
(2, 2, 'Laporan 1', '-', '2024-05-28 18:00:00', '-', 5),
(3, 2, 'Laporan 2', '-', '2024-06-04 13:00:00', '-', 5),
(4, 3, 'Laporan 1', 'Silahkan mengumpulkan laporan praktikum minggu ini disini karena LMS sedang error. Pengumpulan file tetap dalam bentuk PDF sesuai dengan ketentuan yang berlaku', '2024-05-22 00:00:00', 'https://file_ketentuan_laporan.pdf', 5),
(5, 3, 'Laporan 2', 'Silahkan mengumpulkan dengan format .zip yang berisi 1 laporan praktikum berformat .pdf dan 1 buah source code berformat .ipynb dan sesuai dengan ketentuan yang ada.', '2024-05-29 00:00:00', 'https://file_ketentuan_laporan.pdf', 5),
(6, 3, 'Laporan 3', 'Kumpulkan link repository GitHub yang berisi file pdf laporan dan source code (file .py)', '2024-06-05 20:00:00', '-', 5),
(7, 4, 'Tugas 1', 'Harap saudara berlatih membaca setiap (semua) definisi dan turunannya di chapter 2 tentang Basic Structures: Sets, Functions, Sequences, Sums, and Matrices. Jika perlu saudara tulis pemahamana yang saudara dapat dari definisi definisi tersebut. Tentu hal ini tidak perlu saudara lakukan untuk semua definisi. Tulislah yang saudara anggap penting.', '2024-05-20 13:30:00', '-', 10),
(8, 4, 'Tugas 2', 'Tugas tidak perlu dikumpulkan. Abaikan tulisan ketentuan tugas yang diberikan sistem ini.', '2024-05-27 00:00:00', 'https://34158/Tugas_2.pdf', 10),
(9, 4, 'Tugas 3', 'Tugas tidak perlu dikumpulkan. Abaikan tulisan ketentuan tugas yang diberikan sistem ini. Harap saudara berlatih membaca setiap (semua) definisi dan turunannya di chapter 9 tentang Relations. Jika perlu saudara tulis pemahamana yang saudara dapat dari definisi definisi tersebut. Tentu hal ini tidak perlu saudara lakukan untuk semua definisi. Tulislah yang saudara anggap penting.', '2024-06-03 12:00:00', 'https://71728/Tugas_4.pdf', 10),
(10, 5, 'Tugas 1', 'Tempat pengumpulan Tugas 1', '2024-05-24 00:00:00', '-', 10),
(11, 5, 'Tugas 2', 'Silahkan kumpulkan hasil jawaban Tugas Bab 7 ke e-class ini', '2024-05-31 00:00:00', '-', 10),
(12, 5, 'UTS', 'Tempat pengumpulan UTS. Silakan kumpulkan scan kertas jawaban disini dalam bentuk pdf.', '2024-04-02 00:00:00', '-', 15),
(13, 5, 'Tugas 3', 'Batas waktu pengerjaan adalah jam 10.00. Tambahan waktu 10 menit hanya untuk kepentingan upload jawaban semata. Hasil jawaban di scan / potret serta di upload di eclass sebelum jam 10.10.', '2024-06-07 10:00:00', '-', 10),
(14, 2, 'Laporan 3', '-', '2024-06-17 13:00:00', '-', 10),
(15, 1, 'Tugas 1', 'Harap saudara meringkas materi Bab 1-9. Kumpulkan dalam format pdf. Terima kasih.', '2024-06-04 00:00:00', '-', 15),
(16, 4, 'Tugas 4', 'Harap saudara mempelajari materi chapter 10 dan 11, kemudian ringkaslah an kumpulkan dalam format pdf.', '2024-06-11 00:00:00', '-', 5),
(17, 5, 'Tugas 4', 'Silakan kumpulkan hasil jawaban Tugas Bab 14 ke e-class ini', '2024-06-02 00:00:00', '-', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asisten`
--
ALTER TABLE `asisten`
  ADD PRIMARY KEY (`id_asisten`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id_enrollment`),
  ADD KEY `id_peserta` (`id_peserta`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `input_user`
--
ALTER TABLE `input_user`
  ADD PRIMARY KEY (`id_input`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_matakuliah` (`id_matakuliah`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id_matakuliah`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_tugas` (`id_tugas`),
  ADD KEY `id_peserta` (`id_peserta`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `pertemuan`
--
ALTER TABLE `pertemuan`
  ADD PRIMARY KEY (`id_pertemuan`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indexes for table `peserta_sessions`
--
ALTER TABLE `peserta_sessions`
  ADD PRIMARY KEY (`id_session`),
  ADD UNIQUE KEY `nim` (`nim`,`telegram_id`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `id_enrollment` (`id_enrollment`);

--
-- Indexes for table `rating_kepuasan`
--
ALTER TABLE `rating_kepuasan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asisten`
--
ALTER TABLE `asisten`
  MODIFY `id_asisten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id_enrollment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `input_user`
--
ALTER TABLE `input_user`
  MODIFY `id_input` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `id_matakuliah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pertemuan`
--
ALTER TABLE `pertemuan`
  MODIFY `id_pertemuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peserta_sessions`
--
ALTER TABLE `peserta_sessions`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `rating_kepuasan`
--
ALTER TABLE `rating_kepuasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asisten`
--
ALTER TABLE `asisten`
  ADD CONSTRAINT `asisten_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliah` (`id_matakuliah`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`);

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_tugas`) REFERENCES `tugas` (`id_tugas`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`);

--
-- Constraints for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `pengumuman_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `pertemuan`
--
ALTER TABLE `pertemuan`
  ADD CONSTRAINT `pertemuan_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `peserta_sessions`
--
ALTER TABLE `peserta_sessions`
  ADD CONSTRAINT `peserta_sessions_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `peserta` (`nim`);

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `presensi_ibfk_1` FOREIGN KEY (`id_enrollment`) REFERENCES `enrollment` (`id_enrollment`);

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `tugas_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
