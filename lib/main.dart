import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:http_request_test/screens/home_page.dart';
import 'package:http_request_test/http_library.dart';
import 'package:http_request_test/model/post_data.dart';
import 'dart:convert';

import 'package:http_request_test/model/state_list.dart';
import 'package:http_request_test/screens/post_list.dart';
import 'package:http_request_test/screens/post_list_with_filter.dart';
import 'package:http_request_test/widgets/user_login_input.dart';

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

