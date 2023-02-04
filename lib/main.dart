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
     body:  TabBarView(
        children: [GridView.count(
          padding:  const EdgeInsets.all(20),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            classCard(color: Color.fromARGB(255, 245, 140, 185),eColor: Color.fromARGB(255, 179, 102, 135),classname: S.of(context).paladin,classIcon: Icon(Icons.male),)
          ],
          ),
          Icon(Icons.adb)
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

class classCard extends StatelessWidget {
  
  // ignore: use_key_in_widget_constructors
  const classCard({
    Key? key,
    this.color = Colors.white,
    this.eColor = Colors.white,
    this.classname = '',
    required this.classIcon,
  }):super(key: key);
  final Color color;
  final Color eColor;
  final String classname;
  final Icon classIcon;
  void zaglushka(BuildContext context){
    final scaffold = ScaffoldMessenger.of(context);
     scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => zaglushka(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [color, eColor,]
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
            color: Colors.transparent,
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              classIcon,
              Text(classname,style:const TextStyle(fontFamily: 'Areal'),),
            ]),
        ),
      ),
    );
  }
}

