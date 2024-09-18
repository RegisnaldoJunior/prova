// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaisesAPI {
  final String name;
  final String capital;
  final String languages;
  final String maps;
  final String flag;

  PaisesAPI(
      {required this.name,
      required this.capital,
      required this.languages,
      required this.maps,
      required this.flag});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'capital': capital,
      'languages': languages,
      'maps': maps,
      'flag': flag,
    };
  }

  factory PaisesAPI.fromMap(Map<String, dynamic> map) {
    return PaisesAPI(
      name: map['name'] as String,
      capital: map['capital'] as String,
      languages: map['languages'] as String,
      maps: map['maps'] as String,
      flag: map['flag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaisesAPI.fromJson(String source) =>
      PaisesAPI.fromMap(json.decode(source) as Map<String, dynamic>);
}
