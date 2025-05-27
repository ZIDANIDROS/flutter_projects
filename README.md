# 📱 Flutter Navigation Examples

Dokumentasi ini menjelaskan berbagai jenis navigasi yang digunakan dalam Flutter, mulai dari navigasi dasar hingga nested dan deep linking menggunakan Navigator 2.0.

---

## 1. Navigation (Dasar)

![Navigation](https://github.com/user-attachments/assets/2dfdf616-d8c2-468c-b840-bb250b96e939)

Aplikasi ini terdiri dari beberapa layar (halaman) yang saling terhubung menggunakan navigasi di Flutter. Ada 4 layar utama, yaitu:

- **HomeScreen**: Halaman utama yang menampilkan 4 tombol:
  - Tombol pertama menuju ke `DetailScreen` dengan cara biasa (`push`).
  - Tombol kedua menuju ke `DetailScreen` dengan named route.
  - Tombol ketiga menuju ke `SettingsScreen` dan mengirim data (nama pengguna).
  - Tombol keempat menuju ke `AboutScreen`.

- **DetailScreen**: Halaman ini menerima dan menampilkan data dari `HomeScreen`.

- **SettingsScreen**: Halaman ini menerima data (`username`) yang dikirim melalui named route dan menampilkannya.

- **AboutScreen**: Halaman ini hanya menampilkan informasi pembuat aplikasi, seperti nama dan NIM.

### Navigasi antar halaman menggunakan dua cara:

- Dengan `Navigator.push` untuk mengirim data secara langsung.
- Dengan `Navigator.pushNamed` untuk navigasi menggunakan nama rute, dan bisa juga mengirim argumen tambahan.

Semua halaman memiliki tombol untuk kembali ke halaman sebelumnya dengan `Navigator.pop`.

### Contoh kode navigasi:

- `Navigator.pushNamed(context, '/about')` → menuju halaman About.
- `Navigator.push(context, MaterialPageRoute(...))` → navigasi biasa ke halaman Detail.

Aplikasi ini cocok sebagai latihan dasar navigasi di Flutter.

---

## 2. Navigation 2.0

![Navigation 2.0](https://github.com/user-attachments/assets/c2f194ef-1496-4f36-a6ad-1f60ad8669c9)

Aplikasi ini menggunakan **Flutter Navigator 2.0** untuk berpindah antar halaman secara deklaratif.

### Komponen utama:

1. **Class `Item`**  
   - Model data yang memiliki properti `id`, `name`, dan `description`.

2. **HomeScreen**  
   - Menampilkan daftar item dalam bentuk list.  
   - Setiap item dapat diklik untuk membuka halaman detail.

3. **DetailScreen**  
   - Menampilkan informasi lengkap dari item yang dipilih.  
   - Tersedia tombol kembali ke `HomeScreen`.

4. **Navigator dan State Management**  
   - State dikelola di `_MyAppState`.  
   - Jika item dipilih, `DetailScreen` akan ditampilkan.  
   - Saat kembali, state di-reset dan kembali ke `HomeScreen`.

### Ciri khas:
Navigasi ditentukan secara deklaratif, artinya halaman ditampilkan berdasarkan kondisi state (apakah item dipilih atau tidak). Tidak menggunakan `push` atau `pushNamed`.

### Fitur tambahan:
Field `description` ditambahkan pada `Item`, dan ditampilkan di halaman detail.

Aplikasi ini cocok untuk memahami navigasi berbasis kondisi menggunakan Flutter Navigator 2.0.

---

## 3. Nested Navigation

![Nested Navigation](https://github.com/user-attachments/assets/9ff75c82-4d1d-403e-9bca-054ea06ba095)

Aplikasi ini menggunakan konsep **nested navigation**, yaitu `Navigator` bersarang di dalam halaman tertentu.

### Alur:

- Pengguna pertama kali melihat `HomeScreen`.
- Tombol "Start Setup Flow" akan menavigasi ke `SetupFlowScreen` menggunakan `Navigator.push`.

### Di dalam `SetupFlowScreen` terdapat navigator tersendiri:

- Halaman pertama: `FindDevicesScreen`
  - Menampilkan teks dan tombol "Device Found"
  - Ketika ditekan, menjalankan fungsi `onDeviceFound`, lalu navigasi ke `ConfirmDeviceScreen`.

- Halaman kedua: `ConfirmDeviceScreen`
  - Konfirmasi perangkat, tombol "Yes, Proceed"
  - Fungsi `onConfirm` akan menavigasi ke `ConnectDeviceScreen`.

- Halaman ketiga: `ConnectDeviceScreen`
  - Menyelesaikan proses dengan tombol "Complete Setup"
  - Kembali ke awal dengan `Navigator.pop(context)`

### Kelebihan:
Semua proses setup dilakukan di dalam navigator tersendiri, sehingga alur tidak mengganggu navigator utama. Cocok untuk membuat onboarding, setup wizard, atau alur kompleks lainnya.

---

## 4. Deep Link Navigation

![Deep Link Navigation](https://github.com/user-attachments/assets/25752264-841a-42f1-bb46-cc5df9f05846)

Aplikasi ini menggunakan **Flutter Navigator 2.0 (Router API)** untuk mendukung navigasi berbasis URL (deep linking).

### Rute yang didukung:

- `/` → Menampilkan halaman Home
- `/detail/:id` → Menampilkan halaman detail berdasarkan ID
- `/settings` → Menampilkan halaman pengaturan

### Komponen yang diperluas:

- Di class `RoutePath`, ditambahkan:
  - `RoutePath.settings()` konstruktor
  - Properti `isSettings`

- Di `AppRouteInformationParser`, parsing URL:
  - `if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'settings')`

- Di `AppRouterDelegate`:
  - Tambahan variabel `_showSettings`
  - Halaman `SettingsScreen` ditambahkan ke daftar `pages` jika `_showSettings == true`

- Di `HomeScreen`, ditambahkan tombol settings:
  - Memicu `onSettingsPressed` → menjalankan `goToSettings()`

### Hasil:
Pengguna dapat berpindah ke halaman pengaturan baik dengan klik tombol di aplikasi maupun dengan URL secara langsung.

### Contoh URL:

- `/` → HomeScreen
- `/detail/2` → DetailScreen untuk item ID 2
- `/settings` → SettingsScreen

Aplikasi ini cocok untuk web maupun mobile yang membutuhkan integrasi navigasi berbasis URL seperti QR code, push notification, atau bookmark browser.
