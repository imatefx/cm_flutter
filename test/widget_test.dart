import 'package:cm_flutter/app/models/absense_list_response.dart';
import 'package:cm_flutter/app/modules/absense_manager/views/absense_list_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
//   testWidgets('MyWidget has a title and message', (tester) async {
//     AbsenseListResponse absenseListResponse = AbsenseListResponse.fromJson("""
//       {
//     "rows": [
//         {
//             "admitterId": null,
//             "admitterNote": "",
//             "confirmedAt": "2020-12-12T18:03:55.000+01:00",
//             "createdAt": "2020-12-12T14:17:01.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-01-13",
//             "fmtEndDate": "2021-01-13T00:00:00.000Z",
//             "id": 2351,
//             "memberNote": "",
//             "rejectedAt": null,
//             "startDate": "2021-01-13",
//             "fmtStartDate": "2021-01-13T00:00:00.000Z",
//             "fmtConfirmedAt": "2020-12-12T17:03:55.000Z",
//             "fmtCreatedAt": "2020-12-12T13:17:01.000Z",
//             "type": "sickness",
//             "userId": 2664,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 2650,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Mike",
//                 "userId": 2664
//             }
//         },
//         {
//             "admitterId": null,
//             "admitterNote": "Sorry",
//             "confirmedAt": null,
//             "createdAt": "2021-01-03T17:36:52.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-01-05",
//             "fmtEndDate": "2021-01-05T00:00:00.000Z",
//             "id": 2521,
//             "memberNote": "ganzer tag",
//             "rejectedAt": "2021-01-03T17:39:50.000+01:00",
//             "startDate": "2021-01-05",
//             "fmtStartDate": "2021-01-05T00:00:00.000Z",
//             "fmtConfirmedAt": "1970-01-01T00:00:00.000Z",
//             "fmtCreatedAt": "2021-01-03T16:36:52.000Z",
//             "type": "vacation",
//             "userId": 2664,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 2650,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Mike",
//                 "userId": 2664
//             }
//         },
//         {
//             "admitterId": null,
//             "admitterNote": "",
//             "confirmedAt": "2021-01-09T18:43:29.000+01:00",
//             "createdAt": "2021-01-09T17:45:47.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-01-11",
//             "fmtEndDate": "2021-01-11T00:00:00.000Z",
//             "id": 2634,
//             "memberNote": "Nachmittag 0,5 Tage. Danke.",
//             "rejectedAt": null,
//             "startDate": "2021-01-11",
//             "fmtStartDate": "2021-01-11T00:00:00.000Z",
//             "fmtConfirmedAt": "2021-01-09T17:43:29.000Z",
//             "fmtCreatedAt": "2021-01-09T16:45:47.000Z",
//             "type": "vacation",
//             "userId": 649,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 713,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Ines",
//                 "userId": 649
//             }
//         },
//         {
//             "admitterId": null,
//             "admitterNote": "",
//             "confirmedAt": null,
//             "createdAt": "2021-01-25T10:04:51.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-02-06",
//             "fmtEndDate": "2021-02-06T00:00:00.000Z",
//             "id": 2904,
//             "memberNote": "",
//             "rejectedAt": "2021-01-25T10:14:44.000+01:00",
//             "startDate": "2021-02-02",
//             "fmtStartDate": "2021-02-02T00:00:00.000Z",
//             "fmtConfirmedAt": "1970-01-01T00:00:00.000Z",
//             "fmtCreatedAt": "2021-01-25T09:04:51.000Z",
//             "type": "vacation",
//             "userId": 5293,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 5876,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Daniel",
//                 "userId": 5293
//             }
//         },
//         {
//             "admitterId": null,
//             "admitterNote": "",
//             "confirmedAt": "2021-01-27T17:35:03.000+01:00",
//             "createdAt": "2021-01-25T11:06:19.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-03-11",
//             "fmtEndDate": "2021-03-11T00:00:00.000Z",
//             "id": 2909,
//             "memberNote": "Urlaub",
//             "rejectedAt": null,
//             "startDate": "2021-02-23",
//             "fmtStartDate": "2021-02-23T00:00:00.000Z",
//             "fmtConfirmedAt": "2021-01-27T16:35:03.000Z",
//             "fmtCreatedAt": "2021-01-25T10:06:19.000Z",
//             "type": "vacation",
//             "userId": 5192,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 7111,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Sandra",
//                 "userId": 5192
//             }
//         },
//         {
//             "admitterId": null,
//             "admitterNote": "",
//             "confirmedAt": "2021-01-27T17:34:25.000+01:00",
//             "createdAt": "2021-01-27T15:52:59.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-02-03",
//             "fmtEndDate": "2021-02-03T00:00:00.000Z",
//             "id": 2942,
//             "memberNote": "",
//             "rejectedAt": null,
//             "startDate": "2021-02-03",
//             "fmtStartDate": "2021-02-03T00:00:00.000Z",
//             "fmtConfirmedAt": "2021-01-27T16:34:25.000Z",
//             "fmtCreatedAt": "2021-01-27T14:52:59.000Z",
//             "type": "vacation",
//             "userId": 2664,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 2650,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Mike",
//                 "userId": 2664
//             }
//         },
//         {
//             "admitterId": null,
//             "admitterNote": "",
//             "confirmedAt": "2021-01-27T17:34:31.000+01:00",
//             "createdAt": "2021-01-27T15:53:23.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-03-03",
//             "fmtEndDate": "2021-03-03T00:00:00.000Z",
//             "id": 2943,
//             "memberNote": "",
//             "rejectedAt": null,
//             "startDate": "2021-03-03",
//             "fmtStartDate": "2021-03-03T00:00:00.000Z",
//             "fmtConfirmedAt": "2021-01-27T16:34:31.000Z",
//             "fmtCreatedAt": "2021-01-27T14:53:23.000Z",
//             "type": "vacation",
//             "userId": 2664,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 2650,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Mike",
//                 "userId": 2664
//             }
//         },
//         {
//             "admitterId": null,
//             "admitterNote": "",
//             "confirmedAt": "2021-03-05T09:31:55.000+01:00",
//             "createdAt": "2021-01-30T10:24:36.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-04-07",
//             "fmtEndDate": "2021-04-07T00:00:00.000Z",
//             "id": 2955,
//             "memberNote": "Uni: Blockpraktikum",
//             "rejectedAt": null,
//             "startDate": "2021-03-27",
//             "fmtStartDate": "2021-03-27T00:00:00.000Z",
//             "fmtConfirmedAt": "2021-03-05T08:31:55.000Z",
//             "fmtCreatedAt": "2021-01-30T09:24:36.000Z",
//             "type": "vacation",
//             "userId": 2735,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 2950,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Manuel",
//                 "userId": 2735
//             }
//         },
//         {
//             "admitterId": null,
//             "admitterNote": "",
//             "confirmedAt": "2021-02-14T12:02:07.000+01:00",
//             "createdAt": "2021-02-14T11:32:56.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-02-16",
//             "fmtEndDate": "2021-02-16T00:00:00.000Z",
//             "id": 3229,
//             "memberNote": "",
//             "rejectedAt": null,
//             "startDate": "2021-02-16",
//             "fmtStartDate": "2021-02-16T00:00:00.000Z",
//             "fmtConfirmedAt": "2021-02-14T11:02:07.000Z",
//             "fmtCreatedAt": "2021-02-14T10:32:56.000Z",
//             "type": "vacation",
//             "userId": 2664,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 2650,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Mike",
//                 "userId": 2664
//             }
//         },
//         {
//             "admitterId": null,
//             "admitterNote": "Leider sind Wolfram und Phillip schon im Urlaub. Geh lieber mal im März",
//             "confirmedAt": null,
//             "createdAt": "2021-02-14T15:41:26.000+01:00",
//             "crewId": 352,
//             "endDate": "2021-02-25",
//             "fmtEndDate": "2021-02-25T00:00:00.000Z",
//             "id": 3235,
//             "memberNote": "Skiurlaub",
//             "rejectedAt": "2021-02-14T15:43:06.000+01:00",
//             "startDate": "2021-02-20",
//             "fmtStartDate": "2021-02-20T00:00:00.000Z",
//             "fmtConfirmedAt": "1970-01-01T00:00:00.000Z",
//             "fmtCreatedAt": "2021-02-14T14:41:26.000Z",
//             "type": "sickness",
//             "userId": 644,
//             "userDoc": {
//                 "crewId": 352,
//                 "id": 709,
//                 "image": "https://loremflickr.com/300/400",
//                 "name": "Max",
//                 "userId": 644
//             }
//         }
//     ],
//     "total": 42,
//     "page": 1,
//     "pageSize": 10,
//     "totalPages": 5
// }
//       """);

//     AbsenseListModel ele = absenseListResponse.rows!.elementAt(1);

//     await tester.pumpWidget(MaterialApp(
//       home: AbsenseListCardView(absenseListModel: ele),
//     ));

//     // Create the Finders.
//     final titleFinder = find.text('Mike');
//     final messageFinder = find.text('M');

//     // Use the `findsOneWidget` matcher provided by flutter_test to
//     // verify that the Text widgets appear exactly once in the widget tree.
//     expect(titleFinder, findsOneWidget);
//     expect(messageFinder, findsOneWidget);
//   });
}
