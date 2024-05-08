/*
{
"absenceType": "sickness",
"toDate": "2021-01-13T00:00:00.000Z",
"fromDate": "2021-01-13T00:00:00.000Z",
"page": 1,
"pageSize": 10
}
*/

import 'dart:convert';

class AbsenseListRequest {
  String? absenceType;
  DateTime? selectedDate ;
  String? toDate;
  String? fromDate;
  int? page;
  int? pageSize;

  AbsenseListRequest({
    this.absenceType,
    this.toDate,
    this.fromDate,
    this.page,
    this.pageSize,
  });

  AbsenseListRequest copyWith({
    String? absenceType,
    String? toDate,
    String? fromDate,
    int? page,
    int? pageSize,
  }) =>
      AbsenseListRequest(
        absenceType: absenceType ?? this.absenceType,
        toDate: toDate ?? this.toDate,
        fromDate: fromDate ?? this.fromDate,
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
      );

  factory AbsenseListRequest.fromJson(String str) => AbsenseListRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AbsenseListRequest.fromMap(Map<String, dynamic> json) => AbsenseListRequest(
    absenceType: json["absenceType"],
    toDate: json["toDate"],
    fromDate: json["fromDate"],
    page: json["page"],
    pageSize: json["pageSize"],
  );

  Map<String, dynamic> toMap() => {
    "absenceType": absenceType,
    "toDate": toDate,
    "fromDate": fromDate,
    "page": page,
    "pageSize": pageSize,
  };
}
