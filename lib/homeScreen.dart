import 'package:flutter/material.dart';
import 'package:sweets/comments.dart';
import 'package:sweets/signUp.dart';
import 'package:sweets/sweets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexes=0;
  List<Widget> screens =[
    sweets(),
    Comments(),
    SignUp(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Color(0xff5f5e5e),
        ),
        title: Text(
          "Sweet Shop",
          style:
          TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.pink[300]),
        ),
        elevation: 5.3,
        shadowColor: Color(0x2ffeeeee),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.local_grocery_store_outlined,
                  color: Color(0xff5f5e5e),
                ),
              )),
        ],
      ),
      body:screens[indexes] ,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexes,
          onTap: (index) {
            setState(() {
              indexes = index;
            });
          },
          unselectedLabelStyle:TextStyle(color: Color(0xfff06292), fontSize: 14),
          backgroundColor: Colors.white,
          fixedColor: Colors.pink[300],
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
            BottomNavigationBarItem(icon: Icon(Icons.comment_outlined), label: "comments"),
            BottomNavigationBarItem(icon: Icon(Icons.login), label: "login"),
          ]),

    );
  }
}
