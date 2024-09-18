

import 'package:dio/dio.dart';
import 'package:prova/models/paisesAPI.dart';

class PaisesRepository {
  final Dio dio;

  PaisesRepository({required this.dio});
  
  String? get allPaisesUrl => null;

  Future<List<PaisesAPI>> fetchPaisesInformation() async {

    try {
      final response = await dio.get(allPaisesUrl!);
      if (response.statusCode == 200) {
        List<dynamic> paisesList = [];

        var lists = response.data['results']['lists'] as List;
        for (var list in lists) {
          var paises = list['paises'] as List;
          paisesList.addAll(paises);
        }

        // Mapeia cada livro para o modelo BookModel
        return paisesList.map((pais) => PaisesAPI.fromJson(pais)).toList();
      } else {
        throw Exception('Erro ao tentar pegar informações do país!');
      }
    } catch (e) {
      throw Exception('Erro ao acessar api ${e}!');
    }
  }

  getPaisesAPI() {}

  fetch() {}
}