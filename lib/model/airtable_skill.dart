import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:cv/utils/config.dart';

class AirtableDataSkill {
  String id;
  String category;
  List<String> skills;

  AirtableDataSkill({
    required this.id,
    required this.category,
    required this.skills,
  });
}

class Airtable3 {
  final Uri urlSkill = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/competence",
    {"maxRecords": "500", "view": "Grid view"},
  );

  Future<List<AirtableDataSkill>> getSkill() async {
    final res = await http.get(
      urlSkill,
      headers: {"Authorization": "Bearer ${Config.airtableApikey}"},
    );

    // print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      // print(data);

      List<AirtableDataSkill> values = [];
      data.forEach(
        (value) {
          dynamic skills = value['fields']['skills'];
          List<String> imageListComp = [];
          skills.forEach((competence) => imageListComp.add(competence['url']));
          return values.add(
            AirtableDataSkill(
              id: value['id'],
              category: value['fields']['category'],
              skills: imageListComp,
            ),
          );
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
