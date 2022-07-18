// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas_firlanprayoga_20190801120/barmenu.dart';

class TambahData extends StatefulWidget {
  const TambahData({Key? key}) : super(key: key);

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerNidn = TextEditingController();
  TextEditingController controllerProdi = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController controllerPendidikan = TextEditingController();

  void tambahData() async {
    await http.post(Uri.parse('http://10.0.2.2/uas_pmob/adddata.php'), body: {
      "nama_dosen": controllerNama.text,
      "nidn_dosen": controllerNidn.text,
      "prodi": controllerProdi.text,
      "status_dosen": controllerStatus.text,
      "pendidikan": controllerPendidikan.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(141, 35, 35, 1),
        title: const Text("TAMBAH DATA DOSEN"),
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
                      hintText: "Program Studi", labelText: "Prodi"),
                ),
                TextField(
                  controller: controllerStatus,
                  decoration: const InputDecoration(
                      hintText: "Dosen Tetap/Tidak Tetap",
                      labelText: "Status Dosen"),
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
                  color: const Color.fromARGB(255, 236, 75, 75),
                  onPressed: () {
                    tambahData();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const BarMenu()));
                  },
                  child: const Text("TAMBAH DATA"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
