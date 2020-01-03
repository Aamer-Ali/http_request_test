import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:http_request_test/http_library.dart';
import 'package:http_request_test/post_data.dart';
import 'dart:convert';

import 'package:http_request_test/state_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//class _MyHomePageState extends State<MyHomePage> {
////  String url = "https://jsonplaceholder.typicode.com/posts";
//  String url = "https://callme.co.in/webservices_v6/statelis?key=773d97b801a11b4d4221881a84d7de66&countryno=99&format=json";
//
//  Future<String> makeRequest() async {
//    var response = await http.get(Uri.encodeFull(url));
////    print(response.body);
//    if(response.statusCode == 200)
//      {
//        var extractData = jsonDecode(response.body);
//        List data;
//        data = extractData['statelist'];
//        print(data[0]['error']['iserror']);
//        if(data[0]['error']['iserror'] == 'N')
//        {
//          for(var i=1; i< data.length;i++)
//            print(data[i]['record']['statename']);
//        }
//      }
//    else if(response.statusCode == 404){
//      print('Server Not found please try later');
//    }
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    makeRequest();
//    return Scaffold(
//      appBar: AppBar(title: Text('Http Reqesy'),),
//      body: Container(
//      ),
//    );
//  }
//}

class _MyHomePageState extends State<MyHomePage> {
//  String url = "https://jsonplaceholder.typicode.com/posts";

  String urlPost = "https://mytechhuntapp.herokuapp.com/api/auth/login/";

  String url = "${HttpLibrary.baseUrl}${HttpLibrary.urlStateList}";

  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url));

    var bodyData = {'username': 'SdAamer', 'password': 'A@asdf1234'};
    var res = await http
        .post(Uri.encodeFull(urlPost), body: jsonEncode(bodyData), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });
    print(res.statusCode);
    if (res.statusCode == 200) {
      print('Login Successfull');
    } else if (res.statusCode == 404) {
      print('plesae check user name and password');
    } else if (res.statusCode == 400) {
      print('not Found');
    } else {
      print('Oppppsss');
    }

//    if (response.statusCode == 200) {
//      print(jsonDecode(response.body));
//      var mData = StateList.fromJson(jsonDecode(response.body));
//      for (var i = 1; i < mData.statelist.length; i++) {
//        print(mData.statelist[i].record.statename);
//      }
//    } else if (response.statusCode == 404) {
//      print('Server Not found please try later');
//    }
  }

  @override
  Widget build(BuildContext context) {
    makeRequest();
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Reqesy'),
      ),
      body: Container(),
    );
  }
}
