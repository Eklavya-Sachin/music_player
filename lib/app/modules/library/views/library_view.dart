import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x000036),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Music Library'),
        backgroundColor: Color(0x000036),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          children: [
            searchBar(),
            Expanded(
              child: ListView(),
            )
          ],
        ),
      ),
    );
  }
}

Widget searchBar() {
  return TextField(
    style: const TextStyle(color: Colors.white),
    // onChanged: (value) => _runFilter(value),
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xff4c516d),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      // prefixIconConstraints: ,
      suffixIcon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        ),
      ),
      hintText: "Search Music",
      hintStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    ),
  );
}
