import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http_request_test/model/post_data.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class PostDetails extends StatefulWidget {
  @override
  PostData post;

  PostDetails(this.post);

  _PostDetailsState createState() => _PostDetailsState(post);
}

class _PostDetailsState extends State<PostDetails> {
  PostData post;
  String title, content, author;

  _PostDetailsState(this.post) {
    List<int> authorBytes = (post.author).toString().codeUnits;
    author = utf8.decode(authorBytes);

    List<int> titleBytes = (post.title).toString().codeUnits;
    title = utf8.decode(titleBytes);

    List<int> contentBytes = (post.content).toString().codeUnits;
    content = utf8.decode(contentBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        width: double.infinity,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Author : ${author}',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(title),
              SizedBox(height: 10),
              Text(content),
            ],
          ),
        ),
      ),
    );
  }
}
