import 'dart:convert';

class ApiError {
    String? name;
    String? message;
    int? code;
    String? type;
    dynamic data;

    ApiError({
        this.name,
        this.message,
        this.code,
        this.type,
        this.data,
    });

    factory ApiError.fromRawJson(String str) => ApiError.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        name: json["name"],
        message: json["message"],
        code: json["code"],
        type: json["type"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "code": code,
        "type": type,
        "data": data,
    };
}
