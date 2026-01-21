import 'package:flutter/material.dart';
import 'package:typesafe_firebase_firestore_example/firestore/models.dart';

class DocChangesWidget extends StatefulWidget {
  const DocChangesWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DocChangesState();
}

class _DocChangesState extends State<DocChangesWidget> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _docIdController = TextEditingController();
  final UserDataStore _store = UserDataStore();

  Stream<UserProfile>? _changeStream;
  String _names = "";

  Future<void> _updateUser(String docId, String name) async {
    UserProfile user = await _store.UserProfiles[docId].data;

    user.name = name;
    _store.UserProfiles[docId].set(user);
  }

  void _listenChanges() {
    String docId = _docIdController.text.trim();
    if (docId.isEmpty) {
      return;
    }

    setState(() {
      _changeStream = _store.UserProfiles[docId].changeEvents;
    });
  }

  Future<void> _changeUserName() async {
    String name = _userNameController.text.trim();
    String docId = _docIdController.text.trim();

    if (name.isEmpty) {
      return;
    }

    if (docId.isEmpty) {
      return;
    }

    _updateUser(docId, name);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _docIdController,
            decoration: const InputDecoration(
              labelText: "Enter Doc Id",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          // Button to trigger fetch
          ElevatedButton(
            onPressed: _listenChanges,
            child: const Text("Listen Changes."),
          ),
          // Input view for User ID
          TextField(
            controller: _userNameController,
            decoration: const InputDecoration(
              labelText: "Enter User Name",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),

          // Button to trigger fetch
          ElevatedButton(
            onPressed: _changeUserName,
            child: const Text("Change User Name"),
          ),
          const SizedBox(height: 30),

          StreamBuilder(
            stream: _changeStream,
            builder: (context, snapshot) {
              if (_changeStream == null) {
                return Text("Tap button to load data");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) return Text("Error: ${snapshot.error}");

              _names += "${snapshot.data!.name}\n";

              return Text(_names);
            },
          ),
        ],
      ),
    );
  }
}
