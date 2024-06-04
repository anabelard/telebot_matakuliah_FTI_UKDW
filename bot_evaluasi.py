import telebot
import mysql.connector
from wit import Wit
import random
import string
from datetime import datetime
import threading
import time
import requests
from requests.exceptions import ConnectionError
import json

# Token bot Telegram dan wit.ai
TELEGRAM_TOKEN = '' #ECLASSHELPER
WIT_AI_TOKEN = 'LEU7WRSP3KQQ6EDDKZFAOMMM7OLAUUUL'

bot = telebot.TeleBot(TELEGRAM_TOKEN)
wit_client = Wit(WIT_AI_TOKEN)

# Konfigurasi koneksi database
db = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="evaluasi_bot"
)



def get_tugas_terdekat(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND otugas.deadline >= NOW()
        ORDER BY otugas.deadline ASC LIMIT 1
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchone()

def get_deadline_tugas_besok(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND otugas.deadline = CURDATE() + INTERVAL 1 DAY
        ORDER BY otugas.deadline ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()


def get_tugas_hari_ini(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND otugas.deadline = CURDATE()
        ORDER BY otugas.deadline ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()

def get_tugas_minggu_ini(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND YEARWEEK(otugas.deadline, 1) = YEARWEEK(CURDATE(), 1)
        ORDER BY otugas.deadline ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()

def get_tugas_bulan_ini(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND otugas.deadline > CURDATE() AND otugas.deadline <= LAST_DAY(CURDATE())
        ORDER BY otugas.deadline ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()

def get_daftar_tugas(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND otugas.deadline >= NOW()
        ORDER BY otugas.deadline ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()

def get_tugas_belum_dikumpulkan(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN nilai onilai ON onilai.id_tugas = otugas.id_tugas
        JOIN peserta opeserta ON opeserta.id_peserta = onilai.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND otugas.deadline >= NOW() AND checked = 0
        ORDER BY otugas.deadline ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()



def get_daftar_pengumuman(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_pengumuman, isi_pengumuman, tanggal_berakhir
        FROM pengumuman opengu
        JOIN kelas okelas ON okelas.id_kelas = opengu.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s 
        ORDER BY opengu.tanggal_berakhir ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()

def get_pengumuman_terdekat(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_pengumuman, isi_pengumuman, tanggal_berakhir
        FROM pengumuman opengu
        JOIN kelas okelas ON okelas.id_kelas = opengu.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND opengu.tanggal_berakhir > CURDATE()
        ORDER BY opengu.tanggal_berakhir ASC LIMIT 1
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchone()

def get_pengumuman_hari_ini(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_pengumuman, isi_pengumuman, tanggal_berakhir
        FROM pengumuman opengu
        JOIN kelas okelas ON okelas.id_kelas = opengu.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND opengu.tanggal_berakhir > CURDATE()
        ORDER BY opengu.tanggal_berakhir ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()

def get_pengumuman_minggu_ini(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_pengumuman, isi_pengumuman, tanggal_berakhir
        FROM pengumuman opengu
        JOIN kelas okelas ON okelas.id_kelas = opengu.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND YEARWEEK(opengu.tanggal_berakhir, 1) = YEARWEEK(CURDATE(), 1)
        ORDER BY opengu.tanggal_berakhir ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()

def get_pengumuman_bulan_ini(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_pengumuman, isi_pengumuman, tanggal_berakhir
        FROM pengumuman opengu
        JOIN kelas okelas ON okelas.id_kelas = opengu.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND opengu.tanggal_berakhir > CURDATE() AND opengu.tanggal_berakhir <= LAST_DAY(CURDATE())
        ORDER BY opengu.tanggal_berakhir ASC
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()


def get_pengumuman_terbaru(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_pengumuman, isi_pengumuman, tanggal_berakhir
        FROM pengumuman opengu
        JOIN kelas okelas ON okelas.id_kelas = opengu.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s 
        ORDER BY opengu.id_pengumuman DESC LIMIT 1
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchone()

def get_pengumuman_by_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_pengumuman, isi_pengumuman, tanggal_berakhir
        FROM pengumuman opengu
        JOIN kelas okelas ON okelas.id_kelas = opengu.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s
        ORDER BY opengu.tanggal_berakhir ASC
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchall()

def get_pengumuman_terbaru_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_pengumuman, isi_pengumuman, tanggal_berakhir
        FROM pengumuman opengu
        JOIN kelas okelas ON okelas.id_kelas = opengu.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s
        ORDER by opengu.id_pengumuman DESC LIMIT 1
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchone()



def get_daftar_kelas(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT kode_matakuliah, sks_matakuliah, nama_matakuliah, grup_kelas, nama_dosen, diadakan_hari, waktu_mulai, waktu_selesai, diadakan_hari_2, waktu_mulai_2, waktu_selesai_2, ruangan_kode, ruangan_kode_2 
        FROM matakuliah omatkul 
        JOIN kelas okelas on okelas.id_matakuliah = omatkul.id_matakuliah 
        JOIN dosen odosen on okelas.id_dosen = odosen.id_dosen 
        JOIN enrollment oenrol on oenrol.id_kelas = okelas.id_kelas 
        JOIN peserta opeserta on opeserta.id_peserta = oenrol.id_peserta 
        WHERE opeserta.id_peserta = %s
    """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()

def get_info_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT kode_matakuliah, sks_matakuliah, deskripsi_matakuliah, pustaka, nama_matakuliah, grup_kelas, nama_dosen, diadakan_hari, waktu_mulai, waktu_selesai, diadakan_hari_2, waktu_mulai_2, waktu_selesai_2, ruangan_kode, ruangan_kode_2  
        FROM kelas okelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN dosen odosen on okelas.id_dosen = odosen.id_dosen 
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchone()

def get_pengajar_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nim_asisten, nama_asisten
        FROM kelas okelas 
        JOIN asisten oasist ON oasist.id_kelas = okelas.id_kelas
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s 
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchall()


def get_sistem_penilaian_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, nama_penilaian, bobot_penilaian 
        FROM kelas okelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        JOIN penilaian openil ON openil.id_kelas = okelas.id_kelas
        WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchall()

def get_nilai_tugas_matakuliah(nama_matakuliah, nama_tugas):
    cursor = db.cursor(dictionary=True)
    query = """
SELECT nama_matakuliah, grup_kelas, otugas.id_tugas, judul_tugas, nim, nama, nilai_peserta 
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN nilai onilai ON onilai.id_tugas = otugas.id_tugas
        JOIN peserta opeserta ON opeserta.id_peserta = onilai.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah 
        WHERE omatkul.nama_matakuliah = %s AND otugas.judul_tugas = %s
    """
    cursor.execute(query, (nama_matakuliah, nama_tugas))
    return cursor.fetchall()

def get_tugas_by_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s
        ORDER BY otugas.deadline ASC
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchall()

def get_tugas_terbaru(id_peserta):
        cursor = db.cursor(dictionary=True)
        query = """
            SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
            FROM tugas otugas
            JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
            JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
            JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
            JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
            WHERE opeserta.id_peserta = %s 
            ORDER by otugas.id_tugas DESC LIMIT 1
        """
        cursor.execute(query, (id_peserta, ))
        return cursor.fetchone()


def get_tugas_terbaru_matakuliah(id_peserta, nama_matakuliah):
        cursor = db.cursor(dictionary=True)
        query = """
            SELECT otugas.judul_tugas, otugas.deskripsi_tugas, otugas.file_tugas, otugas.deadline, omatkul.nama_matakuliah, okelas.grup_kelas
            FROM tugas otugas
            JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
            JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
            JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
            JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
            WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s
            ORDER by otugas.id_tugas DESC LIMIT 1
        """
        cursor.execute(query, (id_peserta, nama_matakuliah))
        return cursor.fetchone()


def get_materi_by_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, pertemuan_ke, tanggal_pelaksanaan, topik_pertemuan, kegiatan_kelas
        FROM pertemuan pert
        JOIN kelas k ON k.id_kelas = pert.id_kelas
        JOIN enrollment e ON e.id_kelas = k.id_kelas
        JOIN peserta p ON p.id_peserta = e.id_peserta
        JOIN matakuliah m ON m.id_matakuliah = k.id_matakuliah
        WHERE p.id_peserta = %s AND m.nama_matakuliah = %s
        ORDER BY pert.pertemuan_ke ASC
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchall()

def get_materi_by_pertemuan_matakuliah(id_peserta, nama_matakuliah, pertemuan_ke):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT kode_matakuliah, nama_matakuliah, grup_kelas, pertemuan_ke, tanggal_pelaksanaan, topik_pertemuan, kegiatan_kelas 
        FROM matakuliah m 
        JOIN kelas k ON m.id_matakuliah = k.id_matakuliah 
        JOIN pertemuan pert ON pert.id_kelas = k.id_kelas 
        JOIN enrollment e ON e.id_kelas = k.id_kelas 
        JOIN peserta p ON p.id_peserta = e.id_peserta 
        WHERE p.id_peserta = %s AND m.nama_matakuliah = %s AND pert.pertemuan_ke = %s
    """
    cursor.execute(query, (id_peserta, nama_matakuliah, pertemuan_ke))
    return cursor.fetchone()

def get_file_materi_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_materi, file_materi
        FROM materi omate
        JOIN kelas k ON k.id_kelas = omate.id_kelas
        JOIN enrollment e ON e.id_kelas = k.id_kelas
        JOIN peserta p ON p.id_peserta = e.id_peserta
        JOIN matakuliah m ON m.id_matakuliah = k.id_matakuliah
        WHERE p.id_peserta = %s AND m.nama_matakuliah = %s
        ORDER BY omate.id_materi ASC
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchall()

def get_materi_matakuliah_sebelum_now(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, pertemuan_ke, tanggal_pelaksanaan, topik_pertemuan, kegiatan_kelas
        FROM pertemuan pert
        JOIN kelas k ON k.id_kelas = pert.id_kelas
        JOIN enrollment e ON e.id_kelas = k.id_kelas
        JOIN peserta p ON p.id_peserta = e.id_peserta
        JOIN matakuliah m ON m.id_matakuliah = k.id_matakuliah
        WHERE p.id_peserta = %s AND m.nama_matakuliah = %s AND pert.tanggal_pelaksanaan < NOW()
        ORDER BY pert.tanggal_pelaksanaan DESC LIMIT 1
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchone()

def get_materi_matakuliah_sesudah_now(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, pertemuan_ke, tanggal_pelaksanaan, topik_pertemuan, kegiatan_kelas
        FROM pertemuan pert
        JOIN kelas k ON k.id_kelas = pert.id_kelas
        JOIN enrollment e ON e.id_kelas = k.id_kelas
        JOIN peserta p ON p.id_peserta = e.id_peserta
        JOIN matakuliah m ON m.id_matakuliah = k.id_matakuliah
        WHERE p.id_peserta = %s AND m.nama_matakuliah = %s AND pert.tanggal_pelaksanaan >= NOW()
        ORDER BY pert.tanggal_pelaksanaan ASC LIMIT 1
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchone()

def get_deadline_tugas_matakuliah(id_peserta, nama_matakuliah, nama_tugas):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_tugas, deskripsi_tugas, file_tugas, deadline 
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s AND otugas.judul_tugas = %s
    """
    cursor.execute(query, (id_peserta, nama_matakuliah, nama_tugas))
    return cursor.fetchone()

def get_deadline_tugas_terdekat_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, grup_kelas, judul_tugas, deskripsi_tugas, file_tugas, deadline 
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN enrollment oenroll ON oenroll.id_kelas = okelas.id_kelas
        JOIN peserta opeserta ON opeserta.id_peserta = oenroll.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s AND otugas.deadline >= NOW()
        ORDER BY otugas.deadline ASC LIMIT 1
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchone()

def cek_status_submission(id_peserta, nama_matakuliah, nama_tugas):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT nama_matakuliah, judul_tugas, checked
        FROM tugas otugas
        JOIN kelas okelas ON okelas.id_kelas = otugas.id_kelas 
        JOIN nilai onilai ON onilai.id_tugas = otugas.id_tugas
        JOIN peserta opeserta ON opeserta.id_peserta = onilai.id_peserta
        JOIN matakuliah omatkul ON omatkul.id_matakuliah = okelas.id_matakuliah
        WHERE opeserta.id_peserta = %s AND omatkul.nama_matakuliah = %s AND otugas.judul_tugas = %s
    """
    cursor.execute(query, (id_peserta, nama_matakuliah, nama_tugas))
    return cursor.fetchone()


def get_presensi_by_matakuliah(id_peserta, nama_matakuliah):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT 
        ROUND(AVG(hadir)*100) AS rata_rata_kehadiran,
        COUNT(*) AS total_pertemuan, 
        SUM(hadir) AS total_kehadiran,
        COUNT(*) - SUM(hadir) AS total_ketidakhadiran    
        FROM presensi p
        JOIN enrollment e ON e.id_enrollment = p.id_enrollment
        JOIN peserta ps ON ps.id_peserta = e.id_peserta
        JOIN kelas k ON e.id_kelas = k.id_kelas
        JOIN matakuliah m ON m.id_matakuliah = k.id_matakuliah
        WHERE ps.id_peserta = %s AND m.nama_matakuliah = %s
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    return cursor.fetchone()

def get_kelas_hari_ini(id_peserta):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT kode_matakuliah, nama_matakuliah, grup_kelas, nama_dosen, diadakan_hari, waktu_mulai, waktu_selesai, diadakan_hari_2, waktu_mulai_2, waktu_selesai_2, ruangan_kode, ruangan_kode_2 
        FROM matakuliah omatkul 
        JOIN kelas okelas on okelas.id_matakuliah = omatkul.id_matakuliah 
        JOIN dosen odosen on okelas.id_dosen = odosen.id_dosen 
        JOIN enrollment oenrol on oenrol.id_kelas = okelas.id_kelas 
        JOIN peserta opeserta on opeserta.id_peserta = oenrol.id_peserta 
        WHERE 
        opeserta.id_peserta = %s AND 
        (
        CASE DAYNAME(CURDATE())
            WHEN 'Monday' THEN 'Senin'
            WHEN 'Tuesday' THEN 'Selasa'
            WHEN 'Wednesday' THEN 'Rabu'
            WHEN 'Thursday' THEN 'Kamis'
            WHEN 'Friday' THEN 'Jumat'
            WHEN 'Saturday' THEN 'Sabtu'
            WHEN 'Sunday' THEN 'Minggu'
        END = okelas.diadakan_hari 
        OR 
        CASE DAYNAME(CURDATE())
            WHEN 'Monday' THEN 'Senin'
            WHEN 'Tuesday' THEN 'Selasa'
            WHEN 'Wednesday' THEN 'Rabu'
            WHEN 'Thursday' THEN 'Kamis'
            WHEN 'Friday' THEN 'Jumat'
            WHEN 'Saturday' THEN 'Sabtu'
            WHEN 'Sunday' THEN 'Minggu'
        END = okelas.diadakan_hari_2
        ) 
        """
    cursor.execute(query, (id_peserta,))
    return cursor.fetchall()



def is_peserta_enrolled(id_peserta, nama_matakuliah):
    cursor = db.cursor()
    query = """
        SELECT COUNT(*)
        FROM peserta p
        JOIN enrollment e ON e.id_peserta = p.id_peserta
        JOIN kelas k ON e.id_kelas = k.id_kelas
        JOIN matakuliah m ON m.id_matakuliah = k.id_matakuliah
        WHERE p.id_peserta = %s AND m.nama_matakuliah = %s
    """
    cursor.execute(query, (id_peserta, nama_matakuliah))
    result = cursor.fetchone()
    return result[0] > 0



def insert_input_user(username, first_name, last_name, response):
    data_json = json.dumps(response)
    cursor = db.cursor()
    query = """
        INSERT INTO input_user (username, first_name, last_name, input_result) VALUES (%s, %s, %s, %s)
    """
    cursor.execute(query, (username, first_name, last_name, data_json))
    db.commit()


def randomize_default_response():
    responses = [
        'Maaf, saya kurang mengerti apa yang anda tanyakan atau saya belum memiliki pengetahuan untuk menjawab pertanyaan anda. Bolehkah ulangi pertanyaan Anda dengan kalimat yang lebih mudah dipahami?',
        'Maaf, saya belum mengerti pertanyaan anda dengan baik atau saya belum memiliki pengetahuan untuk menjawab pertanyaan anda. Bolehkah Anda perjelas lagi pertanyaan anda?',
        'Maaf, saya kurang paham maksud dari pertanyaan Anda atau saya belum memiliki pengetahuan untuk menjawab pertanyaan anda. Bolehkah Anda menjelaskan ulang dengan kalimat yang lebih mudah dimengerti?',
        'Maaf, saya kebingungan dengan maksud pertanyaan Anda atau saya belum memiliki pengetahuan untuk menjawab pertanyaan anda. Bolehkah Anda memaparkannya lagi dengan kalimat yang lebih jelas?'
    ]
    randomized_response = random.choice(responses)
    return randomized_response


# Generate kode otp (one-time password)
def generate_otp():
    return ''.join(random.choices(string.digits, k=6))

# Update otp pengguna di database
def update_otp(nim, otp):
    cursor = db.cursor()
    query = "UPDATE peserta SET otp = %s, otp_attempts = 0 WHERE nim = %s"
    cursor.execute(query, (otp, nim))
    db.commit()



# 
def get_user_info(telegram_id):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT p.* 
        FROM peserta p 
        JOIN peserta_sessions ps ON p.nim = ps.nim 
        WHERE ps.telegram_id = %s
    """
    cursor.execute(query, (telegram_id,))
    return cursor.fetchone()

def clear_telegram_id(telegram_id):
    cursor = db.cursor()
    query = "DELETE FROM peserta_sessions WHERE telegram_id = %s"
    cursor.execute(query, (telegram_id,))
    db.commit()
    return cursor.rowcount > 0

# Fungsi untuk menampilkan tombol rating
def send_rating_keyboard(chat_id):
    markup = telebot.types.InlineKeyboardMarkup()
    for i in range(1, 6):
        markup.add(telebot.types.InlineKeyboardButton(text=str(i), callback_data=f'rating_{i}'))
    bot.send_message(chat_id, "Terima kasih telah menggunakan sistem ini! Berikan rating kepuasan Anda (1-5):", reply_markup=markup)


def add_telegram_id(nim, telegram_id):
    cursor = db.cursor()
    query = "INSERT INTO peserta_sessions (nim, telegram_id) VALUES (%s, %s) ON DUPLICATE KEY UPDATE telegram_id = VALUES(telegram_id)"
    cursor.execute(query, (nim, telegram_id))
    db.commit()

# Fungsi untuk menyimpan rating ke database
def save_rating(user_id, rating):
    cursor = db.cursor()
    query = "INSERT INTO rating_kepuasan (user_id, rating, tanggal) VALUES (%s, %s, %s)"
    cursor.execute(query, (user_id, rating, datetime.now()))
    db.commit()



@bot.message_handler(commands=['start'])
def send_welcome(message):
    clear_telegram_id(message.chat.id)
    msg = bot.reply_to(message, "Selamat datang! Saya adalah Bot yang memudahkan pengguna mengakses data terkait matakuliah di E-class UKDW. Untuk memulai, silakan masukkan NIM Anda atau ketik /logout untuk keluar.")
    bot.register_next_step_handler(msg, process_nim_step)

def process_nim_step(message):
    if message.text == '/logout':
        if clear_telegram_id(message.chat.id):
            bot.reply_to(message, "Anda telah berhasil logout.")
        else:
            bot.reply_to(message, "Terjadi kesalahan saat logout. Mungkin Anda belum login.")
        return

    nim = message.text
    if not nim.isdigit():
        msg = bot.reply_to(message, "NIM harus berupa angka. Silakan masukkan NIM yang benar atau ketik /logout untuk keluar.")
        bot.register_next_step_handler(msg, process_nim_step)
        return

    chat_id = message.chat.id

    cursor = db.cursor(dictionary=True)
    query = "SELECT id_peserta FROM peserta WHERE nim = %s"
    cursor.execute(query, (nim,))
    result = cursor.fetchone()

    if result:
        id_peserta = result['id_peserta']
        otp = generate_otp()
        update_otp(nim, otp)
        bot.send_message(chat_id, f'Kode verifikasi Anda adalah: {otp}. Silakan masukkan kode verifikasi tersebut atau ketik /logout untuk keluar.')
        bot.register_next_step_handler(message, process_otp_step, nim, chat_id)
    else:
        msg = bot.reply_to(message, "NIM tidak ditemukan. Silakan coba lagi atau ketik /logout untuk keluar.")
        bot.register_next_step_handler(msg, process_nim_step)

def process_otp_step(message, nim, chat_id):
    if message.text == '/logout':
        if clear_telegram_id(chat_id):
            bot.reply_to(message, "Anda telah berhasil logout.")
        else:
            bot.reply_to(message, "Terjadi kesalahan saat logout. Mungkin Anda belum login.")
        return

    otp = message.text

    cursor = db.cursor()
    query = "SELECT otp, otp_attempts, nama FROM peserta WHERE nim = %s"
    cursor.execute(query, (nim,))
    result = cursor.fetchone()

    if result:
        stored_otp, otp_attempts, nama = result

        if stored_otp == otp:
            add_telegram_id(nim, chat_id)
            bot.reply_to(message, f"Verifikasi berhasil! Halo {nama}, Anda sekarang dapat bertanya hal mengenai matakuliah Anda.")
            query1 = """
                SELECT kode_matakuliah, nama_matakuliah, grup_kelas, nama_dosen, diadakan_hari, waktu_mulai, waktu_selesai, diadakan_hari_2, waktu_mulai_2, waktu_selesai_2, ruangan_kode, ruangan_kode_2,  sks_matakuliah
                FROM matakuliah omatkul 
                JOIN kelas okelas on okelas.id_matakuliah = omatkul.id_matakuliah 
                JOIN dosen odosen on okelas.id_dosen = odosen.id_dosen 
                JOIN enrollment oenrol on oenrol.id_kelas = okelas.id_kelas 
                JOIN peserta opeserta on opeserta.id_peserta = oenrol.id_peserta 
                WHERE opeserta.nim = %s
            """
            cursor.execute(query1, (nim,))
            result = cursor.fetchall()
            # print(result)
            response = f"Matakuliah Anda:\n\n"
            for kelas in result:
                response += (
                    f"Kode Matakuliah: {kelas[0]}\n"
                    f"Nama Matakuliah: {kelas[1]}\n"
                    f"Grup Kelas: {kelas[2]}\n"
                    f"SKS: {kelas[12]}\n"
                    f"Jadwal:\n"
                    f"- {kelas[4]}, {kelas[5]} - {kelas[6]} ({kelas[10]})\n"
                    f"- {kelas[7]}, {kelas[8]} - {kelas[9]} ({kelas[11]})\n"
                    f"Dosen Pengajar: {kelas[3]}\n\n"
                )
            bot.reply_to(message, response)
        else:
            otp_attempts += 1
            if otp_attempts >= 5:
                msg = bot.reply_to(message, "Anda telah salah memasukkan kode OTP sebanyak 5 kali. Silakan masukkan NIM Anda lagi atau ketik /logout untuk keluar.")
                bot.register_next_step_handler(msg, process_nim_step)
            else:
                query = "UPDATE peserta SET otp_attempts = %s WHERE nim = %s"
                cursor.execute(query, (otp_attempts, nim))
                db.commit()
                msg = bot.reply_to(message, f"Kode verifikasi salah. Anda memiliki {5 - otp_attempts} kesempatan lagi. Silakan masukkan kode verifikasi yang benar atau ketik /logout untuk keluar.")
                bot.register_next_step_handler(msg, process_otp_step, nim, chat_id)
    else:
        msg = bot.reply_to(message, "Terjadi kesalahan. Silakan coba lagi atau ketik /logout untuk keluar.")
        bot.register_next_step_handler(msg, process_nim_step)

@bot.message_handler(commands=['logout'])
def logout(message):
    if clear_telegram_id(message.from_user.id):
        bot.reply_to(message, "Anda telah berhasil logout.")
        send_rating_keyboard(message.chat.id)
    else:
        bot.reply_to(message, "Terjadi kesalahan saat logout. Mungkin Anda belum login.")

@bot.callback_query_handler(func=lambda call: call.data.startswith('rating_'))
def handle_rating(call):
    rating = int(call.data.split('_')[1])
    save_rating(call.from_user.id, rating)
    bot.answer_callback_query(call.id, text=f"Terima kasih atas rating {rating} Anda!")
    bot.send_message(call.message.chat.id, "Terima kasih atas feedback Anda!")



# Guide untuk memandu pengguna agar dapat membuat kalimat pertanyaan yang bisa dimengerti oleh bot
@bot.message_handler(commands=['help'])
def send_help(message):
    help_text = (
        "Berikut adalah beberapa petunjuk yang bisa anda gunakan untuk bertanya jika Bot belum memberikan jawaban yang Anda inginkan:\n\n"
        " ⦿ Pengetahuan yang tersedia pada Bot saat ini berfokus pada informasi tugas, deadline, pengumuman, jadwal dan materi matakuliah.\n"
        " ⦿ Dalam sistem ini, Anda juga dapat bertanya terkait jadwal, ruang kelas dan pengajar matakuliah, nilai, presensi, daftar kelas, tugas dan pengumuman, deadline tugas pada waktu tertentu (misal: deadline tugas hari ini/minggu ini), tugas dan pengumuman terbaru, materi pertemuan sebelumnya/selanjutnya, dan status pengumpulan tugas.\n"
        "\n ⦿ Untuk mengetahui informasi dari tugas tertentu (deadline, cek apakah sudah kumpul tugas, nilai), Anda bisa menyertakan judul tugas dan nama matakuliah pada pertanyaan anda.\n"
        " ⦿ Untuk mengetahui pengumuman matakuliah tertentu, Anda bisa menyertakan nama matakuliah pada pertanyaan anda.\n"
        " ⦿ Untuk mengetahui topik materi dan jadwal pertemuan tertentu sebuah matakuliah, Anda dapat menyertakan nama matakuliah pada pertanyaan anda untuk melihat materi dan jadwal untuk semua pertemuan pada matakuliah tersebut, dan menyebutkan pertemuan spesifik (pertemuan ke-berapa) untuk mengetahui materi dan jadwal pada pertemuan tersebut.\n"
        " ⦿ Untuk melihat nilai tugas tertentu, Anda dapat menyertakan nama tugas dan nama matakuliah pada pertanyaan anda.\n"
        " ⦿ Untuk mendapatkan link file materi, Anda dapat menyertakan kata kunci 'file' dan nama matakuliah pada pertanyaan anda.\n"
        "\nDISCLAIMER:\n"
        " ⦿ Data yang ada dalam sistem saat ini adalah data dummy.\n"
        " ⦿ Pembangunan sistem ini masih dalam tahap penelitian, jadi ada kemungkinan sistem salah mengartikan pertanyaan pengguna.\n"
        " ⦿ Fitur keamanan pada sistem final akan menggunakan cara mengirimkan kode verifikasi (otp) ke email mahasiswa. Sistem untuk evaluasi saat ini akan menggunakan cara mengirimkan kode verifikasi ke telegram pengguna.\n"
        "\nAnda bisa melanjutkan memberikan pertanyaan atau ketik /logout untuk keluar.\n"

    )
    bot.reply_to(message, help_text)

@bot.message_handler(func=lambda message: True)
def handle_message(message):
    response = wit_client.message(message.text)
    intents = response['intents']
    entities = response['entities']

    # print(message)
    print(message.from_user.username) #str
    print(message.from_user.first_name) #str
    print(message.from_user.last_name) #str

    username = message.from_user.username
    first_name = message.from_user.first_name
    last_name = message.from_user.last_name

    print(response,'\n') #dict

    # Input pesan user dan result wit.ai ke database
    insert_input_user(username, first_name, last_name, response)

    if not intents:
        reply = randomize_default_response()
        reply += '\n\nAnda bisa menggunakan command /help untuk petunjuk bertanya.'
        bot.reply_to(message, reply)
        return

    intent = intents[0]['name']

    # Tugas
    if intent == 'deadline_tugas_terdekat':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            tugas_terdekat = get_tugas_terdekat(user_info['id_peserta'])
            if tugas_terdekat:
                response = (
                    f"Tugas terdekat Anda:\n\n"
                    f"Matakuliah: {tugas_terdekat['nama_matakuliah']} {tugas_terdekat['grup_kelas']}\n"
                    f"Judul Tugas: {tugas_terdekat['judul_tugas']}\n"
                    f"Deskripsi: {tugas_terdekat['deskripsi_tugas']}\n"
                    f"File Tugas: {tugas_terdekat['file_tugas']}\n"
                    f"Deadline: {tugas_terdekat['deadline'].strftime('%d-%m-%Y %H:%M')}\n\n"
                )
            else:
                response = "Anda tidak memiliki tugas yang terdaftar."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'deadline_tugas_terdekat_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    tugas = get_deadline_tugas_terdekat_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    if tugas:
                        response = f"Tugas untuk matakuliah {nama_matakuliah}:\n\nNama Tugas: {tugas['judul_tugas']}\nDeskripsi: {tugas['deskripsi_tugas']}\nFile Tugas: {tugas['file_tugas']}\nDeadline: {tugas['deadline'].strftime('%d-%m-%Y %H:%M')}\n"
                    else:
                        response = f"Tidak ada tugas yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'deadline_tugas_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities and 'tugas:nama_tugas' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                nama_tugas = entities['tugas:nama_tugas'][0]['value']

                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    tugas = get_deadline_tugas_matakuliah(user_info['id_peserta'], nama_matakuliah, nama_tugas)
                    if tugas:
                        response = f"Deadline dari {tugas['judul_tugas']} {tugas['nama_matakuliah']} {tugas['grup_kelas']} adalah tanggal {tugas['deadline'].strftime('%d-%m-%Y %H:%M')}"
                    else:
                        response = (f"Tidak ada data untuk {nama_tugas} di matakuliah {nama_matakuliah}.")
                else:
                    response = f"Anda tidak terdaftar di matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan informasi tugas atau matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'deadline_tugas_besok':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            tugas_terdekat = get_deadline_tugas_besok(user_info['id_peserta'])
            if tugas_terdekat:
                response = f"Tugas Anda yang deadlinenya besok:\n\n"
                for tugas in tugas_terdekat:
                    response += (
                        f"Matakuliah: {tugas['nama_matakuliah']} {tugas['grup_kelas']}\n"
                        f"Judul Tugas: {tugas['judul_tugas']}\n"
                        f"Deskripsi: {tugas['deskripsi_tugas']}\n"
                        f"File Tugas: {tugas['file_tugas']}\n"
                        f"Deadline: {tugas['deadline'].strftime('%d-%m-%Y %H:%M')}\n\n"
                    )
            else:
                response = "Anda tidak memiliki tugas yang deadlinenya besok."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'tugas_hari_ini' or intent == 'deadline_tugas_hari_ini':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            tugas_today = get_tugas_hari_ini(user_info['id_peserta'])
            if tugas_today:
                response = f"Tugas Anda hari ini:\n\n"
                for tugas in tugas_today:
                    response = (
                        f"Matakuliah: {tugas['nama_matakuliah']} {tugas['grup_kelas']}\n"
                        f"Judul Tugas: {tugas['judul_tugas']}\n"
                        f"Deskripsi: {tugas['deskripsi_tugas']}\n"
                        f"File Tugas: {tugas['file_tugas']}\n"
                        f"Deadline: {tugas['deadline'].strftime('%d-%m-%Y %H:%M')}\n\n"
                    )
            else:
                response = "Anda tidak memiliki tugas hari ini."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'tugas_minggu_ini' or intent == 'deadline_tugas_minggu_ini':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            tugas_week = get_tugas_minggu_ini(user_info['id_peserta'])
            if tugas_week:
                response = f"Tugas Anda minggu ini:\n\n"
                for tugas in tugas_week:
                    response += (
                        f"Matakuliah: {tugas['nama_matakuliah']} {tugas['grup_kelas']}\n"
                        f"Judul Tugas: {tugas['judul_tugas']}\n"
                        f"Deskripsi: {tugas['deskripsi_tugas']}\n"
                        f"File Tugas: {tugas['file_tugas']}\n"
                        f"Deadline: {tugas['deadline'].strftime('%d-%m-%Y %H:%M')}\n\n"
                    )
            else:
                response = "Anda tidak memiliki tugas minggu ini."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'tugas_bulan_ini':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            tugas_month = get_tugas_bulan_ini(user_info['id_peserta'])
            if tugas_month:
                response = f"Tugas Anda bulan ini:\n\n"
                for tugas in tugas_month:
                    response += (
                        f"Matakuliah: {tugas['nama_matakuliah']} {tugas['grup_kelas']}\n"
                        f"Judul Tugas: {tugas['judul_tugas']}\n"
                        f"Deskripsi: {tugas['deskripsi_tugas']}\n"
                        f"File Tugas: {tugas['file_tugas']}\n"
                        f"Deadline: {tugas['deadline'].strftime('%d-%m-%Y %H:%M')}\n\n"
                    )
            else:
                response = "Anda tidak memiliki tugas bulan ini."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'tugas_terbaru':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            tugas = get_tugas_terbaru(user_info['id_peserta'])
            if tugas:
                response = (
                    f"Tugas terbaru Anda:\n\n"
                    f"Matakuliah: {tugas['nama_matakuliah']} {tugas['grup_kelas']}\n"
                    f"Judul Tugas: {tugas['judul_tugas']}\n"
                    f"Deskripsi: {tugas['deskripsi_tugas']}\n"
                    f"File Tugas: {tugas['file_tugas']}\n"
                    f"Deadline: {tugas['deadline'].strftime('%d-%m-%Y %H:%M')}\n\n"
                )
            else:
                response = "Anda tidak memiliki tugas terbaru."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'tugas_terbaru_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    tugas = get_tugas_terbaru_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    if tugas:
                        response = (
                            f"Tugas terbaru {tugas['nama_matakuliah']} {tugas['grup_kelas']}:\n\n"
                            f"Judul Tugas: {tugas['judul_tugas']}\n"
                            f"Deskripsi: {tugas['deskripsi_tugas']}\n"
                            f"File Tugas: {tugas['file_tugas']}\n"
                            f"Deadline: {tugas['deadline'].strftime('%d-%m-%Y %H:%M')}\n\n"
                        )
                    else:
                        response = f"Tidak ada tugas yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'cek_tugas_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    tugas = get_tugas_by_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    if tugas:
                        response = f"Tugas untuk matakuliah {nama_matakuliah}:\n"
                        for tugas_item in tugas:
                            response += f"\nNama Tugas: {tugas_item['judul_tugas']}\nDeskripsi: {tugas_item['deskripsi_tugas']}\nFile Tugas: {tugas_item['file_tugas']}\nDeadline: {tugas_item['deadline'].strftime('%d-%m-%Y %H:%M')}\n"
                    else:
                        response = f"Tidak ada tugas yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'daftar_tugas':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            list_tugas = get_daftar_tugas(user_info['id_peserta'])
            if list_tugas:
                response = f"Tugas Anda:\n\n"
                for tugas_item in list_tugas:
                    response += f"Matakuliah: {tugas_item['nama_matakuliah']} {tugas_item['grup_kelas']}\nJudul Tugas: {tugas_item['judul_tugas']}\nDeskripsi: {tugas_item['deskripsi_tugas']}\nFile Tugas: {tugas_item['file_tugas']}\nDeadline: {tugas_item['deadline'].strftime('%d-%m-%Y %H:%M')}\n\n"
            else:
                response = "Anda tidak memiliki tugas yang terdaftar."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'detail_tugas_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities and 'tugas:nama_tugas' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                nama_tugas = entities['tugas:nama_tugas'][0]['value']

                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    tugas = get_deadline_tugas_matakuliah(user_info['id_peserta'], nama_matakuliah, nama_tugas)
                    if tugas:
                        response = f"Detail dari {tugas['judul_tugas']} {tugas['nama_matakuliah']} {tugas['grup_kelas']} adalah: \n{tugas['deskripsi_tugas']}\nFile Tugas: {tugas['file_tugas']}\nDeadline: {tugas['deadline'].strftime('%d-%m-%Y %H:%M')}"
                    else:
                        response = (f"Tidak ada data untuk {nama_tugas} di matakuliah {nama_matakuliah}.")
                else:
                    response = f"Anda tidak terdaftar di matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan informasi tugas atau matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'cek_status_pengumpulan_tugas':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities and 'tugas:nama_tugas' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                nama_tugas = entities['tugas:nama_tugas'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    cekstatus = cek_status_submission(user_info['id_peserta'], nama_matakuliah, nama_tugas)
                    print(cekstatus)
                    if cekstatus:
                        if cekstatus['checked'] == 1:
                            response = f"Anda sudah mengumpulkan {nama_tugas} {nama_matakuliah}."
                        else: 
                            response = f"Anda belum mengumpulkan {nama_tugas} {nama_matakuliah}."
                    else:
                        response = (f"Tidak ada data untuk {nama_tugas} di matakuliah {nama_matakuliah}.")
                else:
                    response = f"Anda tidak terdaftar di matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan informasi tugas atau matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'cek_tugas_belum_dikumpulkan':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            list_tugas = get_tugas_belum_dikumpulkan(user_info['id_peserta'])
            if list_tugas:
                response = f"Tugas Anda yang belum dikumpulkan:\n\n"
                for tugas_item in list_tugas:
                    response += f"Matakuliah: {tugas_item['nama_matakuliah']} {tugas_item['grup_kelas']}\nJudul Tugas: {tugas_item['judul_tugas']}\nDeskripsi: {tugas_item['deskripsi_tugas']}\nFile Tugas: {tugas_item['file_tugas']}\nDeadline: {tugas_item['deadline'].strftime('%d-%m-%Y %H:%M')}\n\n"
            else:
                response = "Anda tidak memiliki tugas yang terdaftar."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."



    # Materi
    elif intent == 'cek_materi_matakuliah': 
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    materi = get_materi_by_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    # print(materi,'\n\n')
                    if materi:
                        response = f"Materi untuk matakuliah {nama_matakuliah}:\n"
                        for materi_item in materi:
                            response += f"\nPertemuan: {materi_item['pertemuan_ke']}\nTanggal: {materi_item['tanggal_pelaksanaan'].strftime('%d-%m-%Y')}\nMateri: {materi_item['topik_pertemuan']}\nPenilaian: {materi_item['kegiatan_kelas']}\n"
                    else:
                        response = f"Tidak ada materi yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'cek_materi_pertemuan_matakuliah': 
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities and 'pertemuan:pertemuan_ke' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                pertemuan_ke = entities['pertemuan:pertemuan_ke'][0]['value']

                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    materi = get_materi_by_pertemuan_matakuliah(user_info['id_peserta'], nama_matakuliah, pertemuan_ke)
                    if materi:
                        response = (
                            f"Materi pertemuan ke-{pertemuan_ke} untuk matakuliah {nama_matakuliah}:\n"
                            f"{materi['topik_pertemuan']}\n"
                            f"Tanggal Pelaksanaan: {materi['tanggal_pelaksanaan'].strftime('%d-%m-%Y')}\n"
                            f"Penilaian: {materi['kegiatan_kelas']}\n"
                        )
                    else:
                        response = (f"Tidak ada data untuk pertemuan ke-{pertemuan_ke} di matakuliah {nama_matakuliah}.")
                else:
                    response = f"Anda tidak terdaftar di matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan informasi pertemuan atau matakuliah dalam permintaan Anda."        
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'cek_materi_terdekat_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    sebelum = get_materi_matakuliah_sebelum_now(user_info['id_peserta'], nama_matakuliah)
                    sesudah = get_materi_matakuliah_sesudah_now(user_info['id_peserta'], nama_matakuliah)
                    response = f''
                    if sebelum:
                        response = f"Materi untuk matakuliah {nama_matakuliah} pertemuan sebelumnya:\n"
                        response += f"Pertemuan: {sebelum['pertemuan_ke']}\nTanggal: {sebelum['tanggal_pelaksanaan'].strftime('%d-%m-%Y')}\nMateri: {sebelum['topik_pertemuan']}\nPenilaian: {sebelum['kegiatan_kelas']}\n\n"
                    if sesudah:
                        response += f"Materi untuk matakuliah {nama_matakuliah} pertemuan selanjutnya:\n"
                        response += f"Pertemuan: {sesudah['pertemuan_ke']}\nTanggal: {sesudah['tanggal_pelaksanaan'].strftime('%d-%m-%Y')}\nMateri: {sesudah['topik_pertemuan']}\nPenilaian: {sesudah['kegiatan_kelas']}\n"
                    else:
                        response = f"Tidak ada materi yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'file_materi':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    files = get_file_materi_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    if files:
                        response = f"Link materi untuk matakuliah {nama_matakuliah}:\n"
                        for file in files:
                            response += f"\nJudul: {file['judul_materi']}\nLink: https://{file['file_materi']}\n"
                    else:
                        response = f"Tidak ada materi yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."



    # Kelas
    elif intent == 'daftar_kelas':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            jadwal = get_daftar_kelas(user_info['id_peserta'])
            # print(jadwal)
            if jadwal:
                response = f"Matakuliah Anda:\n\n"
                for kelas in jadwal:
                    response += (
                        f"Kode Matakuliah: {kelas['kode_matakuliah']}\n"
                        f"Nama Matakuliah: {kelas['nama_matakuliah']}\n"
                        f"Grup Kelas: {kelas['grup_kelas']}\n"
                        f"SKS: {kelas['sks_matakuliah']}\n"
                        f"Jadwal:\n"
                        f"- {kelas['diadakan_hari']}, {kelas['waktu_mulai']} - {kelas['waktu_selesai']} ({kelas['ruangan_kode']})\n"
                        f"- {kelas['diadakan_hari_2']}, {kelas['waktu_mulai_2']} - {kelas['waktu_selesai']} ({kelas['ruangan_kode_2']})\n"
                        f"Dosen Pengajar: {kelas['nama_dosen']}\n\n"
                    )
            else:
                response = "Anda tidak memiliki kelas hari ini."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'kelas_hari_ini':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            jadwal = get_kelas_hari_ini(user_info['id_peserta'])
            if jadwal:
                response = f"Kelas Anda Hari Ini:\n\n"
                for kelas in jadwal:
                    response += (
                        f"Kode Matakuliah: {kelas['kode_matakuliah']}\n"
                        f"Nama Matakuliah: {kelas['nama_matakuliah']}\n"
                        f"Grup Kelas: {kelas['grup_kelas']}\n"
                        f"Jadwal:\n"
                        f"- {kelas['diadakan_hari']}, {kelas['waktu_mulai']} - {kelas['waktu_selesai']} ({kelas['ruangan_kode']})\n"
                        f"- {kelas['diadakan_hari_2']}, {kelas['waktu_mulai_2']} - {kelas['waktu_selesai_2']} ({kelas['ruangan_kode_2']})\n"
                        f"Dosen Pengajar: {kelas['nama_dosen']}\n\n"
                    )
            else:
                response = "Anda tidak memiliki kelas hari ini."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'cek_jadwal_matakuliah' or intent == 'cek_ruang_kelas':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    kelas = get_info_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    if kelas:
                        response = (
                            f"Jadwal dan ruang kelas {kelas['nama_matakuliah']} {kelas['grup_kelas']}:\n"
                            f"- {kelas['diadakan_hari']}, {kelas['waktu_mulai']} - {kelas['waktu_selesai']} ({kelas['ruangan_kode']})\n"
                            f"- {kelas['diadakan_hari_2']}, {kelas['waktu_mulai_2']} - {kelas['waktu_selesai_2']} ({kelas['ruangan_kode_2']})\n"
                        )
                    else:
                        response = f"Tidak ada data yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'deskripsi_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    kelas = get_info_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    if kelas:
                        response = (
                            f"Deskripsi {kelas['nama_matakuliah']}:\n"
                            f"- {kelas['deskripsi_matakuliah']}\nPustaka: \n{kelas['pustaka']}\n"
                        )
                    else:
                        response = f"Tidak ada data yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'pengajar_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                info = get_info_matakuliah(user_info['id_peserta'], nama_matakuliah)
                pengajar = get_pengajar_matakuliah(user_info['id_peserta'], nama_matakuliah)
                if info: 
                    response = (
                        f"Pengajar untuk matakuliah {nama_matakuliah}:\n\n"
                        f"Dosen: {info['nama_dosen']}\n"
                    )
                    if pengajar:
                        response += f"Asisten:\n"
                        for asisten in pengajar:
                            response += (
                                f"{asisten['nim_asisten']} | {asisten['nama_asisten']}\n"
                            )
                    else: 
                        response += f"Asisten: -\n"
                else:
                    response = f"Tidak ada data yang ditemukan untuk matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."



    # Pengumuman
    elif intent == 'daftar_pengumuman':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            list_pengumuman = get_daftar_pengumuman(user_info['id_peserta'])
            if list_pengumuman:
                response = f"Pengumuman Anda:\n\n"
                for pengumuman_item in list_pengumuman:
                    response += f"Matakuliah: {pengumuman_item['nama_matakuliah']} {pengumuman_item['grup_kelas']}\nJudul Pengumuman: {pengumuman_item['judul_pengumuman']}\n{pengumuman_item['isi_pengumuman']}\nTanggal Berakhir: {pengumuman_item['tanggal_berakhir'].strftime('%d-%m-%Y')}\n\n"
            else:
                response = "Anda tidak memiliki pengumuman."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'pengumuman_hari_ini':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            pengumuman = get_pengumuman_hari_ini(user_info['id_peserta'])
            if pengumuman:
                response = f"Pengumuman hari ini:\n\n"
                for pengumuman_item in pengumuman:
                    response += f"Matakuliah: {pengumuman_item['nama_matakuliah']} {pengumuman_item['grup_kelas']}\nJudul Pengumuman: {pengumuman_item['judul_pengumuman']}\n{pengumuman_item['isi_pengumuman']}\nTanggal Berakhir: {pengumuman_item['tanggal_berakhir'].strftime('%d-%m-%Y')}\n\n"
            else:
                response = "Anda tidak memiliki pengumuman."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'pengumuman_minggu_ini':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            pengumuman = get_pengumuman_minggu_ini(user_info['id_peserta'])
            if pengumuman:
                response = f"Pengumuman minggu ini:\n\n"
                for pengumuman_item in pengumuman:
                    response += f"Matakuliah: {pengumuman_item['nama_matakuliah']} {pengumuman_item['grup_kelas']}\nJudul Pengumuman: {pengumuman_item['judul_pengumuman']}\n{pengumuman_item['isi_pengumuman']}\nTanggal Berakhir: {pengumuman_item['tanggal_berakhir'].strftime('%d-%m-%Y')}\n\n"
            else:
                response = "Anda tidak memiliki pengumuman."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'pengumuman_bulan_ini':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            pengumuman = get_pengumuman_bulan_ini(user_info['id_peserta'])
            if pengumuman:
                response = f"Pengumuman minggu ini:\n\n"
                for pengumuman_item in pengumuman:
                    response += f"Matakuliah: {pengumuman_item['nama_matakuliah']} {pengumuman_item['grup_kelas']}\nJudul Pengumuman: {pengumuman_item['judul_pengumuman']}\n{pengumuman_item['isi_pengumuman']}\nTanggal Berakhir: {pengumuman_item['tanggal_berakhir'].strftime('%d-%m-%Y')}\n\n"
            else:
                response = "Anda tidak memiliki pengumuman."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'pengumuman_terbaru':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            pengumuman = get_pengumuman_terbaru(user_info['id_peserta'])
            if pengumuman:
                response = (
                    f"Pengumuman terbaru:\n\n"
                    f"Matakuliah: {pengumuman['nama_matakuliah']} {pengumuman['grup_kelas']}\n"
                    f"Judul Pengumuman: {pengumuman['judul_pengumuman']}\n"
                    f"{pengumuman['isi_pengumuman']}\n"
                    f"Tanggal Berakhir: {pengumuman['tanggal_berakhir'].strftime('%d-%m-%Y')}\n\n"
                )
            else:
                response = "Anda tidak memiliki pengumuman terbaru."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'pengumuman_terbaru_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    pengumuman = get_pengumuman_terbaru_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    if pengumuman:
                        response = (
                            f"Pengumuman terbaru matakuliah {pengumuman['nama_matakuliah']} {pengumuman['grup_kelas']}:\n\n"
                            f"Judul Pengumuman: {pengumuman['judul_pengumuman']}\n"
                            f"{pengumuman['isi_pengumuman']}\n"
                            f"Tanggal Berakhir: {pengumuman['tanggal_berakhir'].strftime('%d-%m-%Y')}\n\n"
                        )
                    else:
                        response = f"Tidak ada tugas yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'cek_pengumuman_matakuliah':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    pengumuman = get_pengumuman_by_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    if pengumuman:
                        response = f"Pengumuman untuk matakuliah {nama_matakuliah}:\n"
                        for pengumuman_item in pengumuman:
                            response += f"\nJudul Pengumuman: {pengumuman_item['judul_pengumuman']}\n{pengumuman_item['isi_pengumuman']}\nTanggal Berakhir: {pengumuman_item['tanggal_berakhir'].strftime('%d-%m-%Y')}\n"
                    else:
                        response = f"Tidak ada tugas yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'pengumuman_masa_habis_terdekat':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            pengumuman_terdekat = get_pengumuman_terdekat(user_info['id_peserta'])
            if pengumuman_terdekat:
                response = (
                    f"Pengumuman terdekat Anda:\n\n"
                    f"Matakuliah: {pengumuman_terdekat['nama_matakuliah']} {pengumuman_terdekat['grup_kelas']}\n"
                    f"Judul Pengumuman: {pengumuman_terdekat['judul_pengumuman']}\n"
                    f"{pengumuman_terdekat['isi_pengumuman']}\n"
                    f"Tanggal Berakhir: {pengumuman_terdekat['tanggal_berakhir'].strftime('%d-%m-%Y')}\n\n"
                )
            else:
                response = "Anda tidak memiliki pengumuman."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."



    # Lain-lain
    elif intent == 'sistem_penilaian':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    penilaian = get_sistem_penilaian_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    # print(penilaian)
                    if penilaian:
                        response = f"Sistem penilaian untuk matakuliah {nama_matakuliah}:\n\nBobot  | Nama Penilaian\n-----------|------------------------\n"
                        nilai = 0
                        for item in penilaian:
                            response += f"   {item['bobot_penilaian']}%   |   {item['nama_penilaian']}\n"
                            nilai += item['bobot_penilaian']
                        response += f"----------- +\n{nilai}%"
                    else:
                        response = f"Tidak ada data penilaian yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'cek_nilai_tugas':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities and 'tugas:nama_tugas' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                nama_tugas = entities['tugas:nama_tugas'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    info = get_info_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    tugas = get_nilai_tugas_matakuliah(nama_matakuliah, nama_tugas)
                    if tugas:
                        nilai = 0
                        counter = 0
                        response = f"Nilai kelas dari {nama_tugas} {nama_matakuliah}:\n\n"
                        for item in tugas:
                            if item['grup_kelas'] == info['grup_kelas']:
                                response += f"{item['nim']} | {item['nama']} | {item['nilai_peserta']}\n"
                                nilai += item['nilai_peserta']
                                counter += 1
                        rata_rata = nilai / counter
                        response += f"\nRata-rata kelas: {round(rata_rata, 1)}"
                    else:
                        response = (f"Tidak ada data untuk {nama_tugas} di matakuliah {nama_matakuliah}.")
                else:
                    response = f"Anda tidak terdaftar di matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan informasi nama tugas atau matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    elif intent == 'cek_presensi':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            if 'matakuliah:nama_matakuliah' in entities:
                nama_matakuliah = entities['matakuliah:nama_matakuliah'][0]['value']
                if is_peserta_enrolled(user_info['id_peserta'], nama_matakuliah):
                    data_presensi = get_presensi_by_matakuliah(user_info['id_peserta'], nama_matakuliah)
                    if data_presensi:
                        response = f"Data presensi untuk matakuliah {nama_matakuliah}:\n\nPersentase kehadiran: {data_presensi['rata_rata_kehadiran']}%\nTotal pertemuan: {data_presensi['total_pertemuan']}\nTotal kehadiran: {data_presensi['total_kehadiran']}\nTotal ketidakhadiran: {data_presensi['total_ketidakhadiran']}\n\n*Untuk dapat mengikuti Ujian Akhir Semester, presentase kehadiran anda harus lebih dari 75%.\n"
                    else:
                        response = f"Tidak ada data presensi yang ditemukan untuk matakuliah {nama_matakuliah}."
                else:
                    response = f"Anda tidak terdaftar pada matakuliah {nama_matakuliah}."
            else:
                response = "Saya tidak dapat menemukan nama matakuliah dalam permintaan Anda."
        else:
            response = "Anda belum terverifikasi. Silakan gunakan /start untuk mendaftar."

    


    elif intent == 'sapaan':
        user_info = get_user_info(message.from_user.id)
        if user_info:
            response = "Halo! Ada yang bisa saya bantu?"
        else:
            response = "Halo. Silakan gunakan /start untuk mendaftar."
    
    else:
        response = randomize_default_response()
        response += '\n\nAnda bisa menggunakan command /help untuk petunjuk bertanya.'

    bot.reply_to(message, response)


def keep_alive():
    while True:
        try:
            bot.get_me()
        except Exception as e:
            print(f'Error keeping the bot alive: {e}')
        time.sleep(1800)

# Jalankan fungsi keep_alive dalam thread terpisah
threading.Thread(target=keep_alive).start()

# Polling bot with a higher timeout and retry mechanism
while True:
    try:
        bot.polling(none_stop=True, interval=0, timeout=60)
    except requests.exceptions.ReadTimeout:
        print("ReadTimeout occurred. Retrying in 15 seconds...")
        time.sleep(15)
    except requests.exceptions.ConnectionError:
        print("ConnectionError occurred. Retrying in 15 seconds...")
        time.sleep(15)

# bot.polling()