import 'package:typesafe_firebase_core/models.dart';
import 'package:typesafe_firebase_functions_example/functions/models.dart';
import 'package:typesafe_firebase_functions/typesafe_firebase_functions.dart';

class ExampleApiService extends FirebaseFunctionsService {
  ExampleApiService() : super(prefix: "userClient/user", region: "asia-south1");

  late final load = createFunction<StringData, UserProfile>("/load");
}

class StreamApiService extends FirebaseFunctionsService {
  late final stream = createStream<VoidData, StringData, IntData>(
    "streamClient",
  );
}
