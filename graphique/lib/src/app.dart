import 'dart:convert';
import 'AddEditPage.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Future getData() async {
    var url =
        "http://192.168.43.96:81//flutter_food_app/api/foods/getFoods.php";
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Php Mysql Crud"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditPage(),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshop) {
          if (snapshop.hasError) print(snapshop.error);
          return snapshop.hasData
              ? ListView.builder(
                  itemCount: snapshop.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshop.data;
                    return ListTile(
                      leading: GestureDetector(
                        child: Icon(Icons.edit),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditPage(
                                list: list,
                                index: index,
                              ),
                            ),
                          );
                          debugPrint("Edit Clicked");
                        },
                      ),
                      title: Text(list[index]['title']),
                      subtitle: Text(list[index]['discount']),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            var url =
                                "http://192.168.43.96:81/flutter_food_app/api/foods/deleteFoods.php";
                            http.post(url, body: {
                              'id': list[index]['id'],
                            });
                          });

                          debugPrint("Edit delete");
                        },
                        child: Icon(Icons.delete),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
