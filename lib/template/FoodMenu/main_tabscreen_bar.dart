import 'package:flutter/material.dart';
import 'package:flutter_application_1/template/FoodMenu/first_screen.dart';
import 'package:flutter_application_1/template/login_screen.dart';

class MainTabscreenBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Main Screen"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.food_bank), text: "Food"),
              Tab(icon: Icon(Icons.search), text: "Search"),
              Tab(icon: Icon(Icons.person), text: "Profile"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FirstScreen(),
            Center(child: Text("Food Menu")),
            Center(child: Text("Search Screen")),
            LoginScreen(),
          ],
        ),
      ),
    );
  }
}
