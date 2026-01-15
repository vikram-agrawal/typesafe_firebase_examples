// GENERATED CODE - DO NOT MODIFY
import "package:typesafe_firebase_core/models.dart";
import "package:typesafe_firebase_functions_example/functions/models.dart";

void registerAllModels() {
  registerCommonModels();

  BaseModel.register<UserProfile>(
    toJson: UserProfileToJson,
    fromJson: UserProfileFromJson,
  );
}
