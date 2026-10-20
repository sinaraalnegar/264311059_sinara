SELECT 
    p.nama_lokasi,
    COUNT(m.id_pemantauan)  AS jumlah_pemantauan,
    SUM(m.jumlah_kendaraan) AS total_kendaraan,
    AVG(m.panjang_antrean)  AS rata_rata_antrean_m
FROM pemantauan m
JOIN persimpangan p ON m.id_persimpangan = p.id_persimpangan
WHERE m.kondisi_kepadatan = 'Padat'
GROUP BY p.id_persimpangan, p.nama_lokasi;
