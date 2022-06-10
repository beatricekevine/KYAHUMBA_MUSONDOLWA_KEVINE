import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cotation.dart';

class Calcule1 extends StatefulWidget {
  const Calcule1({Key? key}) : super(key: key);

  @override
  State<Calcule1> createState() => _Calcule1State();
}

class _Calcule1State extends State<Calcule1> {
  List<String> _locations = ["travail", "dur"];
  String _selectedLocation = "";
  String dropdownValue = "Add+";
  TextEditingController txtnombre1 = new TextEditingController();
  TextEditingController txtnombre2 = new TextEditingController();
  TextEditingController txtreponse = new TextEditingController();
  void calculer() {
    if (txtnombre1.text == "" || txtnombre2.text == "") {
    } else {
      int a = int.parse(txtnombre1.text);
      int b = int.parse(txtnombre2.text);
      if (dropdownValue == "Add+") {
        txtreponse.text = "" + (a + b).toString();
      } else if (dropdownValue == "sous-") {
        txtreponse.text = "" + (a - b).toString();
      } else if (dropdownValue == "div/") {
        if (a == 0) {
          txtreponse.text = "changer la valuer de premier nombre";
        } else {
          txtreponse.text = "" + (a / b).toString();
        }
      } else if (dropdownValue == "fois*") {
        txtreponse.text = "" + (a * b).toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "CALCULATRICE",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Expanded(
                        child: Column(
                      children: [
                        Container(
                          child: TextField(
                            onChanged: (String value) {
                              try {
                                if (int.parse(value) >= 20) {
                                  value;
                                }
                              } catch (e) {}
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2),
                            ],
                            controller: txtnombre1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "1ere",
                              hintText: "1ere",
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Expanded(
                        child: Column(
                      children: [
                        Container(
                          child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 4,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                "Add+",
                                "sous-",
                                "div/",
                                "fois*"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        )
                      ],
                    )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Expanded(
                        child: Column(
                      children: [
                        Container(
                          child: TextField(
                            controller: txtnombre2,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "2ere",
                              hintText: "2ere",
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    calculer();
                  },
                  child: Text("calculer"),
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Center(
                  child: TextField(
                    controller: txtreponse,
                    enabled: false,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Reponse",
                      hintText: "Reponse",
                    ),
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text("Coter"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Cotation();
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
