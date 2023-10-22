import 'dart:convert';
import 'package:dio/dio.dart';

import '../models/cep_model.dart';

class ViaCepService {
  final Dio dio = Dio();

  Future<CEP> consultarCEP(String cep) async {
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        final data = json.decode(response.data);
        return CEP(
          cep: data['cep'],
          logradouro: data['logradouro'],
          bairro: data['bairro'],
          cidade: data['localidade'],
          estado: data['uf'],
        );
      }
    } catch (e) {
      throw Exception('Erro na consulta do CEP: $e');
    }
    throw Exception('CEP não encontrado');
  }
}
