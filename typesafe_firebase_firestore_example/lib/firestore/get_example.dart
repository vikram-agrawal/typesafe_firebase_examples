import 'package:flutter/material.dart';
import 'package:typesafe_firebase_firestore_example/firestore/models.dart';

Future<String> getUser(String docId) async {
  final UserDataStore store = UserDataStore();
  UserProfile user = await store.UserProfiles[docId].data;
  AuditTrailEntry entry = await store.UserProfiles[docId].AuditTrail["1"].data;

  return "${user.name} | ${entry.modifiedAt}";
}

class GetUserWidget extends StatefulWidget {
  const GetUserWidget({super.key});

  @override
  State<StatefulWidget> createState() => _GetUserState();
}

class _GetUserState extends State<GetUserWidget> {
  final TextEditingController _userNameController = TextEditingController();

  String _userName = "No user fetched yet";

  void _addUser() async {
    String input = _userNameController.text.trim();
    String userName;
    if (input.isEmpty) {
      userName = "Please enter a User Name";
    } else {
      // Replace this with an actual API call using the 'http' package
      userName = await getUser(input);
    }
    setState(() {
      _userName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Input view for User ID
          TextField(
            controller: _userNameController,
            decoration: const InputDecoration(
              labelText: "Enter Doc Id",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),

          // Button to trigger fetch
          ElevatedButton(onPressed: _addUser, child: const Text("Get User")),
          const SizedBox(height: 30),

          // Display view for User Name
          Text(
            _userName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
