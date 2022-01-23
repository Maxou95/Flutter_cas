import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cv/model/airtable_education.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final AirtableData2 airtableData = AirtableData2();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 1200,
        child: FutureBuilder(
          future: airtableData.getEducation(),
          builder: (BuildContext context,
              AsyncSnapshot<List<AirtableDataEducation>> snapshot) {
            if (snapshot.hasData) {
              List<AirtableDataEducation>? values = snapshot.data;
              return ListView(
                children: values!
                    .map(
                      (AirtableDataEducation value) => ListTile(
                        leading: Image.network(value.image),
                        title: Text(value.title),
                        subtitle: Text(value.detail),
                      ),
                    )
                    .toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
