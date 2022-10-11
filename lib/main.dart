import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterwidgets/save%20data%20locally/model/localstorage.dart';
import 'package:flutterwidgets/save%20data%20locally/service/boxes.dart';
import 'package:flutterwidgets/save%20data%20locally/util/mediaquery.dart';
import 'package:flutterwidgets/save%20data%20locally/util/modal.dart';
import 'package:flutterwidgets/save%20data%20locally/view/add_qoute.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initLocalStorage() async {
  // register adapters
  Hive..registerAdapter(LocalStrorageAdapter());

  // initialise hive
  await Hive.initFlutter();

  // then open boxes
  await Future.wait([Hive.openBox<LocalStrorage>('localStorage')]);
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
      body: ValueListenableBuilder<Box<LocalStrorage>>(
          valueListenable: Boxes.getStorageBox().listenable(),
          builder: (context, box, _) {
            final quotes = box.get('quotes');

            return quotes == null
                ? const Center(
                    child: Text('No Quotes'),
                  )
                : Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    width: fullWidth(context),
                    height: fullHeight(context),
                    child: Text(
                      quotes.paragraph,
                      style: const TextStyle(
                        fontSize: 20,
                        letterSpacing: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Modal.open(context, const AddQoute(), isScrollControlled: true),
        tooltip: 'add qoute',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
