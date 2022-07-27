import 'package:flutter/material.dart';

class Comment {
  final String comment;
  final AssetImage image;
  final String name;

  Comment({required this.comment, required this.image, required this.name});
}

class Comments extends StatelessWidget {
  List<Comment> coments = [
    Comment(
        comment: "I loved all the sweets here,they are all so delicious",
        image: AssetImage("assets/images/p1.jpg"),
        name: "Sanaa"),
    Comment(
        comment: "Thanks for your services",
        image: AssetImage("assets/images/pp1.jpg"),
        name: "Amira"),
    Comment(
        comment: "Lemon Cake is very delicious",
        image: AssetImage("assets/images/profile.jpg"),
        name: "Gamila"),
    Comment(
        comment: "The services and sweets are very good ",
        image: AssetImage("assets/images/d.jpg"),
        name: "Nada"),
    Comment(
        comment: "Thanks for everything",
        image: AssetImage("assets/images/p5.jpg"),
        name: "Mariam"),
    Comment(
        comment: "I recommended Ice-Cream and Cookis ",
        image: AssetImage("assets/images/p2.jpg"),
        name: "Donia"),

  ];

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal:11,),
          child: ListView.separated(
            itemBuilder: (context, index) => comments(comment: coments[index]),
            separatorBuilder: (context, index) => SizedBox(height: 10,),
            itemCount: coments.length,
          ),
        ),
      );
  }

  Widget comments({required Comment comment}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            // padding: EdgeInsets.all(10),
            height: 100,
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(45),
                    topLeft: Radius.circular(45),
                ),
              boxShadow: [BoxShadow(
                color:Color(0xcbffcddc),
                offset: Offset(1,1),
                blurRadius: 3,
                spreadRadius: 1,
              ),],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                CircleAvatar(
                  radius: 23.0,
                  backgroundImage: comment.image,
                ),
                SizedBox(
                  width: 13,
                ),
                Padding(
                  padding:EdgeInsets.only(top:29),
                  child: Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          comment.comment,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
