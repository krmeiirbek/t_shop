import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String cityOrVillage;
  final String district;
  final String houseNumber;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.cityOrVillage,
    required this.district,
    required this.houseNumber,
    this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(id: '', name: '', phoneNumber: '', street: '', cityOrVillage: '', district: '', houseNumber: '');

  @override
  String toString() {
    return '$street, $houseNumber, $cityOrVillage, $district';
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'City': cityOrVillage,
      'State': district,
      'PostalCode': houseNumber,
      'DateTime': DateTime.now(),
      'SelectedAddress': selectedAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) => AddressModel(
        id: data['Id'] as String,
        name: data['Name'] as String,
        phoneNumber: data['PhoneNumber'] as String,
        street: data['Street'] as String,
        cityOrVillage: data['City'] as String,
        district: data['State'] as String,
        houseNumber: data['PostalCode'] as String,
        dateTime: (data['DateTime'] as Timestamp).toDate(),
        selectedAddress: data['SelectedAddress'] as bool,
      );

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressModel(
      id: snapshot.id,
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      cityOrVillage: data['City'] ?? '',
      district: data['State'] ?? '',
      houseNumber: data['PostalCode'] ?? '',
      dateTime: (data['DateTime'] as Timestamp).toDate(),
      selectedAddress: data['SelectedAddress'] as bool,
    );
  }
}
