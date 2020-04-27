import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final String foodPrice;

  const DetailsPage({Key key, this.heroTag, this.foodName, this.foodPrice});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String selectedCard = 'WEIGHT';
  int count = 1;
  double sum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Details",
          style: TextStyle(
              fontSize: 22,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82,
                color: Colors.transparent,
              ),
              Positioned(
                top: 80,
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                ),
              ),
              Positioned(
                top: 15,
                left: (MediaQuery.of(context).size.width / 2) - 105,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    height: 220,
                    width: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.heroTag),
                    )),
                  ),
                ),
              ),
              Positioned(
                top: 240,
                left: 25,
                right: 25,
                child: Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.foodName,
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.foodPrice,
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.normal,
                                fontSize: 22),
                          ),
                          VerticalDivider(
                            width: 2,
                            color: Colors.black54,
                          ),
                          Container(
                            width: 125,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFF7A9BEE).withOpacity(0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (count > 0) count--;
                                    });
                                  },
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  count.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat",
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.add,
                                          color: Color(0xFF7A9BEE)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildInfoCard('WEIGHT', '300', 'G'),
                            SizedBox(width: 10),
                            buildInfoCard('CALAROIES', '300', 'G'),
                            SizedBox(width: 10),
                            buildInfoCard('VITAMINS', 'A,B6', 'VIT'),
                            SizedBox(width: 10),
                            buildInfoCard('AVAIL', 'NO', 'AV'),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(40),
                              ),
                              color: Color(0xFF1C1428).withOpacity(0.9)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.arrow_forward_ios,
                                        color: Colors.white.withOpacity(0.4)),
                                    Icon(Icons.arrow_forward_ios,
                                        color: Colors.white.withOpacity(0.7)),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ],
                                ),
                                Text(
                                  widget.foodPrice,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                      fontSize: 25),
                                ),
                                Text("")
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        height: 100,
        width: 100,
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: selectedCard == cardTitle ? Color(0xFF7A9BEE) : Colors.white,
            border: Border.all(
              style: BorderStyle.solid,
              width: 0.75,
              color: selectedCard == cardTitle
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.3),
            )),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardTitle,
                style: TextStyle(
                    color: selectedCard == cardTitle
                        ? Colors.white
                        : Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                    fontSize: 15),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: info,
                    style: TextStyle(
                        color: selectedCard == cardTitle
                            ? Colors.white
                            : Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                        fontSize: 15),
                  ),
                  TextSpan(
                    text: "\n" + unit,
                    style: TextStyle(
                        color: selectedCard == cardTitle
                            ? Colors.white
                            : Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                        fontSize: 15),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  selectCard(String cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
