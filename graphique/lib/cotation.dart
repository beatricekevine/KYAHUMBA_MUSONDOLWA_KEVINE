import 'package:flutter/material.dart';

class Cotation extends StatefulWidget {
  const Cotation({Key? key}) : super(key: key);

  @override
  State<Cotation> createState() => _CotationState();
}

class _CotationState extends State<Cotation> {
  TextEditingController txtalgorithme = new TextEditingController();
  TextEditingController txtmath = new TextEditingController();
  TextEditingController txtcompte = new TextEditingController();
  TextEditingController txtstatistique = new TextEditingController();
  TextEditingController txttotal = new TextEditingController();
  TextEditingController txtpourcentage = new TextEditingController();
  TextEditingController txtmention = new TextEditingController();
  void calculer() {
    if(txtalgorithme.text=="" || txtmath.text=="" || txtcompte.text=="" || txtstatistique.text==""){

    }
    else{

  
    int algorithe = int.parse(txtalgorithme.text);
    int math = int.parse(txtmath.text);
    int compte = int.parse(txtcompte.text);
    int stat = int.parse(txtstatistique.text);
    int total = algorithe + math + compte + stat;
    txttotal.text = "" + total.toString() + "/190";
    double poure = total * 100 / 190;
    txtpourcentage.text = "" + poure.toString() + "%";
    if (poure >= 0 && poure <= 35) {
      txtmention.text = "NAF";
    }
    if (poure > 35 && poure < 50) {
      txtmention.text = "A";
    }
    if (poure >= 50 && poure < 70) {
      txtmention.text = "S";
    }
    if (poure >= 70 && poure < 80) {
      txtmention.text = "D";
    }
    if (poure >= 80 && poure < 90) {
      txtmention.text = "GD";
    }
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COTATION",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Expanded(child: Text("Algorithme"))),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Expanded(
                        child: TextField(
                          controller: txtalgorithme,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "/40",
                            hintText: "/40",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Expanded(child: Text("Mathematique"))),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Expanded(
                        child: TextField(
                          controller: txtmath,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "/50",
                            hintText: "/50",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Expanded(child: Text("Comptabilite"))),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Expanded(
                        child: TextField(
                          controller: txtcompte,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "/60",
                            hintText: "/60",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Expanded(child: Text("Statistique"))),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Expanded(
                        child: TextField(
                          controller: txtstatistique,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "/40",
                            hintText: "/40",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Expanded(child: Text(""))),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Expanded(
                          child: RaisedButton(
                              child: Text("Calculer"),
                              onPressed: () {
                                calculer();
                              }),
                        )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Expanded(child: Text(""))),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Expanded(
                          child: TextField(
                            controller: txttotal,
                            enabled: false,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Total",
                              hintText: "Total",
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Expanded(child: Text(""))),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Expanded(
                          child: TextField(
                            controller: txtpourcentage,
                            enabled: false,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Pourcentage",
                              hintText: "Pourcentage",
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Expanded(child: Text(""))),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Expanded(
                          child: TextField(
                            controller: txtmention,
                            enabled: false,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Mention",
                              hintText: "Mention",
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
