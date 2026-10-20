INSERT INTO persimpangan (id_persimpangan, nama_lokasi) VALUES
('SMP01', 'Simpang Pahlawan'),
('SMP02', 'Simpang Kartini'),
('SMP03', 'Simpang Merdeka');

INSERT INTO petugas (id_petugas, nama_petugas, role) VALUES
('PTG01', 'Budi Santoso',  'Operator CCTV'),
('PTG02', 'Sari Wulandari', 'Polisi Lalu Lintas'),
('PTG03', 'Andi Pratama',  'Tim Pemeliharaan');

INSERT INTO pemantauan
(id_pemantauan, waktu, id_persimpangan, arah, id_petugas,
 jumlah_kendaraan, panjang_antrean, durasi_hijau_saat_pantau, kondisi_kepadatan) VALUES
('PMT-001', '2026-10-05 07:00:00', 'SMP01', 'Utara',   'PTG01', 85, 120, 30, 'Padat'),
('PMT-002', '2026-10-05 07:00:00', 'SMP01', 'Selatan', 'PTG01', 40,  50, 30, 'Lancar'),
('PMT-003', '2026-10-05 17:00:00', 'SMP02', 'Utara',   'PTG02', 50,  60, 40, 'Sedang');

SELECT * FROM persimpangan;

UPDATE pemantauan
SET kondisi_kepadatan = 'Padat'
WHERE id_pemantauan = 'PMT-003';

DELETE FROM pemantauan
WHERE id_pemantauan = 'PMT-002';
