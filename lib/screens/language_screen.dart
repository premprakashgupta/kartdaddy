import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String savedLanguage = 'en';
  final box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLanguage();
  }

  void fetchLanguage() {
    var language = box.read('language');
    setState(() {
      if (language != null) {
        savedLanguage = language;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          children: [
            _buildOption('English', 'en'),
            const SizedBox(height: 16),
            _buildOption(
              'Hindi',
              'hi',
            ),
            const SizedBox(height: 16),
            _buildOption(
              'Bangla',
              'bn',
            ),
            const SizedBox(height: 16),
            _buildOption('Bhojpuri', 'bho'),
            // Add more LanguageOption widgets as needed
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String language, String locale) {
    return InkWell(
      onTap: () {
        setState(() {
          box.write('language', locale);
          savedLanguage = locale;
          // Restart the application
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: savedLanguage == locale ? Colors.amber : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: savedLanguage == locale ? Colors.amber : Colors.black,
          ),
        ),
        child: Text(
          language,
          style: TextStyle(
            fontWeight:
                savedLanguage == locale ? FontWeight.bold : FontWeight.normal,
            color: savedLanguage == locale ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
