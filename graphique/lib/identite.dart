import 'package:flutter/material.dart';

class Identite extends StatefulWidget {
  const Identite({Key? key}) : super(key: key);

  @override
  State<Identite> createState() => _IdentiteState();
}

class _IdentiteState extends State<Identite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CALCULATRICE"),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView(
          children: [
            new TextField(
              controller: null,
              decoration: InputDecoration(
                labelText: "Nom",
                hintText: "Entrer votre nom",
              ),
            ),
            new TextField(
              controller: null,
              decoration: InputDecoration(
                labelText: "Adresse",
                hintText: "Entrer votre Adresse",
              ),
            ),
            new TextField(
              controller: null,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Telephone",
                hintText: "Entrer votre telephone",
                
              ),
            ),
            SizedBox(height: 40,),
            RaisedButton(
              onPressed: () {},
              child: Text("Enregistrer"),
              color: Colors.green,
            )
          ],
        ),
        );
  }
}
