import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(141, 35, 35, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 75,
                child: Text(
                  "About",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 180,
                  child: Image.asset(
                    "assets/profil.png",
                    fit: BoxFit.contain,
                  )),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "FIRLAN PRAYOGA\n20190801120",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: const Text(
                  "Aplikasi ini di rancang untuk memenuhi tugas Ujian Akhir Semester 6 mata kuliah Pemrograman Mobile. Terimakasih kepada dosen pemrograman mobile yaitu Bapak Jefry Sunupurwa Asri S.kom, M.kom. yang telah memberikan materi mengenai flutter.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Versi 1.0.0\n\nCopyright Ⓒ 2022 Universitas Esa Unggul",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
