import 'dart:convert';
import 'package:http/http.dart' as http;

class Fetch{
Future<String> sendLongText(String input_text) async {
  String apiUrl = 'https://fast-api-vercel-wine.vercel.app/get_summary/';
    String url = apiUrl;
    print('res start');
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      // body: {}
      body: jsonEncode({
        'input_text': input_text,
        'model': 'T5',
        'min_length': 40,
        'max_length': 80
      })
    );
    print('${jsonDecode(response.body)['output_text']}');
    print('res end');
    return ('${jsonDecode(response.body)['output_text']}');
  }
}
