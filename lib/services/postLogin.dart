import 'dart:convert';

loginApi loginApiFromJson(String str) => loginApi.fromjson(json.decode(str));
String loginApiToJson(loginApi data) => json.encode(data.toJson());

class loginApi {
  int success;
  String message;

  loginApi({this.success, this.message});

  factory loginApi.fromjson(Map<String, dynamic> json) =>
      loginApi(success: json["success"], message: json["message"]);

  Map<String, dynamic> toJson() => {"success": success, "message": message};
}
