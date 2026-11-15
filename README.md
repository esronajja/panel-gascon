# panel-gascon
# WHATSAPP BUG PANEL - CYBERPUNK EDITION

![Version](https://img.shields.io/badge/version-2.0.0-green)
![Platform](https://img.shields.io/badge/platform-Termux-blue)
![Author](https://img.shields.io/badge/author-ESRON%20STEPANUS%20PANDJAITAN-purple)

Panel eksploitasi WhatsApp berbasis CLI (Command Line Interface) yang dibangun menggunakan Node.js dan library Baileys. Dilengkapi dengan antarmuka terminal interaktif, animasi *Cyberpunk*, dan berbagai vektor serangan (payload) untuk menguji ketahanan aplikasi klien WhatsApp.

---

## ⚙️ Prasyarat (Requirements)

Sebelum memulai, pastikan perangkat Anda memenuhi syarat berikut:
*   **Android:** Versi 7.0 (Nougat) ke atas.
*   **Termux:** Unduh dan instal dari [F-Droid](https://f-droid.org/en/packages/com.termux/). **Jangan gunakan versi Play Store** karena sudah tidak di-update.
*   **Node.js:** Versi 18.x atau 20.x (LTS).
*   **Koneksi Internet:** Stabil.

---

## 🚀 Instalasi Cepat (One-Click Installer)

Buka Termux, lalu jalankan perintah berikut (Copy-Paste):

```bash
pkg update -y && pkg upgrade -y
pkg install curl -y
curl -sL https://raw.githubusercontent.com/econajja/panel-gascon/main/install.sh | bash
