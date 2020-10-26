import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Profile> fetchAlbum(var headers) async {
  final response =
      await http.get("http://192.168.0.4:8080/login",
        headers: headers
      );
      print(response.body);
  if (response.statusCode == 200) {
    print(response.body);
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load profile');
  }
}

class Profile {
  final String id;
  final String username;
  final String email;

  Profile({ this.id, this.username, this.email });

  factory Profile.fromJson(Map<dynamic, dynamic> json) {
    return Profile(
      id: json['id'],
      username: json['username'],
      email: json['email']
    );
  }
}

class Get extends StatefulWidget {
  @override
  _GetState createState() => _GetState();
}

class _GetState extends State<Get> {
  Future<Profile> futureAlbum;

  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    var futureAlbum = fetchAlbum(data["headers"]);
    return Scaffold(
      body: Center(
        child: FutureBuilder<Profile>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.username);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
          },
        ),
      ),
    );
  }
}