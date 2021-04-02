import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final authority = "identitytoolkit.googleapis.com";
    final _path = "v1/accounts:$urlSegment";
    final _params = {"key": "AIzaSyBnrPj8mo5pDup2XtrmtIv7F6vrD2k43cM"};
    // final _uri = Uri.https(authority, _path, _params);
    // print(_uri);
    try {
      final response = await http.post(
        Uri.https(authority, _path, _params),
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );
      print(json.decode(response.body));
    } catch (error) {}
  }
}
