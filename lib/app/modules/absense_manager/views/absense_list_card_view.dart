import 'package:cm_flutter/app/helpers/common_functions.dart';
import 'package:cm_flutter/app/models/absense_list_response.dart';
import 'package:flutter/material.dart';

class AbsenseListCardView extends StatelessWidget {
  final AbsenseListModel? absenseListModel;
  final GestureTapCallback? onTap;

  const AbsenseListCardView({
    Key? key,
    this.absenseListModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AbsenseMemberProfileDetailWidget(
                      absenseListModel: absenseListModel),
                  AbsenseTypeChipWidget(absenseListModel: absenseListModel)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AbsenseStartDateTextWidget(
                      absenseListModel: absenseListModel),
                  AbsenseEndDateTextWidget(absenseListModel: absenseListModel),
                ],
              ),
              AbsenseMemberNoteTextWidget(absenseListModel: absenseListModel),
              AbsenseStatusTextWidget(absenseListModel: absenseListModel),
              AbsenseAdmitterNoteTextWidget(absenseListModel: absenseListModel),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class AbsenseMemberProfileDetailWidget extends StatelessWidget {
  const AbsenseMemberProfileDetailWidget({
    super.key,
    required this.absenseListModel,
  });

  final AbsenseListModel? absenseListModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // if (absenseListModel?.userDoc?.image != null)
            AbsenseMemberProfilePicWidget(absenseListModel: absenseListModel),
            SizedBox(
              width: 10,
            ),
            AbsenseMemberNameTextWidget(absenseListModel: absenseListModel),
          ],
        )
      ],
    );
  }
}

class AbsenseMemberProfilePicWidget extends StatelessWidget {
  const AbsenseMemberProfilePicWidget({
    super.key,
    required this.absenseListModel,
  });

  final AbsenseListModel? absenseListModel;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
          "${absenseListModel!.userDoc!.image}?t=${DateTime.now()}"),
    );
  }
}

class AbsenseAdmitterNoteTextWidget extends StatelessWidget {
  const AbsenseAdmitterNoteTextWidget({
    super.key,
    required this.absenseListModel,
  });

  final AbsenseListModel? absenseListModel;

  @override
  Widget build(BuildContext context) {
    if (isNotEmpty(absenseListModel?.admitterNote)) {
      return Text(
        'Admitter note : ${absenseListModel?.admitterNote ?? ""}',
        style: Theme.of(context).textTheme.bodyMedium,
        maxLines: 2,
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

class AbsenseStatusTextWidget extends StatelessWidget {
  const AbsenseStatusTextWidget({
    super.key,
    required this.absenseListModel,
  });

  final AbsenseListModel? absenseListModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Status : ${getAbsenseStatus(absenseListModel: absenseListModel)}',
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 2,
    );
  }
}

class AbsenseMemberNoteTextWidget extends StatelessWidget {
  const AbsenseMemberNoteTextWidget({
    super.key,
    required this.absenseListModel,
  });

  final AbsenseListModel? absenseListModel;

  @override
  Widget build(BuildContext context) {
    if (isNotEmpty(absenseListModel?.memberNote)) {
      return Text(
        'Member note : ${absenseListModel?.memberNote ?? ""}',
        style: Theme.of(context).textTheme.bodyMedium,
        maxLines: 2,
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

class AbsenseEndDateTextWidget extends StatelessWidget {
  const AbsenseEndDateTextWidget({
    super.key,
    required this.absenseListModel,
  });

  final AbsenseListModel? absenseListModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      'To : ${absenseListModel?.endDate ?? ""}',
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 2,
    );
  }
}

class AbsenseStartDateTextWidget extends StatelessWidget {
  const AbsenseStartDateTextWidget({
    super.key,
    required this.absenseListModel,
  });

  final AbsenseListModel? absenseListModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      'From : ${absenseListModel?.startDate ?? ""}',
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 2,
    );
  }
}

class AbsenseTypeChipWidget extends StatelessWidget {
  const AbsenseTypeChipWidget({
    super.key,
    required this.absenseListModel,
  });

  final AbsenseListModel? absenseListModel;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.zero,
      side: BorderSide(
          color:
              absenseListModel?.type == "vacation" ? Colors.green : Colors.red),
      backgroundColor: absenseListModel?.type == "vacation"
          ? Colors.green.withOpacity(0.1)
          : Colors.red.withOpacity(0.1),
      label: Text(
        absenseListModel?.type ?? "",
        style: TextStyle(
            color: absenseListModel?.type == "vacation"
                ? Colors.green
                : Colors.red),
      ),
    );
  }
}

class AbsenseMemberNameTextWidget extends StatelessWidget {
  const AbsenseMemberNameTextWidget({
    super.key,
    required this.absenseListModel,
  });

  final AbsenseListModel? absenseListModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      absenseListModel?.userDoc?.name ?? "",
      style: Theme.of(context).textTheme.titleLarge,
      // overflow: TextOverflow.ellipsis,
    );
  }
}
