import 'package:flutter/material.dart';
import 'package:typesafe_firebase_firestore_example/firestore/models.dart';

Future<String> getAuditTrail(String docId) async {
  final UserDataStore store = UserDataStore();
  final userDoc = store.UserProfiles[docId];
  UserProfile user = await userDoc.data;

  String trail = "";
  await for (var log in userDoc.AuditTrail.getAll()) {
    trail += "${user.name} - ${log.id}: ${(await log.data).modifiedAt}\n";
  }

  return trail;
}

class GetAllWidget extends StatefulWidget {
  const GetAllWidget({super.key});

  @override
  State<StatefulWidget> createState() => _GetAllState();
}

class _GetAllState extends State<GetAllWidget> {
  final TextEditingController _userNameController = TextEditingController();

  String _auditTrail = "No user fetched yet";

  void _getAllTrail() async {
    String input = _userNameController.text.trim();
    String auditTrail;
    if (input.isEmpty) {
      auditTrail = "Please enter a User Id";
    } else {
      auditTrail = await getAuditTrail(input);
    }
    setState(() {
      _auditTrail = auditTrail;
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
          ElevatedButton(
            onPressed: _getAllTrail,
            child: const Text("Get User"),
          ),
          const SizedBox(height: 30),

          // Display view for User Name
          SelectableText(
            _auditTrail,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
