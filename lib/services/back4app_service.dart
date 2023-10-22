import 'package:dio/dio.dart';
import 'package:viacep_flutter/models/cep_model.dart';

class Back4AppService {
  final String apiKey = 'SUA_CHAVE_DO_BACK4APP'; // Substitua pela sua chave
  final Dio dio = Dio();

  Future<void> cadastrarCEP(CEP cep) async {
    try {
      final response = await dio.post(
        'https://parseapi.back4app.com/classes/CEP',
        options: Options(
          headers: {
            'X-Parse-Application-Id': apiKey,
            'X-Parse-REST-API-Key': apiKey,
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'cep': cep.cep,
          'logradouro': cep.logradouro,
          'bairro': cep.bairro,
          'cidade': cep.cidade,
          'estado': cep.estado,
        },
      );
      if (response.statusCode != 201) {
        throw Exception('Erro ao cadastrar o CEP');
      }
    } catch (e) {
      throw Exception('Erro ao cadastrar o CEP: $e');
    }
  }

  // Implemente os métodos para listar, atualizar e excluir CEPs no Back4App
}
