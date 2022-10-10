import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetDartHttp {
  Future _getByDartHttp() async {
    // 接口地址
    const url = "https://www.demo.com"; //获取接口的返回值
    final response = await http.get(Uri.https(url, "/api"));
    //接口的返回值转化为JSON
    var json = convert.jsonDecode(response.body);
    return json;
  }
}
