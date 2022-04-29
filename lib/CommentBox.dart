import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
class commentBox extends StatefulWidget {
  const commentBox({Key? key}) : super(key: key);

  @override
  _commentBoxState createState() => _commentBoxState();
}

class _commentBoxState extends State<commentBox> {
  final TextEditingController commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List filedata = [
    {
      'name': 'Ayda Sameh',
      'pic': 'Assets/Ayda.jpeg',
      'message': 'Very cool'
    },
    {
      'name': 'Duha Mohsen',
      'pic': 'Assets/Duha.jpg',
      'message': 'Very cool'
    },
    {
      'name': 'Ayda Sameh',
      'pic': 'Assets/Ayda.jpeg',
      'message': 'Very cool'
    },
    {
      'name': 'Duha Mohsen',
      'pic': 'Assets/Duha.jpg',
      'message': 'Very cool'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: CommentBox(
      userImage: "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-11-avatar-2754576_120520.png" ,
      child: commentChild(filedata),
      labelText: 'Write a comment...',
      withBorder: false,
      errorText: 'Comment cannot be blank',
      sendButtonMethod: () {
        if (formKey.currentState!.validate()) {
          print(commentController.text);
          setState(() {
            var value = {
              'name': 'New User',
              'pic':'Assets/Duha.jpg',
              'message': commentController.text
            };
            filedata.insert(0, value);
          });
          commentController.clear();
          FocusScope.of(context).unfocus();
        } else {
          print("Not validated");
        }
      },
      formKey: formKey,
      commentController: commentController,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
    )));
  }
  @override
  Widget commentChild (data) {
    return  ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(filedata[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(filedata[i]['message']),
            ),
          )
      ],
    );
  }
}
