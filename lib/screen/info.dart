import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cv/model/airtable_infos.dart';

class InfosScreen extends StatefulWidget {
  const InfosScreen({Key? key}) : super(key: key);

  @override
  _InfosScreenState createState() => _InfosScreenState();
}

class _InfosScreenState extends State<InfosScreen> {
  final AirtableData4 airtableData = AirtableData4();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: FutureBuilder(
          future: airtableData.getInfos(),
          builder: (BuildContext context,
              AsyncSnapshot<List<AirtableDataInfos>> snapshot) {
            if (snapshot.hasData) {
              List<AirtableDataInfos>? values = snapshot.data;
              return ListView(
                children: values!
                    .map(
                      (AirtableDataInfos value) => ListTile(
                        title: Image.network(value.image),
                        subtitle: Text(value.title),
                        trailing: Text(value.texte),
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
