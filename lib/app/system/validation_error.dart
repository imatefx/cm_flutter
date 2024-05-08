import 'dart:convert';

class ValidationError {
    String? name;
    String? message;
    int? code;
    String? type;
    List<Datum>? data;

    ValidationError({
        this.name,
        this.message,
        this.code,
        this.type,
        this.data,
    });

    factory ValidationError.fromRawJson(String str) => ValidationError.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ValidationError.fromJson(Map<String, dynamic> json) => ValidationError(
        name: json["name"],
        message: json["message"],
        code: json["code"],
        type: json["type"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "code": code,
        "type": type,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? type;
    String? message;
    String? field;
    String? nodeId;
    String? action;

    Datum({
        this.type,
        this.message,
        this.field,
        this.nodeId,
        this.action,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        message: json["message"],
        field: json["field"],
        nodeId: json["nodeID"],
        action: json["action"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "message": message,
        "field": field,
        "nodeID": nodeId,
        "action": action,
    };
}
