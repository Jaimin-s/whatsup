import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const String baseUrl = 'http://10.0.2.2:3000/api';
  final storage = const FlutterSecureStorage();

  Future<dynamic> post(String endpoint, dynamic payload) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('API Error: ${response.body}');
    }
  }

  Future<dynamic> get(String endpoint) async {
    final String? token = await storage.read(key: 'auth_token');

    try {
      final headers = <String, String>{'Content-Type': 'application/json'};

      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          return [];
        }
        return jsonDecode(response.body);
      }

      throw Exception(
        'Request failed (${response.statusCode}): ${response.body}',
      );
    } catch (e) {
      print('Error in Baseclient get: $e');
      rethrow;
    }
  }
}
