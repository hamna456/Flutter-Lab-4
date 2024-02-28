import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
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
  int _counter = 0;
  bool _isIncrementDisabled = false;
  bool _isDecrementDisabled = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter >= 10) { // button disable at 10 or more and dialogue box appears
        _isIncrementDisabled = true;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(  //dialogue box
              title: Text('Cannot Increment More'),
              content: Text('You cannot increment more.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
      if (_counter > 0) {  //decrement disable at >0
        _isDecrementDisabled = false;
      }
    });
  }
// decrement function
  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter <= 0) { // button disable at 0 or less and dialogue box appears
        _isDecrementDisabled = true;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog( //dialogue box
              title: Text('Cannot Decrement More'),
              content: Text('You cannot decrement more.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
      if (_counter < 10) {  // at more than 10  increment disable.
        _isIncrementDisabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)), // Centering the title
        centerTitle: true, // Setting centerTitle to true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(   //display of counter
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(  //decrement button
                  onPressed: _isDecrementDisabled ? null : _decrementCounter,
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 16),
                ElevatedButton(  //increment button
                  onPressed: _isIncrementDisabled ? null : _incrementCounter,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(  // + button at bottom right
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

    );
  }
}

