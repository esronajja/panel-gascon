# WHATSAPP BUG PANEL - CYBERPUNK EDITION

![Version](https://img.shields.io/badge/version-2.0.0-green)
![Platform](https://img.shields.io/badge/platform-Termux-blue)
![Author](https://img.shields.io/badge/author-ESRON%20STEPANUS%20PANDJAITAN-purple)
![License](https://img.shields.io/badge/license-Educational-red)

Panel eksploitasi WhatsApp berbasis CLI (Command Line Interface) yang dibangun menggunakan Node.js dan library Baileys. Dilengkapi dengan antarmuka terminal interaktif, animasi *Cyberpunk*, dan berbagai vektor serangan (payload) untuk menguji ketahanan aplikasi klien WhatsApp.

---

## ⚙️ Prasyarat (Requirements)

Sebelum memulai, pastikan perangkat Anda memenuhi syarat berikut:
*   **Android:** Versi 7.0 (Nougat) ke atas.
*   **Termux:** Unduh dan instal dari [F-Droid](https://f-droid.org/en/packages/com.termux/). **Jangan gunakan versi Play Store** karena sudah tidak di-update.
*   **Node.js:** Versi 18.x atau 20.x (LTS).
*   **Koneksi Internet:** Stabil.
*   **Penyimpanan:** Minimal 500MB ruang kosong.

---

## 🚀 Instalasi Cepat (One-Click Installer)

Buka Termux, lalu jalankan perintah berikut (Copy-Paste):

```bash
pkg update -y && pkg upgrade -y
pkg install curl -y
curl -sL https://raw.githubusercontent.com/econajja/panel-gascon/main/install.sh | 
```

🛠️ Instalasi Manual (Langkah Demi Langkah)

Jika One-Click Installer gagal atau Anda ingin menginstal secara manual, ikuti panduan berikut:

Langkah 1: Update dan Instalasi Paket Dasar

Buka Termux, jalankan:

```bash
pkg update -y && pkg upgrade -y
pkg install nodejs-lts git nano -y
```

Langkah 2: Clone Repositori

Unduh source code panel dari GitHub ke penyimpanan Termux:

```bash
git clone https://github.com/econajja/panel-gascon.git $HOME/bugpanel
cd $HOME/bugpanel
```


Langkah 3: Instal Dependensi Node.js

Unduh semua modul library yang dibutuhkan (Baileys, Pino, Qrcode-terminal):

```bash
npm install
```

Tunggu hingga proses unduh selesai. Jika ada peringatan (warning), abaikan saja.

Langkah 4: Buat Shortcut Perintah GasCon

Agar Anda tidak perlu mengetik node bug.mjs setiap kali menjalankan panel, buat shortcut global:

```bash
cat << 'EOF' > $PREFIX/bin/GasCon
#!/data/data/com.termux/files/usr/bin/bash
cd $HOME/bugpanel
node bug.mjs
EOF
```

Beri izin eksekusi pada file tersebut:

```bash
chmod +x $PREFIX/bin/GasCon
```

Segarkan cache terminal:

```bash
hash -r
```

---

💻 Cara Penggunaan

Setelah instalasi selesai, buka Termux dan ketik perintah pamungkas:

```bash
GasCon
```

Alur Penggunaan:

1. Tunggu proses animasi Loading System dan Rainbow ASCII selesai.
2. Masukkan Nomor Target (bisa menggunakan format 08xxx atau 628xxx).
3. Pilih Vektor Serangan (1-8) dari menu yang tersedia.
4. Jika ini pertama kalinya Anda menjalankan: Script akan menampilkan QR Code. Buka WhatsApp di HP Anda > Perangkat Tertaut > Tautkan Perangkat > Scan QR.
5. Script akan mengeksekusi payload secara otomatis.
6. Tekan CTRL + C untuk menghentikan serangan Looping FC.

---

⚔️ Daftar Fitur (Attack Vectors)

No Fitur Deskripsi Efek pada Target
1 Force Close Spam teks Unicode (Zero-Width) dan Emoji ekstrem. Memicu Out of Memory (OOM), membuat WA target Force Close (FC).
2 Delay / Freeze Spam teks raksasa (50.000 karakter). Membuat rendering engine target macet (Lag/Freeze) saat membuka chat.
3 Sedot Kuota Kirim 30 file PDF sampah berukuran 15MB. Memaksa target mengunduh 450MB, menghabiskan kuota dan memori penyimpanan.
4 Lockchat Spam pesan dengan mention dan status Forwarded (999). Membanjiri notifikasi secara terus-menerus. HP tidak bisa dibuka.
5 Looping FC Serangan Force Close berulang (Batch 50). Target crash terus-menerus tanpa henti. Tekan CTRL+C untuk berhenti.
6 Call Spam Mengirim panggilan masuk (Voice/Video Call) secara terus-menerus. Baterai terkuras, notifikasi layar panggilan tidak berhenti muncul.
7 Revoke Spam Kirim pesan, lalu hapus (Delete for Everyone) secara instan. Notifikasi "Pesan ini telah dihapus" membanjiri chat, memicu glitch database WA.
8 Bug Poll Mengirim pesan Polling (Voting) dengan 100 opsi panjang. UI Target macet saat merender kotak polling yang masif.

---

🔄 Cara Update Script (Jika Ada Versi Baru)

Jika pembuat script merilis pembaruan, Anda tidak perlu menginstal ulang dari awal. Cukup lakukan pull request:

```bash
cd $HOME/bugpanel
git pull origin main
npm install
```

---

🧹 Cara Reset Sesi WhatsApp (Ganti Akun Bot)

Jika akun bot Anda terblokir (Banned) atau Anda ingin menggantinya dengan nomor lain, hapus folder autentikasi agar script meminta Scan QR baru:

```bash
rm -rf $HOME/bugpanel/auth_bug
GasCon
```

---

❓ FAQ (Frequently Asked Questions)

1. Kenapa setelah memilih menu, saya disuruh Scan QR terus?
Itu berarti belum ada sesi WhatsApp yang tersimpan. Scan QR sekali saja, sesi akan tersimpan di folder auth_bug. Ke depannya Anda tidak perlu scan lagi.

2. Kenapa koneksi terputus dan muncul tulisan merah [!] Connection Error?
Akun pengirim Anda (nomor bot) terkena Rate Limit atau Spam Filter dari WhatsApp karena mengirim terlalu banyak pesan dalam waktu singkat. Tunggu 1-2 jam, atau gunakan nomor WA yang baru.

3. Fitur Call Spam kok tidak berdering di HP target?
WhatsApp target mungkin menolak panggilan karena privasi (Hanya kontak yang bisa menelepon). Ini adalah pengaturan dari HP target, bukan error dari script.

4. Kenapa saya tidak bisa membuat Shortcut GasCon?
Pastikan Anda sudah menjalankan hash -r setelah membuat file shortcut. Jika masih gagal, pastikan Anda memiliki izin menulis di folder $PREFIX/bin. Coba jalankan Termux sebagai root atau ketik termux-setup-storage terlebih dahulu.

5. Apakah script ini bisa meledakkan HP target?
Tidak. Fitur-fitur ini hanya membebani memori (RAM) dan antarmuka (UI) klien WhatsApp. Sistem operasi Android memiliki perlindungan (Force Close) yang akan menutup aplikasi sebelum perangkat mengalami kerusakan fisik.

---

⚠️ Disclaimer & Peringatan

Proyek ini dibuat murni untuk tujuan Edukasi, Pengujian Keamanan (Penetration Testing), dan Riset Kerentanan Aplikasi.

· Penggunaan script ini untuk menyerang target tanpa izin adalah Tindakan Melanggar Hukum (UU ITE).
· Penulis (ESRON STEPANUS PANDJAITAN) tidak bertanggung jawab atas segala kerusakan, pemblokiran akun, atau konsekuensi hukum yang timbul akibat penyalahgunaan alat ini.
· Gunakan dengan bijak dan bertanggung jawab.

---

Dikembangkan dengan ❤️ oleh ESRON STEPANUS PANDJAITAN

```

---
