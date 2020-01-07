//class PostData {
//  int userId;
//  int id;
//  String title;
//  String body;
//
//  PostData({this.userId, this.id, this.title, this.body});
//
//  PostData.fromJson(Map<String, dynamic> json){
//    userId = json['userId'];
//    id = json['id'];
//    title = json['title'];
//    body = json['body'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['userId'] = this.userId;
//    data['id'] = this.id;
//    data['title'] = this.title;
//    data['body'] = this.body;
//    return data;
//  }
//}

class PostData {
  String title;
  String content;
  String datePosted;
  String author;
  String profile;

  PostData(
      {this.title, this.content, this.datePosted, this.author, this.profile});

  PostData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    datePosted = json['date_posted'];
    author = json['author'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['date_posted'] = this.datePosted;
    data['author'] = this.author;
    data['profile'] = this.profile;
    return data;
  }
}
