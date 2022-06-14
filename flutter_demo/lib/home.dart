import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_demo/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  dynamic logInAs;
  dynamic nationDataJson = {"electors": []};

  Future<String> loadJsonData() async {
    // mock function for data loading
    var jsonText = await rootBundle.loadString('assets/HRE.json');
    setState(() => nationDataJson = json.decode(jsonText));
    return 'ok';
  }

  @override
  void initState() {
    // before rendering initiating
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffcc00),
      appBar: AppBar(
        backgroundColor: const Color(0xffffcc00),
        elevation: 0,
        title: IconButton(
          icon: const Icon(Icons.volume_up),
          tooltip: 'Voice',
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The Holy Roman Empire',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "Imperial Diet",
              style: Theme.of(context).textTheme.headline4,
            ),
            const Image(
              image: NetworkImage(
                  // svg image may not work in this way
                  'https://eu4.paradoxwikis.com/images/thumb/e/ee/Holy_Roman_Empire.png/330px-Holy_Roman_Empire.png'),
            ),
            const Text(
              'Log In As',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            DropdownButton<dynamic>(
              value: logInAs,
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              onChanged: (dynamic newValue) {
                setState(() {
                  logInAs = newValue;
                });
              },
              items: nationDataJson["electors"]
                  .map<DropdownMenuItem<dynamic>>((dynamic value) {
                return DropdownMenuItem<dynamic>(
                  value: value,
                  child: Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image(
                          width: 30,
                          image: AssetImage(
                              "assets/images/" + value["tag"] + ".png")),
                    ),
                    Text(
                      value["name"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            // Other button type include TextButton and OutlinedButton
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Welcome, " +
                          logInAs["government_rank"] +
                          " of " +
                          logInAs["name"])));
                  Timer(const Duration(seconds: 2), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // route to specfic page with required parameters
                        builder: (context) => DashboardPage(
                          data: nationDataJson,
                          logInAs: logInAs,
                        ),
                      ),
                    );
                  });
                },
                child: SizedBox(
                  width: 82,
                  child: Row(
                    children: const [
                      Text(
                        "CONTINUE",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Copyreich 1453 Byzantine",
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 105, 105, 105)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
