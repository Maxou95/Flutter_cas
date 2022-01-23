import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:cv/utils/config.dart';

class AirtableDataEducation {
  String id;
  String title;
  String image;
  String detail;

  AirtableDataEducation({
    required this.id,
    required this.title,
    required this.image,
    required this.detail,
  });
}

class AirtableData2 {
  final Uri urlEducation = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/education",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataEducation>> getEducation() async {
    final res = await http.get(
      urlEducation,
      headers: {"Authorization": "Bearer ${Config.airtableApikey}"},
    );

    print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataEducation> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataEducation(
                id: value['id'],
                title: value['fields']['title'],
                image: value['fields']['image'][0]['url'],
                detail: value['fields']['detail']),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
