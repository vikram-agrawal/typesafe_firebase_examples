// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'models.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// IMPORT: package:typesafe_firebase_firestore_example/firestore/models.dart

// ignore: non_constant_identifier_names
void $register_$UserProfile_type() {
  BaseModel.register<UserProfile>(
    toJson: _$UserProfileToJson,
    fromJson: _$UserProfileFromJson,
  );
}

// IMPORT: package:typesafe_firebase_firestore_example/firestore/models.dart

// ignore: non_constant_identifier_names
void $register_$AuditTrailEntry_type() {
  BaseModel.register<AuditTrailEntry>(
    toJson: _$AuditTrailEntryToJson,
    fromJson: _$AuditTrailEntryFromJson,
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

AuditTrailEntry _$AuditTrailEntryFromJson(Map json) => AuditTrailEntry()
  ..uid = json['uid'] as String
  ..name = json['name'] as String?
  ..modifiedAt = json['modifiedAt'] == null
      ? null
      : DateTime.parse(json['modifiedAt'] as String)
  ..modifiedBy = json['modifiedBy'] as String?;

Map<String, dynamic> _$AuditTrailEntryToJson(AuditTrailEntry instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'modifiedAt': instance.modifiedAt?.toIso8601String(),
      'modifiedBy': instance.modifiedBy,
    };
