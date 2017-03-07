import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cafe Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting
        // the app, try changing the primarySwatch below to Colors.green
        // and then invoke "hot reload" (press "r" in the console where
        // you ran "flutter run", or press Run > Hot Reload App in IntelliJ).
        // Notice that the counter didn't reset back to zero -- the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Cafe details: Costa'),
    );
  }
}

class ReviewItem extends StatefulWidget {
  @override
  _ReviewItemState createState() => new _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  String dummyReview =
      'Review Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris porta consectetur nisl. Sed at vehicula justo. Nulla ac fermentum lorem. Etiam et auctor ligula, vel tincidunt felis.';

  bool _isHelpful = false;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Text(dummyReview),
        new Row(
          children: [
            new Checkbox(
              value: _isHelpful,
                onChanged: (bool newValue) {
                  setState(() {
                    _isHelpful = newValue;
                  });
                },
            ),
            new Text('I found this review helpful'),
          ],
        ),
        new Divider(),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFav = false;

  void _toggleFav() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _isFav = !_isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.


    // populate reviews
    var reviewList = [];
    for (var i = 0; i < 10; i++) {
      reviewList.add(new ReviewItem());
    }

    Container reviewSection = new Container(
      padding: new EdgeInsets.all(15.0),
      child: new Column(
        children: reviewList,
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
          // Here we take the value from the MyHomePage object that
          // was created by the App.build method, and use it to set
          // our appbar title.
          title: new Text(config.title),
          actions: [
            new IconButton(
              icon: new Icon(_isFav ? Icons.favorite : Icons.favorite_border),
              onPressed: _toggleFav,
            ),
          ]),
      body: new ListView(
        children: [
          new Padding(
            padding: new EdgeInsets.all(5.0),
            child: new Card(
              child: new Column(
                children: [
                  new ListItem(
                    leading: new Icon(Icons.restaurant_menu,
                        color: Theme.of(context).primaryColor),
                    title: new Text('1625 Charleston Road'),
                    subtitle: new Text('Mountain View, CA 94043'),
                  ),
                  new Divider(),
                  new ListItem(
                    leading: new Icon(Icons.contact_phone,
                        color: Theme.of(context).primaryColor),
                    title: new Text('(408) 555 1212'),
                  ),
                  new ListItem(
                    leading: new Icon(Icons.contact_mail,
                        color: Theme.of(context).primaryColor),
                    title: new Text('costa@google.com'),
                  ),
                ],
              ),
            ),
          ),
          reviewSection,
        ],
      ),
    );
  }
}
