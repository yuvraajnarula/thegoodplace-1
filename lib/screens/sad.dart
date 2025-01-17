import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import 'package:bubble/bubble.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:thegoodplace/loaders/creating.dart';

class SadPage extends StatefulWidget {
  @override
  _SadPageState createState() => _SadPageState();
}

final random = Random();

class _SadPageState extends State<SadPage> {
  final _database = FirebaseFirestore.instance;
  String advicetoshow = "";
  bool loading = false;
  Future<String> getDocuments() async {
    var advices = ['Tomorrow is a new day'];
    setState(() {
      loading = true;
    });
    final snapshot = await _database
        .collection('happyppl')
        .get()
        .then((value) => value.docs.forEach((element) {
              advices.add(element['advicetosad'].toString());
            }))
        .then((value) {
      setState(() {
        loading = false;
      });
      int range = advices.length;
      int advicenumber = random.nextInt(range);
      setState(() {
        advicetoshow = advices[advicenumber];
      });
    });
  }

  @override
  void initState() {
    getDocuments();
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding.top;
    return loading
        ? CreatingLoader()
        : Scaffold(
            body: Container(
              padding: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  HexColor('#a870e0'),
                  HexColor('#8e53c9'),
                  HexColor('#c953c1'),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Here are somethings to make you feel better",
                      style: TextStyle(
                        fontFamily: 'Nunito-Sans',
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    Divider(
                      thickness: 2.5,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Here's some advice!",
                      style: TextStyle(
                        fontFamily: 'Nunito-Sans',
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Bubble(
                      showNip: true,
                      child: Text(advicetoshow),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Wanna play some games ?",
                      style: TextStyle(
                        fontFamily: 'Nunito-Sans',
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      thickness: 2.5,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Column(children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          height: 200.0,
                          // autoPlay: true,
                          autoPlayInterval: Duration(seconds: 10),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          aspectRatio: 2.0,
                        ),
                        items: [
                          Item1(),
                          Item2(),
                          Item3(),
                          Item4(),
                        ],
                      ),
                    ]),
                    Divider(
                      thickness: 2.5,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Here are Some Spotify Playlists for you',
                      style: TextStyle(
                        fontFamily: 'Nunito-Sans',
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            launch(
                                "https://open.spotify.com/playlist/37i9dQZF1DX2x1COalpsUi?si=l2YhxwjDS9S_gQRb5COMfA&utm_source=whatsapp");
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Image(
                                  height: 55.0,
                                  width: 55.0,
                                  image: AssetImage(
                                      "assets/images/happyohappy.jpg"),
                                ),
                                SizedBox(
                                  width: 7.5,
                                ),
                                Text(
                                  'Happy-O-Happy',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'OpenSans-Condensed',
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.0,
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                          width: 10.0,
                        ),
                        SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            launch(
                                "https://open.spotify.com/playlist/37i9dQZF1DX3YSRoSdA634?si=YOfeECGmRTCy8JSHGu9GGg&utm_source=copy-link");
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Image(
                                  height: 55.0,
                                  width: 55.0,
                                  image:
                                      AssetImage("assets/images/lifesucks.jpg"),
                                ),
                                SizedBox(
                                  width: 7.0,
                                ),
                                Text('Life Sucks',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'OpenSans-Condensed',
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  height: 2.0,
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            launch(
                                "https://open.spotify.com/playlist/37i9dQZF1DX6xZZEgC9Ubl?si=JNhizU_yQcCj5M6CBmsxXw&utm_source=copy-link&nd=1");
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Image(
                                  height: 55.0,
                                  width: 55.0,
                                  image: AssetImage(
                                      "assets/images/teardrop.jpg"),
                                ),
                                SizedBox(
                                  width: 7.0,
                                ),
                                Text('Tear Drop',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'OpenSans-Condensed',
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  height: 2.0,
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 200,
      padding: new EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.games, size: 40),
              title: Text('Audiosurf', style: TextStyle(fontSize: 20.0)),
              subtitle: Text('Audiosurf is a music-adapting puzzle racer where you use your own music to create your own experience',
                  style: TextStyle(fontSize: 8.0)),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: const Text(
                    'Link',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  onPressed: () {
                    launch('https://store.steampowered.com/app/12900/AudioSurf/'),
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 200,
      padding: new EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.games, size: 40),
              title: Text('World Of Goo', style: TextStyle(fontSize: 20.0)),
              subtitle: Text('World of Goo is a puzzle video game developed and published by independent game developer 2D Boy.',
                  style: TextStyle(fontSize:8.0)),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: const Text(
                    'Link',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  onPressed: () {
                    launch('https://play.google.com/store/apps/details?id=com.twodboy.worldofgoofull&hl=en_IN&gl=US'),
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 200,
      padding: new EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.games, size: 40),
              title: Text('Botanicula', style: TextStyle(fontSize: 20.0)),
              subtitle: Text('Botanicula is a point-and-click adventure game developed by Amanita Design',
                  style: TextStyle(fontSize: 8.0)),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: const Text(
                    'Link',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  onPressed: () {
                    launch('https://play.google.com/store/apps/details?id=air.com.amanitadesign.botanicula&hl=en_IN&gl=US'),
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class Item4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 200,
      padding: new EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.games, size: 40),
              title: Text("Recettear: An Item Shop's Tale", style: TextStyle(fontSize: 20.0)),
              subtitle: Text('Recettear: An Item Shop’s Tale is a role-playing game developed by Japanese dōjin maker EasyGameStation . ',
                  style: TextStyle(fontSize: 8.0)),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: const Text(
                    'Link',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  onPressed: () {
                    launch('https://store.steampowered.com/app/70400/Recettear_An_Item_Shops_Tale/'),
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

