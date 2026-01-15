import 'package:typesafe_firebase_core/models.dart';
import 'package:typesafe_firebase_functions_example/functions/api_service.dart';
import 'package:typesafe_firebase_functions_example/functions/models.dart';

final apiService = ExampleApiService();
Future<String> getUserName(String userId) async {
  UserProfile profile = await apiService.load(StringData(userId));
  return profile.name ?? "N/A";
}
