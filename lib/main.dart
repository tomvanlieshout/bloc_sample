import 'package:bloc_sample/child_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => MessageBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      routes: {
        ChildPage.routeName: (context) => BlocProvider(
              child: ChildPage(),
              create: (context) => MessageBloc(),
            ),
        MyHomePage.routeName: (context) => BlocProvider(
              child: MyHomePage(),
              create: (context) => MessageBloc(),
            )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static final String routeName = 'home';
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message;
  MessageBloc _bloc;

  @override
  void initState() {
    message = 'Original message';
    // _bloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      _bloc = BlocProvider.of(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            BlocBuilder(
              bloc: _bloc,
              builder: (context, state) {
                if (state is MessageLoadSucces) {
                  return Text(state.message.msg);
                } else {
                  return Text('Message didn\'t change');
                }
              },
            ),
            RaisedButton(
              child: Text('go to child page'),
              onPressed: () => Navigator.of(context).pushNamed(ChildPage.routeName),
            ),
            RaisedButton(
              child: Text('add event'),
              onPressed: () => _bloc.add(ChangeMessage('message')),
            )
          ],
        ),
      ),
    );
  }
}
