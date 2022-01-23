import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:cv/utils/config.dart';

class AirtableDataInfos {
  String id;
  String title;
  String image;
  String texte;

  AirtableDataInfos({
    required this.id,
    required this.title,
    required this.image,
    required this.texte,
  });
}

class AirtableData4 {
  final Uri urlInfos = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/infos",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataInfos>> getInfos() async {
    final res = await http.get(
      urlInfos,
      headers: {"Authorization": "Bearer ${Config.airtableApikey}"},
    );

    print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataInfos> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataInfos(
                id: value['id'],
                title: value['fields']['title'],
                texte: value['fields']['texte'],
                image: value['fields']['image'][0]['url']),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
