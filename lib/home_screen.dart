import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 25.0),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: Image.network(
                          'https://www.kindpng.com/picc/m/11-114834_youtube-transparent-icon-circle-logos-png-youtube-transparent.png'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'MOST POPULAR',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text('Basic Plane',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Good for start', style: TextStyle(fontSize: 15)),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text('3',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 20),
                    Text('All resturants more then 1.0 km',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('2',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Offers when you do not get order',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text('\$39.99',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Text(' / month',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Choes Basic',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('More 15 delivery in day',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Recive bag form our office',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Recive bag form our office',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Recive bag form our office',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Recive bag form our office',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(Icons.navigate_next_sharp,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 25.0),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      child: Image.network(
                          'https://www.kindpng.com/picc/m/11-114834_youtube-transparent-icon-circle-logos-png-youtube-transparent.png'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'MOST POPULAR',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text('Advanced Plane',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Good for start', style: TextStyle(fontSize: 15)),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text('3',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 20),
                    Text('All resturants more then 1.0 km',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('2',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 10),
                    Text('Offers when you do not get order',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text('\$39.99',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Text(' / month',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Choes Basic',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('More 15 delivery in day',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Recive bag form our office',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Recive bag form our office',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Recive bag form our office',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Recive bag form our office',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(Icons.navigate_next_sharp,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
