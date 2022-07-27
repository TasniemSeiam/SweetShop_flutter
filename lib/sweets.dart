import 'package:flutter/material.dart';

class SlideItems {
  final AssetImage image;
  final String name;

  SlideItems({required this.image, required this.name});
}

class PageContent {
  final String name;
  final AssetImage image;
  final String price;

  PageContent({required this.name, required this.image, required this.price});
}

class sweets extends StatefulWidget {
  @override
  State<sweets> createState() => _sweetsState();
}

class _sweetsState extends State<sweets> {
  // const sweets({Key? key}) : super(key: key);
  bool fav = false;
  int indexes = 0;

  List<SlideItems> bestseller = [
    SlideItems(
        image: AssetImage("assets/images/icecreems.jpg"), name: "Ice-Cream"),
    SlideItems(
        image: AssetImage("assets/images/cheese.jpg"), name: "Cheesecake"),
    SlideItems(
        image: AssetImage("assets/images/chockcasck.jpg"), name: "Brownies"),
  ];
  List<PageContent> page = [
    PageContent(
        name: "Cup Cake",
        image: AssetImage("assets/images/s.jpg"),
        price: "45"),
    PageContent(
        name: "Ice-Cream",
        image: AssetImage("assets/images/icecreems.jpg"),
        price: "20"),
    PageContent(
        name: "Donuts",
        image: AssetImage("assets/images/pexels-cottonbro-4686958.jpg"),
        price: "30"),
    PageContent(
        name: "Petifours",
        image: AssetImage("assets/images/11.jpg"),
        price: "40"),
  ];
  List<PageContent> page2 = [
    PageContent(
        name: "Cookis",
        image: AssetImage("assets/images/cookis.jpg"),
        price: "10"),
    PageContent(
        name: "Cheesecake",
        image: AssetImage("assets/images/cheesecake.jpg"),
        price: "55"),
    PageContent(
        name: "Brownies",
        image: AssetImage("assets/images/chockcasck.jpg"),
        price: "35"),
    PageContent(
        name: "Lemon Cake",
        image: AssetImage("assets/images/lemoncak.jpg"),
        price: "100"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),

          /// start page ///
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///search///
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: " Search ",
                  fillColor: Color(0x1d5f5e5e),
                  filled: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Best Sellers",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              ////////////////////Slider//////////
              Container(
                height: 300,
                child: ListView.separated(
                  itemBuilder: (context, index) => buildSlid(
                    slide: bestseller[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 7,
                  ),
                  itemCount: bestseller.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),

              ///////////////////////////////////////////////////////////

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan[100],
                        borderRadius: BorderRadius.circular(5)),
                    width: 50,
                    height: 2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                    itemBuilder: (context, index) => buildPageContent(
                        pagecontent: page[index], pagecontne2: page2[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                    itemCount: page.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSlid({required SlideItems slide}) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            width: 300,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffe5e5e5),
                  offset: const Offset(
                    0.0,
                    2.0,
                  ),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Image(
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        image: slide.image,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          top: 5,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFCE4EC),
                          radius: 20,
                          child: Text(
                            "+20",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 9,
                  ),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                slide.name,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "best seller",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  fav = !fav;
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: fav
                                      ? Colors.pink[500]
                                      : Color(0xcb5f5e5e),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ], //children row repeat
    );
  }

  //
  Widget buildPageContent(
      {required PageContent pagecontent, required PageContent pagecontne2}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffbae1ff),
                    offset: const Offset(
                      0.0,
                      2.0,
                    ),
                    blurRadius: 3.0,
                    spreadRadius: 0.0,
                  ),
                ],


              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Image(
                          image: pagecontent.image,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        CircleAvatar(radius: 13,backgroundColor: Colors.cyan[300],
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Text(
                          pagecontent.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          pagecontent.price,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffbae1ff),
                    offset: const Offset(
                      0.0,
                      2.0,
                    ),
                    blurRadius: 3.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Image(
                          image: pagecontne2.image,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        CircleAvatar(radius: 13,backgroundColor: Colors.cyan[300],
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          pagecontne2.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          pagecontne2.price,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
