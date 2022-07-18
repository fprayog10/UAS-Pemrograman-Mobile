// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas_firlanprayoga_20190801120/barmenu.dart';
import 'package:uas_firlanprayoga_20190801120/editdata.dart';

// ignore: must_be_immutable
class DetailDosen extends StatefulWidget {
  List list;
  int index;
  // ignore: use_key_in_widget_constructors
  DetailDosen({required this.index, required this.list});

  @override
  State<DetailDosen> createState() => _DetailDosenState();
}

class _DetailDosenState extends State<DetailDosen> {
  void hapusData() {
    var url = "http://10.0.2.2/uas_pmob/delete.php";

    http.post(Uri.parse(url), body: {
      'id': widget.list[widget.index]['id'],
    });
  }

  void notif(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Icon(
              Icons.warning_amber_sharp,
              size: 48,
            ),
            content: Text(
              "Tindakan Ini Akan Menghapus Data ${widget.list[widget.index]['nama_dosen']}, Apakah Anda Yakin ?",
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
                color: Colors.red,
              ),
              textAlign: TextAlign.justify,
            ),
            actions: [
              // The "Yes" button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.red,
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        hapusData();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const BarMenu()));
                      },
                      child: const Text(
                        'Hapus',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )),
                  const Padding(padding: EdgeInsets.all(15)),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 61, 90, 221),
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Tidak',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )),
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(141, 35, 35, 1),
        title: Text("Profil ${widget.list[widget.index]['nama_dosen']}"),
      ),
      body: Container(
        height: 500,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 90,
                      backgroundColor: Color.fromARGB(255, 190, 23, 23),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage("assets/profil.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  widget.list[widget.index]['nama_dosen'],
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "NIDN : ${widget.list[widget.index]['nidn_dosen']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Program Studi : ${widget.list[widget.index]['prodi']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Pendidikan Terakhir : ${widget.list[widget.index]['pendidikan']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Status : ${widget.list[widget.index]['status_dosen']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      color: const Color.fromARGB(255, 61, 90, 221),
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => EditData(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                      child: const Text("EDIT"),
                    ),
                    const Padding(padding: EdgeInsets.all(15)),
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () => notif(context),
                      child: const Text("DELETE"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
