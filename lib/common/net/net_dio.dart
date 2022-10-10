import 'package:dio/dio.dart';
import 'dart:convert' as convert;

class DioNet {
  Future getByDio() async {

    //定义 Dio实例
    BaseOptions options = BaseOptions(
      baseUrl: "https://www.wanandroid.com",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = Dio(options);
    //获取dio返回的Response
    Response response = await dio.get("${options.baseUrl}/article/list/0/json");
    //返回值转化为JSON
    var json = convert.jsonDecode(response.data);
    return json;
  }
}


