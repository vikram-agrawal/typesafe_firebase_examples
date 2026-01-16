import 'package:typesafe_firebase_core/models.dart';
import 'package:typesafe_firebase_core/annotations.dart';

part 'models.model.g.dart';

@Model()
class UserProfile extends BaseModel {
  String uid = "";
  String? name;
}
