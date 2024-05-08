import 'dart:convert';

class ApiMetadata {
    String message;
    String? url;
    int? code;
    dynamic resBody;
    dynamic reqBody;

    ApiMetadata({
        this.message= "Unknown Error",
        this.url,
        this.code,
        this.resBody,
        this.reqBody,
    });

    factory ApiMetadata.fromRawJson(String str) => ApiMetadata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApiMetadata.fromJson(Map<String, dynamic> json) => ApiMetadata(
        message: json["message"],
        url: json["url"],
        code: json["code"],
        resBody: json["resBody"],
        reqBody: json["reqBody"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "url": url,
        "code": code,
        "resBody": resBody,
        "reqBody": reqBody,
    };
}
