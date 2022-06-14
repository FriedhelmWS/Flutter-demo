import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.data, required this.logInAs})
      : super(key: key);

  final dynamic data;
  final dynamic logInAs;

  @override
  State<DashboardPage> createState() => DashboardState();
}

class DashboardState extends State<DashboardPage> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // These can get the current device's size and use for responsiveness
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> widgetOptions = <Widget>[
      //first page (Diet)
      Column(children: [
        const Text(
          "Emperor",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Image(width: 50, image: AssetImage("assets/images/HAB.png")),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Archduchy of Austria",
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  "Austria erit in orbe ultima",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const Image(width: 50, image: AssetImage("assets/images/HLR.png")),
          ],
        ),
        const Text(
          "Imperial Diet",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: width - 40,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            image: const DecorationImage(
              opacity: 0.3,
              image: NetworkImage("https://i.redd.it/te1rbi0slgg21.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
              child: Text(
            "No Current Incidents",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
        ),
        const Text(
          "Past Major Events",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(width: 12, image: AssetImage("assets/images/CAS.png")),
            const Text(
              "Union of Castile and Aragon!",
              style: TextStyle(fontSize: 12),
            ),
            InkWell(
                child: const Text(
                  "learn more...",
                  style: TextStyle(fontSize: 12),
                ),
                onTap: () => launch(
                    'https://en.wikipedia.org/wiki/Kingdom_of_Castile#Union_of_the_Crowns_of_Castile_and_Aragon')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(width: 12, image: AssetImage("assets/images/BUR.png")),
            const Text(
              "Burgundy Succession Crisis!  ",
              style: TextStyle(fontSize: 12),
            ),
            InkWell(
                child: const Text(
                  "learn more...",
                  style: TextStyle(fontSize: 12),
                ),
                onTap: () => launch(
                    'https://en.wikipedia.org/wiki/Charles_the_Bold#Legacy')),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Electors",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.data["electors"].length,
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image(
                      width: 40,
                      image: AssetImage("assets/images/" +
                          widget.data["electors"][index]["tag"] +
                          ".png")),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data["electors"][index]["name"],
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        widget.data["electors"][index]["description"],
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            const Text("They vote",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            const SizedBox(
                              height: 1,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Image(
                                  width: 40,
                                  image: AssetImage("assets/images/" +
                                      widget.data["electors"][index]["vote"] +
                                      ".png")),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
          },
        ),
      ]),

      //Second page (Free cities)
      Column(
        children: [
          const Text(
            "Imperial Free Cities",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                backgroundColor: Color(0xffffcc00)),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: widget.data["free_cities"].length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Image(
                            width: 40,
                            image: AssetImage("assets/images/" +
                                widget.data["free_cities"][index]["tag"] +
                                ".png"))),
                    Text(
                      widget.data["free_cities"][index]["name"].toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
          Card(
            child: SizedBox(
              width: width - 8,
              height: 40,
              child: const Center(
                child: Text("Manage"),
              ),
            ),
          )
        ],
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Romanum Imperium'),
      ),
      //passing in the ListView.builder
      body: SingleChildScrollView(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      backgroundColor: const Color(0xfff0f0f0),
      // bottomNavigationBar use together with widgetOptions
      bottomNavigationBar: BottomNavigationBar(
        //In this way, it can provide multiple "screens" on the same page
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Diet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Free Cities',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
    );
  }
}
