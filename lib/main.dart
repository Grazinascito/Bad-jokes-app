import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var listOfjokes = [
    {
      "question": "What kind of streets do ghosts haunt?",
      "answer": "Dead ends!"
    },
    {"question": "What kind of dogs love car racing?", "answer": " Lap dogs!"},
    {
      "question": "What do you call birds who stick together?",
      "answer": "Vel-crows"
    },
    {
      "question": "What happens when a frog's car breaks down? ",
      "answer": "It gets toad!"
    },
  ];

  var jokesIndex = 0;

  changeDirection(String direction) {
    if (direction == "next") {
      if (jokesIndex != listOfjokes.length - 1) {
        setState(() {
          jokesIndex++;
        });
      } else {
        jokesIndex = 0;
      }
    } else if (direction == "prev") {
      if (jokesIndex != 0) {
      setState(() {
        jokesIndex--;
      });
      }else{
        jokesIndex = listOfjokes.length - 1;
      }
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Text(
                  listOfjokes[jokesIndex]["question"] as String,
                  style: const TextStyle(
                    fontSize: 27.5,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Color.fromRGBO(131, 9, 209, 0.5),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 25),
                child: Text(
                  listOfjokes[jokesIndex]["answer"] as String,
                  style: const TextStyle(
                    fontSize: 22.5,
                    backgroundColor: Color.fromRGBO(131, 9, 209, 0.1),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                    child: FloatingActionButton(
                      onPressed: () {
                        changeDirection("prev");
                      },
                      child: const Icon(
                        Icons.arrow_left_rounded,
                        size: 50,
                      ),
                      backgroundColor: Colors.purple,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: FloatingActionButton(
                        onPressed: () {
                          changeDirection("next");
                        },
                        child: const Icon(Icons.arrow_right_rounded, size: 50),
                        backgroundColor: Colors.purple,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
