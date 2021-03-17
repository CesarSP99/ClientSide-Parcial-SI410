import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random/models/random_n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _url =
      Uri.parse('https://apidoblecesar.azurewebsites.net/api/Random');

  Future<String> _enviarNumeroAlAzar() async {
    RandomN rn = RandomN(
      dateAndTime: DateTime.now(),
      randomNumber: Random().nextInt(1000),
    );
    var response = await http.post(
      _url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: randomNToJson(rn),
    );
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Random"),
        ),
        body: Center(
          child: ElevatedButton.icon(
            icon: Icon(Icons.send_rounded),
            onPressed: () async {
              String respuesta = await _enviarNumeroAlAzar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(respuesta),
                ),
              );
            },
            label: Text("Enviar numero al azar"),
          ),
        ),
      ),
    );
  }
}
