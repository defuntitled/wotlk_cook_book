import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'logger.dart';
import 'errors_handler.dart';
import 's.dart';
import 'app_theme.dart';

void main() {
  runZonedGuarded(() {
    initLogger();
    logger.info('Start main');
    ErrorHandler.init();
    runApp(const App());
  }, ErrorHandler.recordError);
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _locale = S.en;
  var _isDark = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
         AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.supportedLocales,
      locale: _locale,
      title: "WOTLK cookbook",
      theme: AppTheme.theme(_isDark),
      home:  DefaultTabController(length: 2,child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title,
        style: const TextStyle(
          fontFamily: "Lifecraft",
          fontSize: 30,
          color: Color.fromARGB(255, 72, 170, 222),
          ),
        ), 
      ),
     body: const TabBarView(
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
  ],
    ),
    bottomNavigationBar: const BottomAppBar(
      child: TabBar(tabs: [
          Tab(
            text: 'PvE',
            icon: Icon(Icons.accessible),
          ),
          Tab(
            text:'PvP',
            icon: Icon(Icons.accessible_forward),
          ),
        ]),
    ),
    );
  }
}

