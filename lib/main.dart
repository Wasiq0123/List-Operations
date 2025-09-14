import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:list_topic/button_color_diffe_state/simples-state/button_screen.dart';
import 'package:list_topic/counter/bloc_counter/bloc/counter_bloc.dart';
import 'package:list_topic/counter/bloc_counter/counter_with_bloc.dart';
import 'package:list_topic/counter/getx_counter/counter_screen_with_getx.dart';

import 'google_maps/maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: FluttterMpsScreen(),
    );
  }
}
