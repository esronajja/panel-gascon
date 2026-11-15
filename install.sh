#!/data/data/com.termux/files/usr/bin/bash

echo "[*] Menginstal Bug Panel by ESRON STEPANUS PANDJAITAN..."
pkg update -y && pkg upgrade -y
pkg install nodejs-lts git -y

echo "[*] Mengunduh modul..."
git clone https://github.com/esronajja/panel-gascon.git $HOME/bugpanel
cd $HOME/bugpanel
npm install

# Rename file obfuscated
mv bug-obf.mjs bug.mjs

echo "[*] Membuat perintah GasCon..."
cat << 'INNER' > $PREFIX/bin/GasCon
#!/data/data/com.termux/files/usr/bin/bash
cd $HOME/bugpanel
node bug.mjs
INNER

chmod +x $PREFIX/bin/GasCon
hash -r

echo "[+] INSTALASI SELESAI! Ketik 'GasCon' untuk mulai."
