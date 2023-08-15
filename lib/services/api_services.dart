import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:todo_note/utils/config.dart';

class Api {
  //Dio initialize
  Dio dio = Dio();

  //Getting data from Api
  Future<Map<String, dynamic>> getTodo() async {
    try {
      final response = await dio.get('$apiKey?page=1&limit=20');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      log(e.toString());
      return {'error': e};
    }
  }

  //Creating data from Api
  Future<Map<String, dynamic>> createTodo(
      String title, String description) async {
    try {
      final response = await dio.post(apiKey, data: {
        "title": title,
        "description": description,
        "is_completed": false
      });
      return response.data;
    } catch (e) {
      log(e.toString());
      return {'error': e};
    }
  }

  //editing from Api
  Future<Map<String, dynamic>> edit(
      String id, String title, String description) async {
    try {
      final response = await dio.put('$apiKey/$id', data: {
        "title": title,
        "description": description,
      });
      return response.data;
    } catch (e) {
      log(e.toString());
      return {'error': e};
    }
  }

  //check compleated or not from Api
  Future<Map<String, dynamic>> check(
      String id, bool value, String title, String description) async {
    try {
      if (!value) {
        final response = await dio.put('$apiKey/$id', data: {
          "is_completed": false,
          "title": title,
          "description": description,
        });
        return response.data;
      } else {
        final response = await dio.put('$apiKey/$id', data: {
          "is_completed": true,
          "title": title,
          "description": description,
        });
        return response.data;
      }
    } catch (e) {
      log(e.toString());
      return {'error': e};
    }
  }

  //Deleting data from Api
  Future<Map<String, dynamic>> deleteTodo(String id) async {
    try {
      final response = await dio.delete('$apiKey/$id');
      return response.data;
    } catch (e) {
      log(e.toString());
      return {'error': e};
    }
  }
}
