
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        dialogTheme: DialogThemeData(backgroundColor: Colors.lightBlueAccent),
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> values = ["", "", "", "", "", "", "", "", ""];
  bool isTurn = true;

  bool gameOver = false;

  void handleTap(int index) {
    print(index);
   
    setState(() {
      if (values[index] == "") {
        values[index] = isTurn ? "X" : "O";
        isTurn = !isTurn;

        if ((values[0] == values[1] && values[1] == values[2] && values[0] != "") ||
            (values[3] == values[4] && values[4] == values[5] && values[3] != "") ||
            (values[6] == values[7] && values[7] == values[8] && values[6] != "")) {
          result("${values[index]} wins!");
        } else if ((values[0] == values[3] &&values[3] == values[6] &&values[0] != "") ||
            (values[1] == values[4] && values[4] == values[7] && values[1] != "") ||
            (values[2] == values[5] && values[5] == values[8] && values[2] != "")) {
          result("${values[index]} wins!");
        } else if ((values[0] == values[4] && values[4] == values[8] &&values[0] != "") ||
            (values[2] == values[4] && values[4] == values[6] && values[2] != "")) {
          result("${values[index]} wins!");
        } else {
          if (!values.contains("")) {
            result("It's a draw!");
          }
        }
      }
    });
  }

  result(String message) {
    gameOver = true;

    print("Game Over: $message");
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Game Over"),
        content: Text(
          message,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetGame();
            },
            child: Text("Play Again",style: TextStyle(color: Colors.white),),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Exit",style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
    );
  }

  void resetGame() {
    setState(() {
      values = ["", "", "", "", "", "", "", "", ""];
      isTurn = true;
      gameOver = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic tac toe",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        scaffoldBackgroundColor: Colors.lightBlue[50],

        appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tic-Tac-Toe"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 100.0, right: 100.0),
          child: TextButton(
            
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Color.fromARGB(255, 150, 202, 244),
              ),
            ),
            onPressed: () {
              resetGame();
            },
            child: Text(
              "Clear",
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(120.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              // childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // print("yes");

                  if (!gameOver) {
                    handleTap(index);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlueAccent,
                        blurRadius: 2,
                        spreadRadius: 3,
                        offset: Offset(5, 3),
                      ),
                    ],
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(14.0),
                  ),

                  child: Center(
                    child: Text(
                      values[index],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 9,
          ),
        ),
      ),
    );
  }
}
//  GridView.count(
//           crossAxisCount: 3,
//           crossAxisSpacing: 15,
//           mainAxisSpacing: 15,
//           children: [Container(
//             color: Colors.lightBlueAccent,
//           ),
//           Container(
//             color: Colors.lightBlueAccent,
//           ),
//           Container(
//             color: Colors.lightBlueAccent,
//           ),
//           Container(
//             color: Colors.lightBlueAccent,
//           ),
//           Container(
//             color: Colors.lightBlueAccent,
//           ),
//           Container(
//             color: Colors.lightBlueAccent,
//           ),
//           Container(
//             color: Colors.lightBlueAccent,
//           ),
//           Container(
//             color: Colors.lightBlueAccent,
//           ),
//           Container(
//             color: Colors.lightBlueAccent,
//           ),
//           ]
//         ),