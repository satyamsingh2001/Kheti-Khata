import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class Testing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English
        Locale('hi', 'IN'), // Hindi
      ],
      title: 'Language Selection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageSelectionPage(),
    );
  }
}

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String selectedLanguage = '';

  void navigateToNextPage() {
    if (selectedLanguage.isNotEmpty) {
      // Navigate to the next page based on the selected language
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NextPage(selectedLanguage)),
      );
    } else {
      // Show an error message or handle the case where no language is selected
      print("Please select a language!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Preferred Language'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
            title: Text('English'),
            value: 'en',
            groupValue: selectedLanguage,
            onChanged: (value) {
              setState(() {
                selectedLanguage = value??"";
              });
            },
          ),
          RadioListTile(
            title: Text('Hindi'),
            value: 'hi',
            groupValue: selectedLanguage,
            onChanged: (value) {
              setState(() {
                selectedLanguage = value??"";
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: navigateToNextPage,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final String selectedLanguage;

  NextPage(this.selectedLanguage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text(
          'Selected Language: $selectedLanguage',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
