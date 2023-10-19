import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String title;
  final String summary;
  final String uid;
  // final String username;
  final String postId;
  final datePublished;

  const Post({
    required this.title,
    required this.summary,
    required this.uid,
    // required this.username,
    required this.postId,
    required this.datePublished,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': summary,
        'uid': uid,
        // 'username': username,
        'postId': postId,
        'datePublished': datePublished,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      title: snapshot['title'],
      summary: snapshot['work'],
      uid: snapshot['uid'],
      // username: snapshot['username'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
    );
  }
}
