import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ui_design/model.dart';

import 'coupons.dart';
import 'events.dart';
import 'map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserComment> samplePosts = [];

  int count = 0;
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        title: Text(
          "                    Home",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        toolbarHeight: 100,
        elevation: 0.0,
      ),
      drawer: const Drawer(
        elevation: 2,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(50, 30),
                    backgroundColor: Colors.red,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  child: const Text(
                    "All",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.red, width: 1.0),
                    fixedSize: const Size(50, 30),
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  child: const Text(
                    "Like",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.red, width: 1.0),
                    fixedSize: const Size(100, 30),
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  child: const Text(
                    "Comment",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.red, width: 1.0),
                    fixedSize: const Size(105, 30),
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  child: const Text(
                    "Bookmark",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: samplePosts.length,
                        // shrinkWrap: true,
                        // primary: false,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ListTile(
                            isThreeLine: true,
                            leading: Text(samplePosts[index].id.toString()),
                            title: Text(
                              samplePosts[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            subtitle: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: samplePosts[index].email + " \n"),
                                  TextSpan(
                                      text: samplePosts[index].body,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
                
          ],
        ),
      ),

    );
  }

  Future<List<UserComment>> getData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(UserComment.fromJson(index));
      }
      return samplePosts;
    } else {
      return samplePosts;
    }
  }
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
}