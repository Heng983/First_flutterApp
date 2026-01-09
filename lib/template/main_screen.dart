import 'package:flutter/material.dart';
import 'package:flutter_application_1/fontsize_logic.dart';
import 'package:flutter_application_1/template/FoodMenu/first_screen.dart';
import 'package:flutter_application_1/template/login_screen.dart';
import 'package:flutter_application_1/themeMode.dart';
//import 'package:flutter_application_1/service/provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: _buildBody(),
      endDrawer: _buildEndDrawer(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildEndDrawer() {
    int themeIndex = context.watch<Thememode>().themeIndex;

    return Drawer(
      width: 250,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.network(
              "https://i.pinimg.com/1200x/07/9d/76/079d7647ee0dcb3e60ad4a1dfd2c5933.jpg",
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text("System Mode"),
            onTap: () {
              context.read<Thememode>().changetosystemmode();
            },
            trailing: themeIndex == 0
                ? Icon(Icons.check_circle_outline_outlined)
                : null,
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny_outlined),
            title: Text("Light Mode"),
            onTap: () {
              context.read<Thememode>().changetolightmode();
            },
            trailing: themeIndex == 1 ? Icon(Icons.check_box_outlined) : null,
          ),
          ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text("Dark Mode"),
            onTap: () {
              context.read<Thememode>().changetodarkmode();
            },
            trailing: themeIndex == 2
                ? Icon(Icons.check_circle_outline_outlined)
                : null,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<FontsizeLogic>().increase();
                },
                icon: Icon(Icons.text_increase_sharp),
              ),
              IconButton(
                onPressed: () {
                  context.read<FontsizeLogic>().decrease();
                },
                icon: Icon(Icons.text_decrease_sharp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        FirstScreen(),
        LoginScreen(),
        Center(child: Text("Search Screen")),
        Container(color: Colors.blueGrey),
      ],
    );
  }

  int _currentIndex = 0;

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        if (index == 3) {
          _scaffoldkey.currentState!.openEndDrawer();
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
      ],
    );
  }
}
