import 'dart:convert';
import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_request_test/http_library.dart';
import 'package:http_request_test/model/post_data.dart';

class PostList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PostListState();
  }
}

class PostListState extends State<PostList> {
  String url = "${HttpLibrary.myBaseUrl}${HttpLibrary.urlAllPostsList}";
  List<PostData> itemsList = List();

  Future<PostData> _getAllPostData() async {
    var response = await http.get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      itemsList = List<PostData>.from(mData.map((i) => PostData.fromJson(i)));
    } else if (response.statusCode == 404) {
      print('Server Not found please try later');
    }
  }

  @override
  Widget build(BuildContext context) {
//    _getAllPostData();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Posts'),
      ),
      body: itemsList.length == null
          ? Text('Heloo')
          : FutureBuilder<PostData>(
              future: _getAllPostData(),
              builder:
                  (BuildContext context, AsyncSnapshot<PostData> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: itemsList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: <Widget>[
                            CircularProfileAvatar(
                              itemsList[index].profile,
                              radius: 30,
                              borderWidth: 2,
                              borderColor: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(itemsList[index].title),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
    );
  }
}

//ListView.builder(
//itemCount: itemsList.length,
//itemBuilder: (context, index) {
//return Card(
//child: Text(itemsList[index].title),
//);
//}),

//Image.network(
//itemsList[index].profile,
//width: 50,
//height: 50,
//),
