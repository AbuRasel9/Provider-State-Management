import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:provider_counter_app/model/data_model.dart';

class NetworkRequister {
  Future<List<DataModel>> getData(String url) async {
    try {
      http.Response response = await http.get(
          Uri.parse("https://jsonplaceholder.typicode.com/todos"));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final allData = jsonDecode(response.body)as List;
        final listOfData = allData.map((value) {
          return DataModel(userId: value["id"],
              id: value["userId"],
              title: value["title"],
              completed: value['completed']);
        }).toList();
        return listOfData;
      } else {
        print("api call failed");
      }

      print(response.statusCode);
    } catch (e) {
      print('etwafagagagagagasggggggggggg$e');
      print("0000000000000000000000000000eeeeeeeeeeeeeeeee33333333333333");
    }
    return [];
  }
}
