// GENERATED CODE - DO NOT MODIFY BY HAND

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

// **************************************************************************
// SchemaGenerator
// **************************************************************************

// ignore: camel_case_types
final class UserDataStore extends $FirestoreDb {
  // ignore: non_constant_identifier_names
  late final UserProfiles =
      $Collection<$UserDataStore$UserProfiles$Doc, UserProfile>(
        'UserProfiles',
        $UserDataStore$UserProfiles$Doc.new,
        firestoreDb: this,
      );
}

// ignore: camel_case_types
final class $UserDataStore$UserProfiles$Doc extends $Document<UserProfile> {
  $UserDataStore$UserProfiles$Doc(super.id, super.collection);

  // ignore: non_constant_identifier_names
  late final AuditTrail =
      $Collection<$UserDataStore$UserProfiles$AuditTrail$Doc, AuditTrailEntry>(
        'AuditTrail',
        $UserDataStore$UserProfiles$AuditTrail$Doc.new,
        parentDoc: this,
      );
}

// ignore: camel_case_types
final class $UserDataStore$UserProfiles$AuditTrail$Doc
    extends $Document<AuditTrailEntry> {
  $UserDataStore$UserProfiles$AuditTrail$Doc(super.id, super.collection);
}
