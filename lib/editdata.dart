// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas_firlanprayoga_20190801120/barmenu.dart';

// ignore: must_be_immutable
class EditData extends StatefulWidget {
  List list;
  int index;
  EditData({Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerNama;
  late TextEditingController controllerNidn;
  late TextEditingController controllerProdi;
  late TextEditingController controllerStatus;
  late TextEditingController controllerPendidikan;

  void editData() {
    var url = "http://10.0.2.2/uas_pmob/editdata.php";

    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "nama_dosen": controllerNama.text,
      "nidn_dosen": controllerNidn.text,
      "prodi": controllerProdi.text,
      "status_dosen": controllerStatus.text,
      "pendidikan": controllerPendidikan.text
    });
  }

  @override
  void initState() {
    controllerNama =
        TextEditingController(text: widget.list[widget.index]['nama_dosen']);
    controllerNidn =
        TextEditingController(text: widget.list[widget.index]['nidn_dosen']);
    controllerProdi =
        TextEditingController(text: widget.list[widget.index]['prodi']);
    controllerStatus =
        TextEditingController(text: widget.list[widget.index]['status_dosen']);
    controllerPendidikan =
        TextEditingController(text: widget.list[widget.index]['pendidikan']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(141, 35, 35, 1),
        title: const Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerNama,
                  decoration: const InputDecoration(
                      hintText: "Nama Dosen", labelText: "Nama Dosen"),
                ),
                TextField(
                  controller: controllerNidn,
                  decoration: const InputDecoration(
                      hintText: "NIDN Dosen", labelText: "NIDN Dosen"),
                ),
                TextField(
                  controller: controllerProdi,
                  decoration: const InputDecoration(
                      hintText: "Program Studi", labelText: "PRODI"),
                ),
                TextField(
                  controller: controllerStatus,
                  decoration: const InputDecoration(
                      hintText: "Status Dosen", labelText: "Status Dosen"),
                ),
                TextField(
                  controller: controllerPendidikan,
                  decoration: const InputDecoration(
                      hintText: "Pendidikan Terakhir",
                      labelText: "Pendidikan Terakhir"),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const BarMenu()));
                  },
                  child: const Text("SAVE"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
