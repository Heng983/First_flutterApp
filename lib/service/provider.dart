import 'package:flutter/material.dart';
import 'package:flutter_application_1/fontsize_logic.dart';
import 'package:flutter_application_1/template/basic_app.dart';
import 'package:flutter_application_1/themeMode.dart';
import 'package:provider/provider.dart';

Widget provider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Thememode()),
      ChangeNotifierProvider(create: (context) => FontsizeLogic()),
    ],
    child: BasicApp(),
  );
}
