// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'models.dart';

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
  $UserDataStore$UserProfiles$Doc(super.id, super.collection, {super.data});

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
  $UserDataStore$UserProfiles$AuditTrail$Doc(
    super.id,
    super.collection, {
    super.data,
  });
}
