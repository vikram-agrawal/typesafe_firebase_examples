import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:typesafe_firebase_core/typesafe_firebase.dart';
import 'package:typesafe_firebase_functions_example/functions/functions_example.dart';
import 'package:typesafe_firebase_functions_example/register_models.g.dart';

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
  final TextEditingController _userIdController = TextEditingController();

  String _userName = "No user fetched yet";

  void _fetchUserName() async {
    String input = _userIdController.text.trim();
    String userName;
    if (input.isEmpty) {
      userName = "Please enter a User ID";
    } else {
      // Replace this with an actual API call using the 'http' package
      userName = await getUserName(input);
    }
    setState(() {
      _userName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            // Input view for User ID
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: "Enter User ID",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Button to trigger fetch
            ElevatedButton(
              onPressed: _fetchUserName,
              child: const Text("Fetch User Name"),
            ),
            const SizedBox(height: 30),

            // Display view for User Name
            Text(
              _userName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
