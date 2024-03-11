

import 'package:mrz_parser/mrz_parser.dart';

class MrzScannedDataModel {
  MrzScannedDataModel({
    required this.documentType,
    required this.countryCode,
    required this.surnames,
    required this.givenNames,
    required this.documentNumber,
    required this.nationalityCountryCode,
    required this.birthDate,
    required this.sex,
    required this.expiryDate,
    required this.personalNumber,
    this.personalNumber2,
  });

  final String documentType;
  final String countryCode;
  final String surnames;
  final String givenNames;
  final String documentNumber;
  final String nationalityCountryCode;
  final DateTime birthDate;
  final Sex sex;
  final DateTime expiryDate;
  final String personalNumber;
  final String? personalNumber2;

  Map<String, dynamic> toJson() {
    return {
      'documentType': documentType,
      'countryCode': countryCode,
      'surnames': surnames,
      'givenNames': givenNames,
      'documentNumber': documentNumber,
      'nationalityCountryCode': nationalityCountryCode,
      'birthDate': birthDate.toIso8601String(),
      'sex': sex.toString().split('.').last,
      'expiryDate': expiryDate.toIso8601String(),
      'personalNumber': personalNumber,
      'personalNumber2': personalNumber2,
    };
  }

  factory MrzScannedDataModel.fromJson(Map<String, dynamic> json) {
    return MrzScannedDataModel(
      documentType: json['documentType'],
      countryCode: json['countryCode'],
      surnames: json['surnames'],
      givenNames: json['givenNames'],
      documentNumber: json['documentNumber'],
      nationalityCountryCode: json['nationalityCountryCode'],
      birthDate: DateTime.parse(json['birthDate']),
      sex: Sex.values.firstWhere((e) => e.toString().split('.').last == json['sex']),
      expiryDate: DateTime.parse(json['expiryDate']),
      personalNumber: json['personalNumber'],
      personalNumber2: json['personalNumber2'],
    );
  }
}
