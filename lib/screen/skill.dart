import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cv/model/airtable_skill.dart';

class SkillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Airtable3 airtableData = Airtable3();

    return SingleChildScrollView(
      padding: EdgeInsets.all(30),

      ///
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 1200,
            child: FutureBuilder(
              future: airtableData.getSkill(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AirtableDataSkill>> snapshot) {
                if (snapshot.hasData) {
                  List<AirtableDataSkill>? values = snapshot.data;
                  return ListView(
                    children: values!
                        .map(
                          (AirtableDataSkill value) => ListTile(
                            leading: Text(value.category),
                            subtitle: Column(children: [
                              for (var imageListComp in value.skills)
                                Image.network(imageListComp)
                            ]),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
