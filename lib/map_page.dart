import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'model.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<UserComment> samplePosts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        title: Text(
          "                     Maps",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        toolbarHeight: 100,
        elevation: 0.0,
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(
              height: 5,
            ),
            const Text("These are the descriptions who have won the maps", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
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
                            leading: Text(samplePosts[index].id.toString()),
                            title: Text(
                              samplePosts[index].body,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
    }}