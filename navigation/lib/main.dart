import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Navigasi Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Definisi named routes
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(data: 'Hello from Home!'),
        '/settings': (context) => const SettingsScreen(username: 'Guest'),
        '/about': (context) => const AboutScreen(), // 👉 Named route baru
      },
    );
  }
}

// Layar Utama (HomeScreen)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol untuk navigasi dasar
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(data: 'Data from Home (Push)'),
                  ),
                );
              },
              child: const Text('Go to Detail (Push)'),
            ),
            const SizedBox(height: 20),
            // Tombol untuk named route ke DetailScreen
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: const Text('Go to Detail (Named Route)'),
            ),
            const SizedBox(height: 20),
            // Tombol untuk named route ke SettingsScreen
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings', arguments: 'John Doe');
              },
              child: const Text('Go to Settings'),
            ),
            const SizedBox(height: 20),
            // 👉 Tombol untuk navigasi ke AboutScreen
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text('Go to About'),
            ),
          ],
        ),
      ),
    );
  }
}

// Layar Detail (DetailScreen)
class DetailScreen extends StatelessWidget {
  final String data;

  const DetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received Data: $data'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Layar Pengaturan (SettingsScreen)
class SettingsScreen extends StatelessWidget {
  final String username;

  const SettingsScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String? ?? username;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $args'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Layar Tentang (AboutScreen)
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Husein Zidan\n4522210012\nMade with ❤️ in Flutter.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
