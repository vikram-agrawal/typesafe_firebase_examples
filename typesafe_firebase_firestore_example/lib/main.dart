import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:typesafe_firebase_core/typesafe_firebase.dart';
import 'package:typesafe_firebase_firestore_example/firestore/add_example.dart';
import 'package:typesafe_firebase_firestore_example/firestore/doc_changes_example.dart';
import 'package:typesafe_firebase_firestore_example/firestore/get_example.dart';
import 'package:typesafe_firebase_firestore_example/firestore/getall_example.dart';
import 'package:typesafe_firebase_firestore_example/register_models.g.dart';

void main() {
  const FirebaseOptions options = FirebaseOptions(
    apiKey: 'APIKEY',
    appId: '1:2:web:3',
    messagingSenderId: '45432432',
    projectId: 'demo-no-project',
    storageBucket: 'demo-no-project.firebasestorage.app',
  );
  Firebase.initializeApp(options: options);
  FirebaseProvider.setConfig(emulatorIp: "127.0.0.1");
  registerAllModels();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typesafe Firebase Functions Test',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'TypeSafe Firebase Functions Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List of widgets to display for each tab
  final List<Widget> _pages = [
    Center(child: AddUserWidget()),
    Center(child: GetUserWidget()),
    Center(child: GetAllWidget()),
    Center(child: DocChangesWidget()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Add User',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Get User',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Get All',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Doc Changes',
          ),
        ],
      ),
    );
  }
}
