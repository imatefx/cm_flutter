import 'package:cm_flutter/app/helpers/common_functions.dart';
import 'package:cm_flutter/app/models/absense_list_response.dart';
import 'package:cm_flutter/app/modules/absense_manager/views/absense_list_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AbsenseListResponse absenseListResponse = AbsenseListResponse.fromJson("""
      {
    "rows": [
        {
            "admitterId": null,
            "admitterNote": "",
            "confirmedAt": "2020-12-12T18:03:55.000+01:00",
            "createdAt": "2020-12-12T14:17:01.000+01:00",
            "crewId": 352,
            "endDate": "2021-01-13",
            "fmtEndDate": "2021-01-13T00:00:00.000Z",
            "id": 2351,
            "memberNote": "",
            "rejectedAt": null,
            "startDate": "2021-01-13",
            "fmtStartDate": "2021-01-13T00:00:00.000Z",
            "fmtConfirmedAt": "2020-12-12T17:03:55.000Z",
            "fmtCreatedAt": "2020-12-12T13:17:01.000Z",
            "type": "sickness",
            "userId": 2664,
            "userDoc": {
                "crewId": 352,
                "id": 2650,
                "image": "https://loremflickr.com/300/400",
                "name": "Mike",
                "userId": 2664
            }
        },
        {
            "admitterId": null,
            "admitterNote": "Sorry",
            "confirmedAt": null,
            "createdAt": "2021-01-03T17:36:52.000+01:00",
            "crewId": 352,
            "endDate": "2021-01-05",
            "fmtEndDate": "2021-01-05T00:00:00.000Z",
            "id": 2521,
            "memberNote": "ganzer tag",
            "rejectedAt": "2021-01-03T17:39:50.000+01:00",
            "startDate": "2021-01-05",
            "fmtStartDate": "2021-01-05T00:00:00.000Z",
            "fmtConfirmedAt": "1970-01-01T00:00:00.000Z",
            "fmtCreatedAt": "2021-01-03T16:36:52.000Z",
            "type": "vacation",
            "userId": 2664,
            "userDoc": {
                "crewId": 352,
                "id": 2650,
                "image": "https://loremflickr.com/300/400",
                "name": "Mike",
                "userId": 2664
            }
        },
        {
            "admitterId": null,
            "admitterNote": "",
            "confirmedAt": "2020-12-12T18:03:55.000+01:00",
            "createdAt": "2020-12-12T14:17:01.000+01:00",
            "crewId": 352,
            "endDate": "2021-01-13",
            "fmtEndDate": "2021-01-13T00:00:00.000Z",
            "id": 2351,
            "memberNote": "",
            "rejectedAt": null,
            "startDate": "2021-01-13",
            "fmtStartDate": "2021-01-13T00:00:00.000Z",
            "fmtConfirmedAt": "2020-12-12T17:03:55.000Z",
            "fmtCreatedAt": "2020-12-12T13:17:01.000Z",
            "type": "sickness",
            "userId": 2664,
            "userDoc": {
                "crewId": 352,
                "id": 2650,
                "image": "https://loremflickr.com/300/400",
                "name": "Mike",
                "userId": 2664
            }
        },
        {
            "admitterId": null,
            "admitterNote": "Sorry",
            "confirmedAt": null,
            "createdAt": "2021-01-03T17:36:52.000+01:00",
            "crewId": 352,
            "endDate": "2021-01-05",
            "fmtEndDate": "2021-01-05T00:00:00.000Z",
            "id": 2521,
            "memberNote": "ganzer tag",
            "rejectedAt": "2021-01-03T17:39:50.000+01:00",
            "startDate": "2021-01-05",
            "fmtStartDate": "2021-01-05T00:00:00.000Z",
            "fmtConfirmedAt": "1970-01-01T00:00:00.000Z",
            "fmtCreatedAt": "2021-01-03T16:36:52.000Z",
            "type": "vacation",
            "userId": 2664,
            "userDoc": {
                "crewId": 352,
                "id": 2650,
                "image": "https://loremflickr.com/300/400",
                "name": "Mike",
                "userId": 2664
            }
        },
        {
            "admitterId": 709,
            "admitterNote": "",
            "confirmedAt": null,
            "createdAt": "2021-05-12T09:27:30.000+02:00",
            "crewId": 352,
            "endDate": "2021-06-26",
            "fmtEndDate": "2021-06-26T00:00:00.000Z",
            "id": 5291,
            "memberNote": "",
            "rejectedAt": null,
            "startDate": "2021-06-26",
            "fmtStartDate": "2021-06-26T00:00:00.000Z",
            "fmtConfirmedAt": "1970-01-01T00:00:00.000Z",
            "fmtCreatedAt": "2021-05-12T07:27:30.000Z",
            "type": "sickness",
            "userId": 8007,
            "userDoc": {
                "crewId": 352,
                "id": 8442,
                "image": "https://loremflickr.com/300/400",
                "name": "Linda",
                "userId": 8007
            }
        }
    ],
    "total": 42,
    "page": 1,
    "pageSize": 10,
    "totalPages": 5
}
      """);

  testWidgets('Absense List Card should have Name', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(1);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder = find.text(absenseListModel.userDoc!.name.toString());

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Absense List Card should have From date', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(1);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder = find.text('From : ${absenseListModel.startDate ?? ""}');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Absense List Card should have To date', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(1);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder = find.text('To : ${absenseListModel.endDate ?? ""}');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Absense List Card should have Status', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(1);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder = find.text(
        'Status : ${getAbsenseStatus(absenseListModel: absenseListModel)}');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Absense List Card should have Admitter Note', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(1);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder =
        find.text('Admitter note : ${absenseListModel.admitterNote ?? ""}');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Absense List Card should have Member Note', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(1);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder =
        find.text('Member note : ${absenseListModel.memberNote ?? ""}');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Absense List Card should have Absense Type', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(1);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder = find.text(absenseListModel.type.toString());

    expect(textFinder, findsOneWidget);
  });


  testWidgets('Absense List Card should not have Admitter Note if no value', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(2);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder =
        find.text('Admitter note : ${absenseListModel.admitterNote ?? ""}');

    expect(textFinder, findsNothing);
  });

  testWidgets('Absense List Card should not have Member Note if no value', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(2);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder =
        find.text('Member note : ${absenseListModel.memberNote ?? ""}');

    expect(textFinder, findsNothing);
  });

  testWidgets('Absense List Card should have Status Confirmed', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(2);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder =
        find.text('Status : Confirmed');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Absense List Card should have Status Confirmed', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(2);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder =
        find.text('Status : Confirmed');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Absense List Card should have Status Rejected', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(3);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder =
        find.text('Status : Rejected');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Absense List Card should have Status Requested', (tester) async {
    AbsenseListModel absenseListModel = absenseListResponse.rows!.elementAt(4);

    await tester.pumpWidget(MaterialApp(
      home: AbsenseListCardView(absenseListModel: absenseListModel),
    ));

    final textFinder =
        find.text('Status : Requested');

    expect(textFinder, findsOneWidget);
  });

}
