import 'package:typesafe_firebase_core/models.dart';
import 'package:typesafe_firebase_core/annotations.dart';
import 'package:typesafe_firebase_firestore/typesafe_firebase_firestore.dart';

part 'models.model.g.dart';
part 'models.schema.g.dart';

@Model()
class UserProfile extends BaseModel {
  String uid = "";
  String? name;
}

@Model()
class AuditTrailEntry extends UserProfile {
  DateTime? modifiedAt;
  String? modifiedBy;
}

@FirestoreService("UserDataStore")
const userDataSchema = {
  'UserProfiles': (
    type: UserProfile,
    subCollections: {'AuditTrail': (type: AuditTrailEntry)},
  ),
};
