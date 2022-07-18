import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uas_firlanprayoga_20190801120/detaildosen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> getData() async {
    String url = 'http://10.0.2.2/uas_pmob/getdata.php';
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(141, 35, 35, 1),
        title: const Text("Data Dosen Universitas XYZ"),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          // ignore: avoid_print
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListDosen(list: snapshot.data ?? [])
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ListDosen extends StatelessWidget {
  final List list;
  // ignore: use_key_in_widget_constructors
  const ListDosen({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ignore: unnecessary_null_comparison
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DetailDosen(
                      list: list,
                      index: i,
                    ))),
            child: Card(
              child: ListTile(
                title: Text(
                  list[i]['nama_dosen'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: const Icon(Icons.supervised_user_circle),
                subtitle: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "NIDN : ${list[i]['nidn_dosen']}",
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
