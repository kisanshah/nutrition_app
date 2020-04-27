import 'package:flutter/material.dart';
import 'package:nutrition_app/detailsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                Container(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.filter_list),
                        onPressed: () {},
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.menu),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Healthy",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                TextSpan(
                    text: " Food",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ]),
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300,
                    child: ListView(
                      children: [
                        buildFoodItem(
                            'assets/plate1.png', 'Salmon Bowl', '\$24.00'),
                        buildFoodItem(
                            'assets/plate2.png', 'Salmon Bowl', '\$22.0'),
                        buildFoodItem(
                            'assets/plate3.png', 'Salmon Bowl', '\$54.0'),
                        buildFoodItem(
                            'assets/plate4.png', 'Salmon Bowl', '\$99.0'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 65.0,
                        width: 65.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 2.0)),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: Color(0xFF1C1428),
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 65.0,
                        child: Center(
                          child: Icon(
                            Icons.shopping_basket,
                            size: 30,
                            color: Color(0xFF1C1428),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 2.0)),
                      ),
                      Container(
                        height: 65.0,
                        width: 130.0,
                        child: Center(
                            child: Text(
                          "Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 17),
                        )),
                        decoration: BoxDecoration(
                            color: Color(0xFF1C1428),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFoodItem(String imagePath, String foodName, String price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: 100,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        foodName: foodName,
                        foodPrice: price,
                        heroTag: imagePath,
                      )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: imagePath,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: foodName,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 23)),
                TextSpan(
                    text: "\n" + price,
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Montserrat',
                        fontSize: 20)),
              ]),
            ),
            IconButton(
              iconSize: 30.0,
              color: Colors.black54,
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
