CREATE DATABASE IF NOT EXISTS db_uts_basis;
USE db_uts_basis;

-- 1. Tabel Persimpangan
CREATE TABLE IF NOT EXISTS Persimpangan (
    id_persimpangan INT PRIMARY KEY,
    nama_lokasi VARCHAR(100) NOT NULL
);

-- 2. Tabel Petugas
CREATE TABLE IF NOT EXISTS Petugas (
    id_petugas INT PRIMARY KEY,
    nama_petugas VARCHAR(100) NOT NULL,
    id_persimpangan INT,
    FOREIGN KEY (id_persimpangan)
        REFERENCES Persimpangan(id_persimpangan)
);

-- 3. Tabel Ruas Jalan
CREATE TABLE IF NOT EXISTS Ruas_Jalan (
    arah VARCHAR(50) PRIMARY KEY,
    id_persimpangan INT NOT NULL,
    panjang_jalan DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_persimpangan)
        REFERENCES Persimpangan(id_persimpangan),
    CHECK (panjang_jalan > 0)
);

-- 4. Tabel Perangkat Deteksi
CREATE TABLE IF NOT EXISTS Perangkat_Deteksi (
    id_perangkat INT PRIMARY KEY,
    arah VARCHAR(50) NOT NULL,
    FOREIGN KEY (arah)
        REFERENCES Ruas_Jalan(arah)
);

-- 5. Tabel Sensor Fisik
CREATE TABLE IF NOT EXISTS Sensor_Fisik (
    id_perangkat INT PRIMARY KEY,
    jenis_sensor VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_perangkat)
        REFERENCES Perangkat_Deteksi(id_perangkat)
);

-- 6. Tabel Kamera CCTV
CREATE TABLE IF NOT EXISTS Kamera_CCTV (
    id_perangkat INT PRIMARY KEY,
    resolusi VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_perangkat)
        REFERENCES Perangkat_Deteksi(id_perangkat)
);

-- 7. Tabel Pemantauan
CREATE TABLE IF NOT EXISTS Pemantauan (
    id_pemantauan INT PRIMARY KEY,
    id_perangkat INT NOT NULL,
    jumlah_kendaraan INT NOT NULL,
    panjang_antrean DECIMAL(10,2) NOT NULL,
    kondisi_kepadatan VARCHAR(20) NOT NULL,
    waktu DATETIME NOT NULL,
    FOREIGN KEY (id_perangkat)
        REFERENCES Perangkat_Deteksi(id_perangkat),
    CHECK (jumlah_kendaraan >= 0),
    CHECK (panjang_antrean >= 0),
    CHECK (kondisi_kepadatan IN
        ('Rendah', 'Sedang', 'Tinggi'))
);

-- 8. Tabel Lampu Lalu Lintas
CREATE TABLE IF NOT EXISTS Lampu_Lalu_Lintas (
    id_lampu INT PRIMARY KEY,
    durasi_merah INT NOT NULL,
    durasi_kuning INT NOT NULL,
    durasi_hijau INT NOT NULL,
    CHECK (durasi_merah > 0),
    CHECK (durasi_kuning > 0),
    CHECK (durasi_hijau > 0)
);

-- 9. Tabel Penyesuaian Durasi
CREATE TABLE IF NOT EXISTS Penyesuaian_Durasi (
    id_penyesuaian INT PRIMARY KEY,
    id_pemantauan INT NOT NULL,
    id_lampu INT NOT NULL,
    waktu_penyesuaian DATETIME NOT NULL,
    alasan VARCHAR(255),
    FOREIGN KEY (id_pemantauan)
        REFERENCES Pemantauan(id_pemantauan),
    FOREIGN KEY (id_lampu)
        REFERENCES Lampu_Lalu_Lintas(id_lampu)
);

-- Menampilkan seluruh tabel
SHOW TABLES;
