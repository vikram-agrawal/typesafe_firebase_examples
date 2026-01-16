// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'models.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// IMPORT: package:typesafe_firebase_functions_example/functions/models.dart

// ignore: non_constant_identifier_names
void $register_$UserProfile_type() {
  BaseModel.register<UserProfile>(
    toJson: _$UserProfileToJson,
    fromJson: _$UserProfileFromJson,
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map json) => UserProfile()
  ..uid = json['uid'] as String
  ..name = json['name'] as String?;

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{'uid': instance.uid, 'name': instance.name};
