import 'package:dio/dio.dart';

class Api {
  static final Dio _dio = Dio();

  static void configureDio() {
    ///Base url
    _dio.options.baseUrl = 'https://fia-formula-1-championship-statistics.p.rapidapi.com';
    _dio.options.headers['X-RapidAPI-Key'] = 'ad0474a17cmsh8434c481c1a8b79p1d25b9jsn0e6d3ad825a2';
    _dio.options.headers['X-RapidAPI-Host'] = 'fia-formula-1-championship-statistics.p.rapidapi.com';


  }

  static Future httpGet(String path, [Map<String, dynamic>? queryParam]) async {
    try {
      
      final resp = await _dio.get(
        path,
        queryParameters: queryParam
      );

      return resp;
    } catch (e) {
      print(e);
      throw ('Error en el GET');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp;
    } catch (e) {
      print(e);
      throw ('Error en el POST');
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp;
    } catch (e) {
      print(e);
      throw ('Error en el PUT');
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);
      return resp;
    } catch (e) {
      print(e);
      throw ('Error en el delete');
    }
  }
}