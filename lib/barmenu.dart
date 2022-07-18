import 'package:flutter/material.dart';
import 'package:uas_firlanprayoga_20190801120/about.dart';
import 'package:uas_firlanprayoga_20190801120/home.dart';
import 'package:uas_firlanprayoga_20190801120/tambahdata.dart';

class BarMenu extends StatefulWidget {
  const BarMenu({Key? key}) : super(key: key);

  @override
  State<BarMenu> createState() => _BarMenuState();
}

class _BarMenuState extends State<BarMenu> {
  int currentIndex = 1;
  final screens = [
    const About(),
    const HomePage(),
    const TambahData(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: const Color.fromARGB(255, 3, 194, 252),
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Data Dosen',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_rounded),
            label: 'Tambah Data',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
