import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'CommentBox.dart';
void main() {
  runApp(const Comment());
}

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: commentBox(),
      debugShowCheckedModeBanner: false,
    );
  }
}