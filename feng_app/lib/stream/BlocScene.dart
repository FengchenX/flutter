import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:fengapp/public.dart';
import 'package:fengapp/stream/BlocProvider.dart';
import 'package:fengapp/stream/CounterWidget.dart';
import 'package:fengapp/stream/CounterStream.dart';
import 'package:fengapp/stream/IncrementBloc.dart';
import 'package:fengapp/widget/loading_indicator.dart';

class BlocScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bloc"),
          elevation: 0,
        ),
        body: BlocProvider<IncrementBloc>(
          bloc: IncrementBloc(),
          child: CounterWidget(),
        ));
  }
}
