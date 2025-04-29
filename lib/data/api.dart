import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:ereportapp/utils/config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mime/mime.dart';

class AppDataSource {
  final Dio dio = Dio()
    ..interceptors.add(DioCacheInterceptor(
        options: CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      maxStale: const Duration(days: 7),
    )))
    ..options = BaseOptions(
        baseUrl: MyConfig().apiUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60));

  Future<dynamic> getData(
      {required String path, Map<String, dynamic>? queryData}) async {
    dynamic result;
    try {
      Map<String, dynamic>? query = queryData;
      Response response = await dio.get('/api/$path', queryParameters: query);
      result = response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        result = e.response?.data;
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        result = "ERR: ${e.message ?? "Something went wrong."}";
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<dynamic> postData({
    required String path,
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    dynamic result;
    try {
      Map<String, dynamic>? query = queryData;
      Response response =
          await dio.post('/api/$path', queryParameters: query, data: bodyData);
      result = response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        result = e.response?.data;
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        result = "ERR: ${e.message ?? "Something went wrong."}";
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<dynamic> postFormData({
    required String path,
    Map<String, dynamic>? queryData,
    FormData? bodyFormData,
  }) async {
    dynamic result;
    try {
      Map<String, dynamic>? query = queryData;
      Response response = await dio.post('/api/$path',
          queryParameters: query, data: bodyFormData);
      result = response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        result = e.response?.data;
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        result = "ERR: ${e.message ?? "Something went wrong."}";
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<dynamic> putData({
    required String path,
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    dynamic result;
    try {
      Map<String, dynamic>? query = queryData;
      Response response =
          await dio.put('/api/$path', queryParameters: query, data: bodyData);
      result = response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        result = e.response?.data;
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        result = "ERR: ${e.message ?? "Something went wrong."}";
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<dynamic> putFormData({
    required String path,
    Map<String, dynamic>? queryData,
    FormData? bodyFormData,
  }) async {
    dynamic result;
    try {
      Map<String, dynamic>? query = queryData;
      Response response = await dio.put('/api/$path',
          queryParameters: query, data: bodyFormData);
      result = response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        result = e.response?.data;
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        result = "ERR: ${e.message ?? "Something went wrong."}";
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<dynamic> deleteData(
      {required String path, Map<String, dynamic>? queryData}) async {
    dynamic result;
    try {
      Map<String, dynamic>? query = queryData;
      Response response =
          await dio.delete('/api/$path', queryParameters: query);
      result = response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        result = e.response?.data;
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        result = "ERR: ${e.message ?? "Something went wrong."}";
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<MultipartFile> platformFileToMultipart({
    required PlatformFile pickedFile,
  }) async {
    final multipartFile = await MultipartFile.fromFile(
      pickedFile.path ?? "N/A",
      filename: pickedFile.name,
      contentType: DioMediaType.parse(lookupMimeType(pickedFile.path ?? "N/A") ?? "application/octet-stream"),
    );
    return multipartFile;
  }
}
