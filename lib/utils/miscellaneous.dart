import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';


void logs(String message){
  if(kDebugMode){
    print(message);
  }
}

String dateFormatter (DateTime date){
  DateTime currentDate = date;

  String formattedDate = DateFormat('d MMM yyyy, h:mm a').format(currentDate);
  return formattedDate;
}

String profileDateFormatter (String date) {
  DateTime parsedDate = DateTime.parse(date);

  String formattedDate = DateFormat.yMMMM().format(parsedDate);
  return '${formattedDate[0].toLowerCase()}${formattedDate.substring(1)}';
} 
