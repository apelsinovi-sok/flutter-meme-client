import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .whenComplete(() => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scene();
  }
}

class Scene extends StatefulWidget {
  const Scene({Key? key}) : super(key: key);

  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  int myCardsCount = 5;
  int tableCardsCount = 0;
  var startGame = true;
  List<int> myCardsList = [];
  List<int> tableCardsList = [];
  List<String> playerNames = [];
  int? walkingPlayer;
  int? master;

  @override
  Widget build(BuildContext context) {
    if (startGame == true) {
      factoryCard();
      startGame = false;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: const Color(0xFF767676),
                ),
                flex: 3,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: const Color(0xFF686868),
                    )),
                    Expanded(
                      child: Container(
                        color: const Color(0xFF808080),
                      ),
                      flex: 5,
                    ),
                    Expanded(child: Container(color: const Color(0xFF686868))),
                  ],
                ),
                flex: 4,
              ),
              Expanded(
                child: Container(
                  color: const Color(0xFFA8A8AC),
                ),
                flex: 3,
              ),
            ],
          ),

          //Карты игрока
          Align(
            alignment: FractionalOffset.bottomCenter,
              child: Visibility(
                visible: true,
                child: Container(
                  color: const Color(0xFF767676),
                  height: 180,
                  // alignment: FractionalOffset.bottomLeft,
                  // margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                        width: 600,
                        child: ListView.builder(
                            itemCount: myCardsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // print(myCardsList[index]);
                                  setState(() {
                                    var card = myCardsList.removeAt(index);
                                    tableCardsList.add(card);
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(9.0),
                                  child: Container(
                                    height: 140,
                                    width: 100,
                                    margin: const EdgeInsets.only(left: 17),
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(9.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/${myCardsList[index]}.png")),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          //Карточка ситуации
          Center(
            child: Visibility(
              visible: true,
              child: Container(
                height: 150,
                width: 300,
                color: const Color(0xFF4B4B4B),
                margin: const EdgeInsets.only(bottom: 110),
                child: Center(
                  child: Container(
                    margin:
                        const EdgeInsets.only(right: 10, left: 25, bottom: 70),
                    child: const Text(
                      "Ваша реакция когда вика взяла жука.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Выложенные карты
          Align(
            alignment: FractionalOffset.topCenter,
            child: Container(
              // color: Colors.deepPurple,
              width: 600,
              height: 180,
              // color: Colors.deepPurple,
              margin: const EdgeInsets.only(top: 45),
              child: ListView.builder(
                  itemCount: tableCardsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(9.0),
                      child: Container(
                        height: 140,
                        width: 100,
                        margin: const EdgeInsets.only(left: 17),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(9.0),
                          image: DecorationImage(
                              image: AssetImage(
                                  "images/${tableCardsList[index]}.png")),
                        ),
                      ),
                    );
                  }),
            ),
          ),

          //Кнопка
          Align(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  factoryCard();
                });
              },
              child: const Text("Random"),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(24),
                  primary: const Color(0xFF680B15)),
            ),
          ),
        ],
      )),
    );
  }

  factoryCard() async {
    tableCardsList = [];
    myCardsList = [];
    List<int> list = [0, 1, 2, 3, 4, 5, 6];
    list.shuffle();
    for (int i = 0; i < 5; i++) {
      myCardsList.add(list[i]);
    }
  }
}
