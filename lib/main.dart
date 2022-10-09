import 'package:flutter/material.dart';
import 'package:flutterwidgets/save%20data%20locally/model/localstorage.dart';
import 'package:flutterwidgets/save%20data%20locally/model/paragraph.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  runApp(const MyApp());

  initLocalStorage();
}

Future<void> initLocalStorage() async {
  // register adapters
  Hive
    ..registerAdapter(LocalStrorageAdapter())
    ..registerAdapter(
      ParagraphAdapter(),
    );

  // initialise hive
  await Hive.initFlutter();

  // then open boxes
  await Future.wait([Hive.openBox<LocalStrorage>('quotes')]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
