///
/// model/airtable_data.dart
///

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:cv/utils/config.dart';

class AirtableDataExperience {
  String id;
  String title;
  String function;
  String date;
  String notes;
  String logo;

  AirtableDataExperience({
    required this.id,
    required this.title,
    required this.function,
    required this.date,
    required this.notes,
    required this.logo,
  });
}

class AirtableData1 {
  final Uri urlExperience = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/experience",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataExperience>> getExperience() async {
    final res = await http.get(
      urlExperience,
      headers: {"Authorization": "Bearer ${Config.airtableApikey}"},
    );

    print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataExperience> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataExperience(
                id: value['id'],
                title: value['fields']['title'],
                function: value['fields']['function'],
                date: value['fields']['date'],
                notes: value['fields']['notes'],
                logo: value['fields']['logo'][0]['url']),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
