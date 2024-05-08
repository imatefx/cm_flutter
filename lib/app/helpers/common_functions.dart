import 'package:cm_flutter/app/models/absense_list_response.dart';

String getAbsenseStatus({AbsenseListModel? absenseListModel}){
  if(absenseListModel?.confirmedAt!=null){
    return 'Confirmed' ;
  }
  else if(absenseListModel?.rejectedAt!=null){
    return 'Rejected' ;
  }
  else {
    return 'Requested' ;
  }
}


bool isEmpty(String? value) {
  return value?.isEmpty ?? true;
}

bool isNotEmpty(String? value) {
  return value?.isNotEmpty ?? false;
}
