import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http_request_test/model/post_data.dart';
import 'package:http_request_test/screens/post_details.dart';
import 'package:http_request_test/services/get_post_service.dart';
import 'package:permissions_plugin/permissions_plugin.dart';

class PostListWithFilter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PostListWithFilterState();
  }
}

class PostListWithFilterState extends State<PostListWithFilter> {
  List<PostData> itemsList = List();
  List<PostData> filterdData = List();


  @override
  void initState() {
    super.initState();
    GetPostService.getAllPostData().then((usersFromServer) {
      setState(() {
        itemsList = usersFromServer;
        filterdData = itemsList;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Post'),
      ),
      body: itemsList.length == null
          ? CircularProgressIndicator()
          : Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'Seach by keyword',
                  ),
                  onChanged: (string) {
                    setState(() {
                      filterdData = itemsList
                          .where((u) => (u.title
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                          .toList();
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filterdData.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        actionPane: SlidableStrechActionPane(),
                        actions: <Widget>[
                          IconSlideAction(
                            foregroundColor: Colors.blue,
                            caption: 'Archive',
                            icon: Icons.archive,
                            onTap: () => print('Going to delete'),
                          ),
                        ],
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            foregroundColor: Colors.red,
                            caption: 'Delete',
                            icon: Icons.delete,
                            onTap: () => print('Going to delete'),
                          ),
                        ],
                        child: GestureDetector(
                          onTap: () {
                            print(
                                '${filterdData[index].author}\'s blog going to show');
                            navigateToDetailsPage(filterdData[index]);
                          },
                          child: Card(
                            child: Row(
                              children: <Widget>[
                                CircularProfileAvatar(
                                  filterdData[index].profile,
                                  radius: 30,
                                  borderWidth: 2,
                                  borderColor: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(filterdData[index].title),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  void navigateToDetailsPage(PostData post) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostDetails(post);
    }));
  }
}
