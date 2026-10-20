CREATE TABLE persimpangan (
    id_persimpangan VARCHAR(10)  PRIMARY KEY,
    nama_lokasi     VARCHAR(100) NOT NULL
);

CREATE TABLE petugas (
    id_petugas   VARCHAR(10)  PRIMARY KEY,
    nama_petugas VARCHAR(100) NOT NULL,
    role         VARCHAR(50)  NOT NULL
);

CREATE TABLE pemantauan (
    id_pemantauan            VARCHAR(10) PRIMARY KEY,
    waktu                    DATETIME    NOT NULL,
    id_persimpangan          VARCHAR(10) NOT NULL,
    arah                     VARCHAR(10) NOT NULL,
    id_petugas               VARCHAR(10) NOT NULL,
    jumlah_kendaraan         INT         NOT NULL,
    panjang_antrean          INT         NOT NULL,   -- dalam meter
    durasi_hijau_saat_pantau INT         NOT NULL,   -- dalam detik
    kondisi_kepadatan        VARCHAR(20) NOT NULL,
    CONSTRAINT fk_pemantauan_persimpangan
        FOREIGN KEY (id_persimpangan) REFERENCES persimpangan(id_persimpangan),
    CONSTRAINT fk_pemantauan_petugas
        FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);
