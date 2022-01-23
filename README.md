# cv


Créer un projet "cv"

 -> Command palette -> Flutter NEW PROJECT -> APPLICATION 

  - Modifier les éléments pour créer 5 écrans
  - profil 'profil()'
  - experience 'experience()'
  - formation 'education()'
  - compétences 'skill()'
  - infos 'info()'


# Package :

- https://pub.dev/packages/font_awesome_flutter
flutter pub add font_awesome_flutter

- https://pub.dev/packages/url_launcher
flutter pub add url_launcher

# AIRTABLE

 - flutter pub add http
 - créer un fichier 'utils/config.dart'
 - créer un fichier 'model/airtable_data.dart'
    - AirtableDataProfil()
    - AirtableData...()
    - AirtableData()
      - getAllProfil()
      - getAllExperience()
  - modifier 'screen/profil.dart' https://code.att.ovh/84fdac

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


