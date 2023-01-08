import 'package:flutter/material.dart';
import 'package:pollutionapp/Navigation_Pages/calendarPage/calendarPage.dart';
import 'package:pollutionapp/Navigation_Pages/homePage/homePage.dart';
import 'package:pollutionapp/Navigation_Pages/mapPage/mapPage.dart';
import 'package:pollutionapp/Navigation_Pages/Resources_subPages/resourcesPage.dart';
import 'package:pollutionapp/Navigation_Pages/servicesPage/servicesPage.dart';
import 'package:pollutionapp/drawerPages/my_drawer_header.dart';
import 'package:pollutionapp/drawerPages/aboutPage.dart';
import 'package:pollutionapp/drawerPages/feedbackPage.dart';
import 'package:pollutionapp/drawerPages/helpPage.dart';
import 'package:pollutionapp/drawerPages/profilePage.dart';
import 'package:pollutionapp/drawerPages/settingsPage.dart';
import 'package:pollutionapp/drawerPages/termsPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myAppPage(),
    );
  }
}

class myAppPage extends StatefulWidget {
  const myAppPage({Key? key}) : super(key: key);

  @override
  State<myAppPage> createState() => _myAppPageState();
}

class _myAppPageState extends State<myAppPage> {
  int _selectedIndex = 0;
  static final List<Widget> _navScreens = <Widget>[
    // HomeScreen(),
    homePage(),
    mapPage(),
    calendarPage(),
    resourcesPage(),
    servicesPage(),
  ];

  var currentPage = DrawerSections.manageProfile;

  final List<Widget> _children = [];
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.manageProfile) {
      container = profilePage();
    } else if (currentPage == DrawerSections.settings) {
      container = settingsPage();
    } else if (currentPage == DrawerSections.help) {
      container = helpPage();
    } else if (currentPage == DrawerSections.about) {
      container = aboutPage();
    } else if (currentPage == DrawerSections.terms_and_policy) {
      container = termsPage();
    } else if (currentPage == DrawerSections.feedback) {
      container = feedbackPage();
    }

    return Scaffold(
      // Top App Bar
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),

      body: Center(
        child: _navScreens.elementAt(_selectedIndex),
      ),

      // Bottom Navigation Bar

      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(16),
            gap: 5,
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.map, text: 'Map'),
              GButton(icon: Icons.calendar_today, text: 'Calendar'),
              GButton(icon: Icons.assignment, text: 'Resources'),
              GButton(icon: Icons.design_services, text: 'Services'),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(
                () {
                  _selectedIndex = index;
                },
              );
            },
          ),
        ),
      ),

      // Menu Draw

      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyHeaderDrawer(),
                myDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        //Shows the list of menu drawer
        children: [
          menuItem(1, "Profile", Icons.account_circle,
              currentPage == DrawerSections.manageProfile ? true : false),
          // Divider(),
          menuItem(2, "Settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
          // Divider(),
          menuItem(3, "Help", Icons.help,
              currentPage == DrawerSections.help ? true : false),
          // Divider(),
          menuItem(4, "About", Icons.info,
              currentPage == DrawerSections.about ? true : false),
          // Divider(),
          menuItem(5, "Terms & Conditions", Icons.policy,
              currentPage == DrawerSections.terms_and_policy ? true : false),
          // Divider(),
          menuItem(6, "Feedback", Icons.feedback,
              currentPage == DrawerSections.feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[400] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.manageProfile;
            } else if (id == 2) {
              currentPage = DrawerSections.settings;
            } else if (id == 3) {
              currentPage = DrawerSections.help;
            } else if (id == 4) {
              currentPage = DrawerSections.about;
            } else if (id == 5) {
              currentPage = DrawerSections.terms_and_policy;
            } else if (id == 6) {
              currentPage = DrawerSections.feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  manageProfile,
  settings,
  help,
  about,
  terms_and_policy,
  feedback,
}
