// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// -------------------

// -----------------------------
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        dialogTheme: DialogThemeData(backgroundColor: Colors.blue),
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
    // if (gameOver) return;
    // if (values[index] != "") return;
    setState(() {
      if (values[index] == "") {
        values[index] = isTurn ? "X" : "O";
        isTurn = !isTurn;

        if ((values[0] == values[1] &&
                values[1] == values[2] &&
                values[0] != "") ||
            (values[3] == values[4] &&
                values[4] == values[5] &&
                values[3] != "") ||
            (values[6] == values[7] &&
                values[7] == values[8] &&
                values[6] != "")) {
          result("${values[index]} wins!");
        } else if ((values[0] == values[3] &&
                values[3] == values[6] &&
                values[0] != "") ||
            (values[1] == values[4] &&
                values[4] == values[7] &&
                values[1] != "") ||
            (values[2] == values[5] &&
                values[5] == values[8] &&
                values[2] != "")) {
          result("${values[index]} wins!");
        } else if ((values[0] == values[4] &&
                values[4] == values[8] &&
                values[0] != "") ||
            (values[2] == values[4] &&
                values[4] == values[6] &&
                values[2] != "")) {
          result("${values[index]} wins!");
        } else {
          if (!values.contains("")) {
            result("It's a draw!");
          }
        }
      }
    });
  }

  //  result(String message) {
  //   gameOver = true;
  //   print("Game Over: $message") ;
  //   // resetGame();
  //   return;
  // }
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
            child: Text("Play Again"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Exit"),
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
        // primarySwatch: Colors.blue,
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        scaffoldBackgroundColor: Colors.lightBlue[50],

        // iconTheme: IconThemeData(color: Colors.black),
        appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue),
      ),
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.lightBlue,
          title: Text("Tic-Tac-Toe"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 100.0, right: 100.0),
          child: TextButton(
            
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Color.fromARGB(255, 150, 202, 244),
              ), // Set the desired background color
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
                        offset: Offset(3, 0),
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