import 'package:flutter/material.dart';

class Calculer extends StatefulWidget {
  const Calculer({Key? key}) : super(key: key);

  @override
  State<Calculer> createState() => _CalculerState();
}

class _CalculerState extends State<Calculer> {
  TextEditingController txtnombre1 = new TextEditingController();
  TextEditingController txtnombre2 = new TextEditingController();
  TextEditingController txtreponse = new TextEditingController();
  void addition() {
    int n1 = int.parse(txtnombre1.text);
    int n2 = int.parse(txtnombre2.text);
    int rep = n1 + n2;
    txtreponse.text = "" + rep.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATRICE"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(children: [
        new TextField(
          controller: txtnombre1,
          keyboardType: TextInputType.phone,
          decoration:
              InputDecoration(labelText: "nombre 1", hintText: "nombre1"),
        ),
        new TextField(
          controller: txtnombre2,
          keyboardType: TextInputType.phone,
          decoration:
              InputDecoration(labelText: "nombre 2", hintText: "nombre2"),
        ),
        new TextField(
          controller: txtreponse,
          decoration: InputDecoration(
              labelText: "Reponse", hintText: "reponse", enabled: false),
        ),
        RaisedButton(
          onPressed: () {
            addition();
          },
          child: Text("calculer"),
          color: Colors.green,
        )
      ]),
    );
  }
}
