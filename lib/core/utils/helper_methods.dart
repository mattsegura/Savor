import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

Future<void> launchHelperMethod(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw Exception('Could not launch $url');
  }
}

Map<String, dynamic> parser(dynamic hiveMap) {
  final jsonString = jsonEncode(hiveMap);
  return jsonDecode(jsonString);
}
