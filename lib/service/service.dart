import 'dart:convert';

import 'package:http/http.dart' as http;

class MoviesService {
  Future getMoviesservice() async {
    try {
      final Map<String,String> header={
        "Content-Type":"application/json"
      };
      final Map<String, dynamic> body = {
        "category": "movies",
        "language": "kannada",
        "genre": "all",
        "sort": "voting"
      };
      http.Response response = await http.post(
          Uri.parse("https://hoblist.com/api/movieList"),
          headers: header,
          body: json.encode(body));
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
