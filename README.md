1.	Navigation
 ![image](https://github.com/user-attachments/assets/2dfdf616-d8c2-468c-b840-bb250b96e939)

Aplikasi ini terdiri dari beberapa layar (halaman) yang saling terhubung menggunakan navigasi di Flutter. Ada 4 layar utama, yaitu:
•	HomeScreen: Halaman utama yang menampilkan 4 tombol:
o	Tombol pertama menuju ke DetailScreen dengan cara biasa (push).
o	Tombol kedua menuju ke DetailScreen dengan named route.
o	Tombol ketiga menuju ke SettingsScreen dan mengirim data (nama pengguna).
o	Tombol keempat menuju ke AboutScreen.
•	DetailScreen: Halaman ini menerima dan menampilkan data dari HomeScreen.
•	SettingsScreen: Halaman ini menerima data (username) yang dikirim melalui named route dan menampilkannya.
•	AboutScreen: Halaman ini hanya menampilkan informasi pembuat aplikasi, seperti nama dan NIM.
Navigasi antar halaman menggunakan dua cara:
•	Dengan Navigator.push untuk mengirim data secara langsung.
•	Dengan Navigator.pushNamed untuk navigasi menggunakan nama rute, dan bisa juga mengirim argumen tambahan.
Semua halaman memiliki tombol untuk kembali ke halaman sebelumnya dengan Navigator.pop.
Contoh potongan kode navigasi:
•	Navigator.pushNamed(context, '/about') → menuju halaman About.
•	Navigator.push(context, MaterialPageRoute(...)) → navigasi biasa ke halaman Detail.
Aplikasi ini cocok sebagai latihan dasar navigasi di Flutter.

2.	Navigation_20
 ![image](https://github.com/user-attachments/assets/c2f194ef-1496-4f36-a6ad-1f60ad8669c9)

Aplikasi ini menggunakan Flutter Navigator 2.0 untuk berpindah antar halaman (screen) secara deklaratif.
Komponen dalam aplikasi:
1.	Class Item
o	Ini adalah model data untuk setiap item.
o	Sekarang memiliki tiga properti: id, name, dan description.
2.	HomeScreen
o	Menampilkan daftar item dalam bentuk list.
o	Setiap item bisa diklik untuk membuka halaman detail.
3.	DetailScreen
o	Menampilkan informasi lengkap dari item yang dipilih, termasuk nama, ID, dan deskripsi.
o	Ada tombol untuk kembali ke halaman utama.
4.	Navigator dan State Management
o	State dikelola di _MyAppState.
o	Saat user memilih item, Navigator akan menampilkan DetailScreen.
o	Jika user kembali, state dikosongkan dan halaman kembali ke HomeScreen.
Navigasi
Aplikasi ini tidak menggunakan pushNamed atau push, tapi menggunakan pendekatan deklaratif:
•	Menentukan halaman mana yang ditampilkan berdasarkan kondisi (apakah ada item yang dipilih atau tidak).
•	Ini adalah ciri khas dari Navigator 2.0 di Flutter.
Fitur baru
Field description ditambahkan agar data item lebih informatif. Data ini juga ditampilkan di halaman detail agar pengguna bisa melihat deskripsi dari item yang dipilih.
Jadi, aplikasi ini cocok untuk memahami cara menampilkan daftar data dan menavigasi ke detailnya dengan Flutter.

3.	Nested Navigation
 ![image](https://github.com/user-attachments/assets/9ff75c82-4d1d-403e-9bca-054ea06ba095)

Berikut penjelasan dalam bentuk paragraf, dan jika menyebut kode, menggunakan tanda strip (`) untuk menandainya.
Aplikasi ini menggunakan konsep nested navigation di Flutter, yaitu navigator bersarang di dalam halaman tertentu. Saat aplikasi dijalankan, pengguna akan melihat HomeScreen. Di halaman ini terdapat tombol bertuliskan "Start Setup Flow". Ketika tombol ini ditekan, Flutter akan menavigasi ke halaman SetupFlowScreen menggunakan Navigator.push.
Di dalam SetupFlowScreen, terdapat navigator tersendiri yang diatur dengan kunci GlobalKey<NavigatorState>. Navigator ini memiliki rute awal find_devices, yang akan menampilkan halaman FindDevicesScreen. Di halaman ini, pengguna bisa menekan tombol "Device Found" yang akan menjalankan fungsi onDeviceFound, yaitu melakukan push ke halaman berikutnya, yaitu confirm_device.
Halaman ConfirmDeviceScreen adalah langkah konfirmasi. Di sini pengguna diminta untuk menekan tombol "Yes, Proceed" jika ingin melanjutkan proses. Ketika ditekan, fungsi onConfirm akan dijalankan dan menavigasi ke connect_device, yaitu halaman ConnectDeviceScreen. Halaman ini adalah langkah terakhir dari setup, di mana pengguna bisa menyelesaikan proses dengan tombol "Complete Setup", yang akan menjalankan Navigator.pop(context) untuk kembali ke halaman awal.
Dengan alur ini, semua proses setup dilakukan di dalam satu alur navigator tersendiri, tanpa mengganggu navigator utama aplikasi. Hal ini memudahkan pengelolaan navigasi yang kompleks di bagian-bagian tertentu aplikasi, seperti onboarding atau wizard.

4.	deep_link_navigation
 ![image](https://github.com/user-attachments/assets/25752264-841a-42f1-bb46-cc5df9f05846)

Aplikasi ini menggunakan Flutter Navigator 2.0 (Router API) untuk mengatur navigasi berbasis URL (deep linking). Pada awalnya, aplikasi hanya mendukung dua rute: rute utama (home) dan rute detail untuk melihat detail item berdasarkan ID. Setelah dimodifikasi, aplikasi sekarang juga mendukung rute tambahan yaitu /settings untuk membuka halaman pengaturan.
Untuk menambahkan rute baru /settings, beberapa komponen penting diperluas:
•	Di kelas RoutePath, ditambahkan konstruktor RoutePath.settings() dan properti isSettings untuk menandai rute pengaturan.
•	Di AppRouteInformationParser, dilakukan parsing terhadap URL /settings menggunakan pengecekan:
o	if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'settings')
•	Di AppRouterDelegate, ditambahkan logika bool _showSettings untuk menentukan apakah halaman pengaturan sedang ditampilkan atau tidak.
•	Metode build() dalam AppRouterDelegate akan menambahkan SettingsScreen ke daftar pages jika _showSettings == true.
•	Untuk menavigasi ke halaman pengaturan dari UI, ditambahkan tombol icon settings di AppBar pada HomeScreen, yang akan memicu fungsi onSettingsPressed, lalu memanggil goToSettings() yang mengatur state RouterDelegate.
Hal ini memungkinkan pengguna berpindah halaman baik melalui klik tombol di aplikasi, maupun langsung melalui URL seperti:
•	/ → menampilkan halaman Home
•	/detail/2 → menampilkan detail untuk item dengan ID 2
•	/settings → membuka halaman Settings
Dengan pendekatan ini, aplikasi mendukung navigasi deklaratif berbasis URL, sangat cocok untuk aplikasi berbasis web atau aplikasi mobile yang butuh integrasi dengan link luar (seperti push notification atau QR code).


