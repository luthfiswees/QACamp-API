# QACamp-API
Project for QA Camp API lesson

## Group Study
Sangat dianjurkan bagi peserta untuk membentuk kelompok, dimana salah satu peserta dalam kelompok tersebut memiliki laptop dengan Operating System Mac/Ubuntu. Hal ini disebabkan projek dapat dijamin keberhasilannya apabila memakai 2 jenis operating system ini.

Jika dirasa yakin untuk memakai Windows, kami menyarankan untuk memakai Bash shell command line tool. Ikuti tutorial untuk menginstall pada tautan [berikut](https://www.windowscentral.com/how-install-bash-shell-command-line-windows-10) . Setelah berhasil, ikuti langkah instalasi untuk sistem operasi Ubuntu.

## Instalasi

### Mac
Jalankan command sesuai dengan urutan

Install Homebrew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install RVM (Ruby Version Manager)
```
curl -L get.rvm.io | bash -s stable
source ~/.bash_profile
```

Install Ruby 2.5.1
```
rvm install 2.5.1
rvm use 2.5.1
```

Install Git
```
brew install git
```

Jika anda belum memiliki akun Github, daftarkan diri anda [disini](https://github.com/join)

Kemudian, konfigurasikan git anda
```
git config --global user.name "<NAMA_ANDA>"
git config --global user.email "<EMAIL_ANDA>"
```
Ganti <NAMA_ANDA> dengan nama anda dan <EMAIL_ANDA> dengan email yang anda gunakan untuk mendaftar akun Github.

Kemudian download projek menggunakan clone
```
git clone https://github.com/ferieandriansujarwo/QACamp-API.git
cd QACamp-API
```

Sekarang anda sudah siap untuk belajar!

### Ubuntu

Install RVM (Ruby Version Manager)
```
curl -L get.rvm.io | bash -s stable
source ~/.bash_profile
```

Install Ruby 2.5.1
```
rvm install 2.5.1
rvm use 2.5.1
```

Install Git
```
sudo apt-get install git
```

Jika anda belum memiliki akun Github, daftarkan diri anda [disini](https://github.com/join)

Kemudian, konfigurasikan git anda
```
git config --global user.name "<NAMA_ANDA>"
git config --global user.email "<EMAIL_ANDA>"
```
Ganti <NAMA_ANDA> dengan nama anda dan <EMAIL_ANDA> dengan email yang anda gunakan untuk mendaftar akun Github.

Kemudian download projek menggunakan clone
```
git clone https://github.com/luthfiswees/QACamp-API.git
cd QACamp-API
```

Sekarang anda sudah siap untuk belajar!

## Cara menggunakan
Setiap folder berisi lesson yang nanti akan dijelaskan bersamaan dengan materi slide. Setiap lesson adalah sebuah projek Ruby yang dapat diinstall dan digunakan langsung sebagai contoh.

Sebagai contoh, misalkan saya ingin menggunakan Lesson 1. Maka berikut adalah hal yang perlu dilakukan:

Masuk ke direktori lesson1
```
cd lesson1
```

Install bundler
```
gem install bundler
```

Install dependensi projek
```
bundle install
```

Jalankan projek
```
bundle exec cucumber
```
