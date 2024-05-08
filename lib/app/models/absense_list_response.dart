import 'dart:convert';

class AbsenseListResponse {
  List<AbsenseListModel>? rows;
  int? total;
  int? page;
  int? pageSize;
  int? totalPages;

  AbsenseListResponse({
    this.rows,
    this.total,
    this.page,
    this.pageSize,
    this.totalPages,
  });

  AbsenseListResponse copyWith({
    List<AbsenseListModel>? rows,
    int? total,
    int? page,
    int? pageSize,
    int? totalPages,
  }) =>
      AbsenseListResponse(
        rows: rows ?? this.rows,
        total: total ?? this.total,
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        totalPages: totalPages ?? this.totalPages,
      );

  factory AbsenseListResponse.fromJson(String str) => AbsenseListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AbsenseListResponse.fromMap(Map<String, dynamic> json) => AbsenseListResponse(
    rows: json["rows"] == null ? [] : List<AbsenseListModel>.from(json["rows"]!.map((x) => AbsenseListModel.fromMap(x))),
    total: json["total"],
    page: json["page"],
    pageSize: json["pageSize"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toMap() => {
    "rows": rows == null ? [] : List<dynamic>.from(rows!.map((x) => x.toMap())),
    "total": total,
    "page": page,
    "pageSize": pageSize,
    "totalPages": totalPages,
  };
}

class AbsenseListModel {
  dynamic admitterId;
  String? admitterNote;
  String? confirmedAt;
  String? createdAt;
  int? crewId;
  String? endDate;
  String? fmtEndDate;
  int? id;
  String? memberNote;
  dynamic rejectedAt;
  String? startDate;
  String? fmtStartDate;
  String? fmtConfirmedAt;
  String? fmtCreatedAt;
  String? type;
  int? userId;
  UserDoc? userDoc;

  AbsenseListModel({
    this.admitterId,
    this.admitterNote,
    this.confirmedAt,
    this.createdAt,
    this.crewId,
    this.endDate,
    this.fmtEndDate,
    this.id,
    this.memberNote,
    this.rejectedAt,
    this.startDate,
    this.fmtStartDate,
    this.fmtConfirmedAt,
    this.fmtCreatedAt,
    this.type,
    this.userId,
    this.userDoc,
  });

  AbsenseListModel copyWith({
    dynamic admitterId,
    String? admitterNote,
    String? confirmedAt,
    String? createdAt,
    int? crewId,
    String? endDate,
    String? fmtEndDate,
    int? id,
    String? memberNote,
    dynamic rejectedAt,
    String? startDate,
    String? fmtStartDate,
    String? fmtConfirmedAt,
    String? fmtCreatedAt,
    String? type,
    int? userId,
    UserDoc? userDoc,
  }) =>
      AbsenseListModel(
        admitterId: admitterId ?? this.admitterId,
        admitterNote: admitterNote ?? this.admitterNote,
        confirmedAt: confirmedAt ?? this.confirmedAt,
        createdAt: createdAt ?? this.createdAt,
        crewId: crewId ?? this.crewId,
        endDate: endDate ?? this.endDate,
        fmtEndDate: fmtEndDate ?? this.fmtEndDate,
        id: id ?? this.id,
        memberNote: memberNote ?? this.memberNote,
        rejectedAt: rejectedAt ?? this.rejectedAt,
        startDate: startDate ?? this.startDate,
        fmtStartDate: fmtStartDate ?? this.fmtStartDate,
        fmtConfirmedAt: fmtConfirmedAt ?? this.fmtConfirmedAt,
        fmtCreatedAt: fmtCreatedAt ?? this.fmtCreatedAt,
        type: type ?? this.type,
        userId: userId ?? this.userId,
        userDoc: userDoc ?? this.userDoc,
      );

  factory AbsenseListModel.fromJson(String str) => AbsenseListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AbsenseListModel.fromMap(Map<String, dynamic> json) => AbsenseListModel(
    admitterId: json["admitterId"],
    admitterNote: json["admitterNote"],
    confirmedAt: json["confirmedAt"],
    createdAt: json["createdAt"],
    crewId: json["crewId"],
    endDate: json["endDate"],
    fmtEndDate: json["fmtEndDate"],
    id: json["id"],
    memberNote: json["memberNote"],
    rejectedAt: json["rejectedAt"],
    startDate: json["startDate"],
    fmtStartDate: json["fmtStartDate"],
    fmtConfirmedAt: json["fmtConfirmedAt"],
    fmtCreatedAt: json["fmtCreatedAt"],
    type: json["type"],
    userId: json["userId"],
    userDoc: json["userDoc"] == null ? null : UserDoc.fromMap(json["userDoc"]),
  );

  Map<String, dynamic> toMap() => {
    "admitterId": admitterId,
    "admitterNote": admitterNote,
    "confirmedAt": confirmedAt,
    "createdAt": createdAt,
    "crewId": crewId,
    "endDate": endDate,
    "fmtEndDate": fmtEndDate,
    "id": id,
    "memberNote": memberNote,
    "rejectedAt": rejectedAt,
    "startDate": startDate,
    "fmtStartDate": fmtStartDate,
    "fmtConfirmedAt": fmtConfirmedAt,
    "fmtCreatedAt": fmtCreatedAt,
    "type": type,
    "userId": userId,
    "userDoc": userDoc?.toMap(),
  };
}

class UserDoc {
  int? crewId;
  int? id;
  String? image;
  String? name;
  int? userId;

  UserDoc({
    this.crewId,
    this.id,
    this.image,
    this.name,
    this.userId,
  });

  UserDoc copyWith({
    int? crewId,
    int? id,
    String? image,
    String? name,
    int? userId,
  }) =>
      UserDoc(
        crewId: crewId ?? this.crewId,
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        userId: userId ?? this.userId,
      );

  factory UserDoc.fromJson(String str) => UserDoc.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDoc.fromMap(Map<String, dynamic> json) => UserDoc(
    crewId: json["crewId"],
    id: json["id"],
    image: json["image"],
    name: json["name"],
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => {
    "crewId": crewId,
    "id": id,
    "image": image,
    "name": name,
    "userId": userId,
  };
}
