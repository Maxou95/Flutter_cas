import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cv/model/airtable_experience.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final AirtableData1 airtableData = AirtableData1();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 1200,
        child: FutureBuilder(
          future: airtableData.getExperience(),
          builder: (BuildContext context,
              AsyncSnapshot<List<AirtableDataExperience>> snapshot) {
            if (snapshot.hasData) {
              List<AirtableDataExperience>? values = snapshot.data;
              return ListView(
                children: values!
                    .map(
                      (AirtableDataExperience value) => ListTile(
                        leading: Image.network(value.logo),
                        title: Text(value.title),
                        subtitle: Text(value.function),
                        trailing: Text(value.date),
                        //:Text(value.notes),
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
