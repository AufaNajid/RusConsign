import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'Indonesia': {
          'bahasa': 'Bahasa',
          'indonesia': 'Indonesia',
          'inggris': 'Inggris',
          'pengaturan': 'Pengaturan',
          'profil': 'Profil',
          'simpan': 'Simpan',
          'fotoProfil': 'Foto Profil',
          'lihatFoto': 'Lihat Foto',
          'gantiFoto': 'Ganti Foto',
          'nama': 'Nama',
          'deskripsi': 'Deskripsi',
          'gantiPW': 'Ganti Password',
          'notifikasi': 'Notifikasi',
          'tampilkanNotifikasi': 'Tampilkan Notifikasi',
          'preferensi': 'Preferensi',
          'modeGelap': 'Mode Gelap',
          'linkAkun': 'Link Akun',
          'keluar': 'Keluar',
          'pengikut': 'Pengikut',
          'jumlahJasa': 'Jumlah Jasa',
          'jumlahProduk': 'Jumlah Produk',
          'penilaian': 'Penilaian',
          'pribadi': 'Pribadi',
          'penjualan': 'Penjualan',
          'pembelianPJ': 'Pembelian Produk/Jasa',
          'keranjang': 'Keranjang',
          'harga': 'Harga',
          'jumlah': 'Jumlah',
          'semua': 'Semua',
          'lokasiPertemuan': 'Lokasi Pertemuan',
          'pembelian': 'Pembelian',
          'pembayaran': 'Pembayaran',
          'rincianPembayaran': 'Rincian Pembayaran',
          'subtotalProduk': 'Subtotal Produk',
          'biayaAdmin': 'Biaya Administrasi',
          'buatPesanan': 'Buat Pesanan',
          'halo': 'Halo, ',
          'cari': 'Cari jasa atau produk...',
          'halamanP&J': 'Halaman Produk dan Jasa',
          'jasa': 'Jasa',
          'produk': 'Produk',
          'detailProduk': 'Detail Produk',
          'chatPenjual': 'Chat Penjual',
          'lihatToko': 'Lihat Toko',
          'penilaianProduk': 'Penilaian Produk',
          'ulasan': 'Ulasan',
          'terjual': 'Terjual',
          'beliSekarang': 'Beli Sekarang',
          'favorit': 'Favorit',
          'profilPengguna': 'Profil Pengguna',
          'ikuti': 'Ikuti',
          'mengikuti': 'Mengikuti',
          'chat': 'Chat',
          'pemesananPJ': 'Pemesanan Produk/Jasa',
          'buatBaru': 'Buat Baru',
          'belumBayar': 'Belum Bayar',
          'proses': 'Proses',
          'selesai': 'Selesai',
          'pesananSaya': 'Pesanan Saya',
          'penjualanSaya': 'Penjualan Saya',
          'total': 'Total',
          'checkout': 'Checkout',
          'subtotal': 'Subtotal',
          'kelolaPJ': 'Kelola Produk/Jasa',
          'belumAdaPesanan': 'Belum ada Pesanan',
          'masukkanUsername': 'Masukkan Username...',
          'masukkanEmail': 'Masukkan Email...',
          'masukkanPassword': 'Masukkan Password...',
          'registerDengan': 'Register dengan',
          'loginDengan': 'Login dengan',
          'sudahPunyaAkun': 'Sudah punya akun?',
          'descLogin':
              'Dengan masuk kembali ke RUS Consign, kamu menyetujui Ketentuan dan Kebijakan Privasi kami.',
          'descRegister':
              'Dengan register ke RUS Consign, kamu menyetujui Ketentuan dan Kebijakan Privasi kami.',
          'belumPunyaAkun': 'Belum punya akun?',
          'lupaPassword': 'Lupa Password?',
          'masukkanPasswordBaru': 'Masukkan Password Baru...',
          'konfirmasiPasswordBaru': 'Konfirmasi Password Baru...',
          'pilihFoto': 'Pilih Foto',
          'jenis': 'Jenis',
          'foto': 'Foto',
          'hargaRP': 'Harga (RP)',
          'buat': 'Buat',
          'hapus': 'Hapus',
          'edit': 'Edit',
          'editLokasi': 'Edit Lokasi Pertemuan',
          'lokasiBawaan': 'Lokasi Pertemuan Bawaan',
          'rekomendasiLokasi': 'Rekomendasi Lokasi Pertemuan',
          'editData': 'Edit Data',
          'ubahData': 'Ubah Data',
          'inputNamaPJ': 'Masukkan nama produk/jasa...',
          'inputDeskripsi': 'Masukkan deskripsi...',
          'inputHarga': 'Masukkan nominal harga...',
          'pembayaranSelesai': 'Pembayaran Selesai',
          'infoPembayaranSelesai':
              'Terima kasih sudah membeli produk. Produk anda akan di proses oleh penjual produk. Untuk informasi lebih lanjut, anda bisa menghubungi penjual dari produk tersebut.',
          'kembali': 'Kembali',
          'lihatNotifikasi': 'Lihat Notifikasi',
          'registerPenjualSekarang': 'Registrasi Penjualan Sekarang',
          'descResgisterPenjual':
              'Anda Perlu Registerasi untuk melakukan penjualan di Aplikasi ini',
          'registerPenjual': 'Register Penjual',
          'namaLengkap': 'Nama Lengkap',
          'masukkanNamaLengkap': 'Masukkan nama lengkapmu...',
          'nis': 'NIS',
          'masukkanNIS': 'Masukkan NIS mu...',
          'nomorDompetDigital':
              'Nomor Dompet Digital Aktif (Dana, Gopay atau OVO)',
          'masukkanNomorDompetDigital': 'Masukkan nomor dompet digitalmu...',
          'fotoIDCard': 'Foto ID Card SMK RUS',
          'registrasiSelesai': 'Registrasi Selesai',
          'descRegistrasiSelesai':
              'Anda sekarang dapat menjual produk atau jasa anda di Aplikasi ini. Selamat berjualan...',
          'belumAdaNotifikasi': 'Belum Ada Notifikasi',
          'masukkanTeks': 'Masukkan teks...',
          'pembayaranQRIS': 'QRIS Payment',
          'menungguPembayaran': 'Menunggu Pembayaran',
          'descMenungguPembayaran':
              'Selesaikan pembayaran sebelum waktu habis agar pesanan kamu tidak kedaluwarsa',
          'jam': 'Jam',
          'menit': 'Menit',
          'detik': 'Detik',
          'unduhKode': 'Unduk Kode QR',
          'shopeeOvoDana':
              'ShopeePay, OVO, DANA, Gopay, LinkAja, dan Transfer bank via QRIS',
          'produkDiskon': 'Produk Diskon',
          'profilDisimpan': 'Profil telah disimpan',
          'dataUbah': 'Data berhasil diubah',
          'notifikasiHapus': 'Notifikasi berhasil dihapus',
          'produkDibuat': 'Produk telah dibuat',
          'produkHapusKeranjang': 'Produk telah dihapus dari keranjang',
          'produkTambahKeranjang': 'Produk ditambah ke keranjang',
          'produkSudahKeranjang': 'Produk sudah masuk keranjang',
          'dataProdukUbah': 'Data produk berhasil diubah',
          'QRCodeDownload': 'QR Code berhasil di download',
          'batal': 'Batal',
          'konfirmasiHapus': 'Konfirmasi Penghapusan',
          'konfirmasiBatal': 'Konfirmasi Pembatalan',
          'yaHapus': 'Ya, hapus',
          'yaBatal': 'Ya, Batalkan',
          'ubah': 'Ubah',
          'hapusItemFavorite':
              'Apakah Anda yakin ingin menghapus item ini dari favorite Anda?',
          'hapusItemToko':
              'Apakah Anda yakin ingin menghapus item ini dari toko Anda?',
          'menungguPersetujuan': 'Menunggu Persetujuan',
          'descPersetujuan':
              'Anda perlu menunggu untuk persetujuan admin untuk mengantisipasi masalah antara Penjual dengan Pembeli',
          'konfirmasiPembayaran': 'Konfirmasi Pembayaran',
          'batalkanPesanan': 'Batalkan Pesanan',
          'pesananDibatalkan': 'Pesanan Dibatalkan',
          'tanpaBiaya': '(Tanpa Biaya)',
          'metodePembayaran': 'Metode Pembayaran',
          'beriPenilaian': 'Beri Penilaian',
          'pemberitahuan':
              '*Kamu perlu me-restart aplikasi untuk mengubah preferensi',
          'namaToko': 'Nama Toko',
          'namaTokoHint': 'Masukkan nama toko anda...',
          'belumAdaData': 'Belum Ada Data',
          'isi': 'Isi Semua Data',
          'isiDeskripsi': 'Silahkan isi semua data yang diperlukan',
          'gagal': 'Gagal Login',
          'gagalDesc': 'Username atau kata sandi anda salah',
          'gagalRegis': "Gagal Registrasi",
          'berhasil': 'Berhasil',
          'belumAdaBarang': 'Belum Ada Barang',
          'gagalUbah': 'Gagal Ubah',
          'gagalUbahDesc': 'Anda perlu mengubah setidaknya 1 data',
          'hapusFavoritePesan': 'Barang telah dihapus dari favorit',
          'batasStok': 'Sudah mencapai batas stok',
          'stok' : 'Stok',
          'stokHint' : 'Masukkan jumlah stok barang/jasa...',
          'tungguAdmin' : 'Menunggu persetujuan dari admin, ini mungkin akan butuh waktu untuk menyamakan data inputan anda dengan data yang ada di SMK RUS',
          'nomorWa' : 'Nomor WhatsApp',
          'nomorWaHint' : 'Masukkan nomor WhatsApp anda...',
          'registerSekarang' : 'Register Sekarang',
          'fotoSelfie' : 'Foto Selfie bersama Foto ID Card SMK RUS',
          'belumAdaKomentar' : 'Belum Ada Komentar',
        },
        'English': {
          'bahasa': 'Language',
          'indonesia': 'Indonesian',
          'inggris': 'English',
          'pengaturan': 'Settings',
          'profil': 'Profile',
          'simpan': 'Save',
          'fotoProfil': 'Profile Photo',
          'lihatFoto': 'View Photo',
          'gantiFoto': 'Change Photo',
          'nama': 'Name',
          'deskripsi': 'Description',
          'gantiPW': 'Change Password',
          'notifikasi': 'Notification',
          'tampilkanNotifikasi': 'Show Notification',
          'preferensi': 'Preference',
          'modeGelap': 'Dark Mode',
          'linkAkun': 'Account Link',
          'keluar': 'Logout',
          'pengikut': 'Followers',
          'jumlahJasa': 'Service Amount',
          'jumlahProduk': 'Total Product',
          'penilaian': 'Rating',
          'pribadi': 'Personal',
          'penjualan': 'Sales',
          'pembelianPJ': 'Product/Service Purchase',
          'keranjang': 'Cart',
          'harga': 'Price',
          'jumlah': 'Quantity',
          'semua': 'All',
          'lokasiPertemuan': 'Meeting Location',
          'pembelian': 'Purchase',
          'pembayaran': 'Payment',
          'rincianPembayaran': 'Payment Details',
          'subtotalProduk': 'Product Subtotal',
          'biayaAdmin': 'Administration Fee',
          'buatPesanan': 'Create Order',
          'halo': 'Hello, ',
          'cari': 'Search for services or products...',
          'halamanP&J': 'Products and Services Page',
          'jasa': 'Service',
          'produk': 'Product',
          'detailProduk': 'Product Details',
          'chatPenjual': 'Chat Seller',
          'lihatToko': 'View Store',
          'penilaianProduk': 'Product Rating',
          'ulasan': 'Reviews',
          'terjual': 'Sold',
          'beliSekarang': 'Buy Now',
          'favorit': 'Favorite',
          'profilPengguna': 'User Profile',
          'ikuti': 'Follow',
          'mengikuti': 'Following',
          'chat': 'Chat',
          'pemesananPJ': 'Product/Service Order',
          'buatBaru': 'Create New',
          'belumBayar': 'Not Yet Paid',
          'proses': 'Proccess',
          'selesai': 'Done',
          'pesananSaya': 'My Order',
          'penjualanSaya': 'My Sales',
          'total': 'Total',
          'checkout': 'Checkout',
          'subtotal': 'Subtotal',
          'kelolaPJ': 'Manage Products/Services',
          'belumAdaPesanan': 'No Orders Yet',
          'masukkanUsername': 'Enter Username...',
          'masukkanEmail': 'Enter Email...',
          'masukkanPassword': 'Enter Password...',
          'registerDengan': 'Register with',
          'loginDengan': 'Login with',
          'sudahPunyaAkun': 'Already have an account?',
          'descLogin':
              'By logging back into RUS Consign, you agree to to our Terms and Privacy Policy.',
          'descRegister':
              'By registering to RUS Consign, you agree to our to our Terms and Privacy Policy.',
          'belumPunyaAkun': 'Dont have an account?',
          'lupaPassword': 'Forgot Password?',
          'masukkanPasswordBaru': 'Enter New Password...',
          'konfirmasiPasswordBaru': 'Confirm New Password...',
          'pilihFoto': 'Select Photo',
          'jenis': 'Type',
          'foto': 'Photo',
          'hargaRP': 'Price (RP)',
          'buat': 'Create',
          'hapus': 'Delete',
          'edit': 'Edit',
          'editLokasi': 'Edit Meeting Location',
          'lokasiBawaan': 'Default Meeting Location',
          'rekomendasiLokasi': 'Meeting Location Recommendation',
          'editData': 'Edit Data',
          'ubahData': 'Change Data',
          'inputNamaPJ': 'Enter the product/service name...',
          'inputDeskripsi': 'Enter a description...',
          'inputHarga': 'Enter the nominal price...',
          'pembayaranSelesai': 'Payment Completed',
          'infoPembayaranSelesai':
              'Thank you for purchasing the product.  Your product will be processed by the seller. For further information, you can contact the seller of the product.',
          'kembali': 'Back',
          'lihatNotifikasi': 'View Notifications',
          'registerPenjualSekarang': 'Register for Sales Now',
          'descResgisterPenjual':
              'You Need to Register to make sales on this Application',
          'registerPenjual': 'Seller Register',
          'namaLengkap': 'Full Name',
          'masukkanNamaLengkap': 'Enter your full name...',
          'nis': 'Student Identification Number',
          'masukkanNIS': 'Enter your Student Identification Number...',
          'nomorDompetDigital':
              'Active Digital Wallet Number (Dana, Gopay or OVO)',
          'masukkanNomorDompetDigital': 'Enter your digital wallet number...',
          'fotoIDCard': 'Photo of RUS Vocational ID Card',
          'registrasiSelesai': 'Registration Completed',
          'descRegistrasiSelesai':
              'You can now sell your products or services on this App. Happy selling...',
          'belumAdaNotifikasi': 'No Notification',
          'masukkanTeks': 'Enter text...',
          'pembayaranQRIS': 'QRIS Payment',
          'menungguPembayaran': 'Waiting for Payment',
          'descMenungguPembayaran':
              'Complete the payment before the time expires so that your order does not expire',
          'jam': 'Hour',
          'menit': 'Minute',
          'detik': 'Second',
          'unduhKode': 'Download QR Code',
          'shopeeOvoDana':
              'ShopeePay, OVO, DANA, Gopay, LinkAja, and Bank transfer via QRIS',
          'produkDiskon': 'Discount Product',
          'profilDisimpan': 'Profile has been saved',
          'dataUbah': 'Data successfully changed',
          'notifikasiHapus': 'Notification successfully deleted',
          'produkDibuat': 'Product have been made',
          'produkHapusKeranjang': 'Product has been removed from cart',
          'produkTambahKeranjang': 'Product added to cart',
          'produkSudahKeranjang': 'Product already in cart',
          'dataProdukUbah': 'Product data is successfully changed',
          'QRCodeDownload': 'QR Code successfully downloaded',
          'batal': 'Cancel',
          'konfirmasiHapus': 'Confirm Deletion',
          'konfirmasiBatal': 'Confirm Cancellation',
          'yaHapus': 'Yes, delete',
          'yaBatal': 'Yes, Cancel',
          'ubah': 'Change',
          'hapusItemFavorite':
              'Are you sure you want to remove this item from your favorites?',
          'hapusItemToko':
              'Are you sure you want to remove this item from your store?',
          'menungguPersetujuan': 'Awaiting Approval',
          'descPersetujuan':
              'You need to wait for admin approval to anticipate problems between Seller and Buyer',
          'konfirmasiPembayaran': 'Confirm Payment',
          'batalkanPesanan': 'Cancel Order',
          'pesananDibatalkan': 'Canceled Order',
          'tanpaBiaya': '(No Fees)',
          'metodePembayaran': 'Payment Method',
          'beriPenilaian': 'Give Rating',
          'pemberitahuan': '*You need to restart the app to change preferences',
          'namaToko': 'Store Name',
          'namaTokoHint': 'Enter your store name...',
          'belumAdaData': 'There is no data yet',
          'isi': 'Fill All Data',
          'isiDeskripsi': 'Please fill in all the required data',
          'gagal': 'Login Failed',
          'gagalDesc': 'Your username or password is incorrect',
          'gagalRegis': "Registration Failed",
          'berhasil': 'Success',
          'belumAdaBarang': 'No Product Yet',
          'gagalUbah': 'Failed to Change',
          'gagalUbahDesc': 'You need to change at least 1 data',
          'hapusFavoritePesan': 'Item has been removed from favorites',
          'batasStok': 'Has reached stock limit',
          'stok' : 'Stock',
          'stokHint' : 'Enter the stock quantity of product/service...',
          'tungguAdmin' : 'Awaiting approval from the admin, this may take some time to match your input data with the data in SMK RUS',
          'nomorWa' : 'WhatsApp Number',
          'nomorWaHint' : 'Enter your WhatsApp number...',
          'registerSekarang' : 'Register Now',
          'fotoSelfie' : 'Selfie photo with SMK RUS ID card photo',
          'belumAdaKomentar' : 'No Comments yet',
        }
      };
}
