import 'package:bloc_sample/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildPage extends StatefulWidget {
  static final String routeName ='route-name';
  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  MessageBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text('press me'),
              onPressed: () {
                _bloc.add(ChangeMessage('The message was changed!'));
              },
            ),
          )
        ],
      ),
    );
  }
}