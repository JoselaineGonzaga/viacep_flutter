import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cep = "";
  String endereco = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta de CEP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "CEP"),
              onChanged: (value) {
                setState(() {
                  cep = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para consultar o CEP e atualizar "endereco"
                // Utilize uma API de consulta de CEP
                // endereco = ...;
              },
              child: Text("Consultar"),
            ),
            SizedBox(height: 16.0),
            Text("Endereço: $endereco"),
          ],
        ),
      ),
    );
  }
}
