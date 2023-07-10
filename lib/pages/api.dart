import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_indraco/model/user_album.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  //list
  List<UserAlbum> useralbum = [];
  //mehtod
  Future<List<UserAlbum>> getAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        UserAlbum album = UserAlbum(
            albumId: i['albumId'],
            id: i['id'],
            title: i['title'],
            url: i['url'],
            thumbnailUrl: i['thumbnailUrl']);
        useralbum.add(album);
      }
      return useralbum;
    } else {
      return useralbum;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Get Data From API',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getAlbum(),
                  builder: (context, AsyncSnapshot<List<UserAlbum>> snapshot) {
                    return ListView.builder(
                        itemCount: useralbum.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.list),
                            title: Text(snapshot.data![index].title.toString()),
                            subtitle:
                                Text(snapshot.data![index].url.toString()),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
      
    );
  }
}
