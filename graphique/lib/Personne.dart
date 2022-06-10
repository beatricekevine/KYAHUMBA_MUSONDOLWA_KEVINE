// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphique/calcule2.dart';
import 'package:http/http.dart' as http;

class Personne extends StatefulWidget {
  const Personne({Key? key}) : super(key: key);

  @override
  State<Personne> createState() => _PersonneState();
}



class _PersonneState extends State<Personne> {
  String name = "";
  String postname = "";
  String lastname = "";
  FetchJson() async {
    var Response = await http
        .get(Uri.parse("http://192.168.43.115:81/EXAUCE/postdata.php"));
    if (Response.statusCode == 200) {
      String responseBody = Response.body;
      var responseJSON = json.decode(responseBody);
      name = responseJSON['nom'];
      setState(() {
        print('Ui update');
      });
    } else {
      print('Some thing went wrong :${Response.statusCode}');
    }
  }

  TextEditingController nom = new TextEditingController();
  TextEditingController postnom = new TextEditingController();
  TextEditingController prenom = new TextEditingController();
  Future<void> AddData() async {
    var url = "http://192.168.43.115:81/EXAUCE/postdata.php";
    final response = await http.post(Uri.parse(url), body: {
      "nom": nom.text,
      "postnom": postnom.text,
      "prenom": prenom.text
    });
  }

  @override
  void initState() {   super.initState();
    print(getData());
 
  }

  Future<List<dynamic>> getData() async {
    var url = "http://192.168.43.115:81/EXAUCE/getdata.php";
    final response = await http.get(Uri.parse(url));
   var decodedATA= jsonDecode(response.body) ;
    return decodedATA;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MON APKS"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          new TextField(
            controller: nom,
            decoration: InputDecoration(
                labelText: "Entrer votre nom", hintText: "Entrer votre nom"),
          ),
          SizedBox(width: 12),
          new TextField(
            controller: postnom,
            decoration: InputDecoration(
                labelText: "Entrer votre postnom",
                hintText: "Entrer votre postnom"),
          ),
          // ignore: unnecessary_new
          new TextField(
            controller: prenom,
            decoration: InputDecoration(
                labelText: "Entrer votre postnom",
                hintText: "Entrer votre postnom"),
          ),
          new RaisedButton(
            onPressed: () {
              AddData();
            },
            child: Text("inserer"),
          ),

          Container(
            child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      Text(snapshot.data["nom"].toString()),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Some thing went wrong ...');
                }
                return CircularProgressIndicator();
                ;
              },
            ),
          ),
          // FutureBuilder<List>(
          //   future: getData(),
          //   builder: (ctx, ss) {
          //     if (ss.hasError) {
          //       print("reeur");
          //     }
          //     if (ss.hasData) {
          //       return Items(list: ss.data);
          //     } else {
          //       return CircularProgressIndicator();
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}

// class Items extends StatelessWidget {
//   List list;
//   Items({this.list});
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: list == null ? 0 : list.length,
//       itemBuilder: (ctx, i) {
//         return ListTile(
//           leading: Icon(Icons.message),
//           title: Text(list[i]["name"]),
//           subtitle: Text(list[i]["mobile"]),
//           onTap: () => Navigator.of(context).push(MaterialPageRoute(
//             builder: (BuildContext context) => Calcule1(),
//           )),
//         );
//       },
//     );
//   }
// }
