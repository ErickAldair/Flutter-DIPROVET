import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class AuthService extends ChangeNotifier {

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyB7GRa0nzdze-6FOmhCxanz0yR9NrUOy24';

  final storage = new FlutterSecureStorage();


  Future<String?> createUser(String email, String password) async{

    final Map<String, dynamic> authDate = {
      'email' : email,
      'password' : password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp',{
      'key' : _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authDate));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if(decodedResp.containsKey('idToken')){
      //guardar token
      await storage.write(key: 'token', value: decodedResp['idToken']);
      //decodedResp['idToken'];
      return null;
    }else{
      return decodedResp['error'] ['message'];
    }


  }

  Future<String?> login(String email, String password) async{

    final Map<String, dynamic> authDate = {
      'email' : email,
      'password' : password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword',{
      'key' : _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authDate));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if(decodedResp.containsKey('idToken')){
      //guardar token
      await storage.write(key: 'token', value: decodedResp['idToken']);
      //decodedResp['idToken'];
      return null;
    }else{
      return decodedResp['error'] ['message'];
    }


  }

  Future logout() async{

    await storage.delete(key: 'token');
    return;
  }


  Future<String> readToken()async{

    return await storage.read(key: 'token') ?? '';
  }
  
}