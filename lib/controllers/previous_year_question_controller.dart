import 'package:get/get.dart';

class PreviousYearQuesController extends GetxController{
  List<String> subjectList = [
    'Physics',
    'Chemistry',
    'Botany',
    'Zoology'
  ];

  List<Map<String, dynamic>> papersData = [
    {
      "id" : 1,
      "test_name": "JEE Main 2024 (Online) 1st Feb Evening Shift",
      "date": DateTime.now(),
      "languages": ["English", "Hindi"],
      "questions": []
    }
  ];

  List<num> yearsList = [
    2024,
    2023, 
    2022,
    2021,
    2020
  ];
}