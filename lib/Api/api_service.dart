import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://rusconsign.com/api/',
    ));
  }

  Future<Response> login(String username, String password) async {
    try {
      final response = await _dio.post('login', data: {
        'username': username,
        'password': password,
      });
      return response;
    } catch (e) {
      throw Exception('Error in login: $e');
    }
  }

  Future<Response> registerUser(
      String username,
      String fullName,
      String email,
      String password,
      String confirmPassword,
      ) async {
    try {
      final response = await _dio.post('register-user', data: {
        'username': username,
        'full_name': fullName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      });
      return response;
    } catch (e) {
      throw Exception('Error in registerUser: $e');
    }
  }

  Future<Response> getDetailMovie(String token) async {
    try {
      final response = await _dio.get('get-profile', queryParameters: {
        'token': token,
      });
      return response;
    } catch (e) {
      throw Exception('Error in getDetailMovie: $e');
    }
  }
}
