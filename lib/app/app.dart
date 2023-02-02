import 'package:fifth_exam/screens/tab_box/tab_box.dart';
import 'package:fifth_exam/state_managers/connectivity/connectivity_cubit.dart';
import 'package:fifth_exam/state_managers/university_single_cubit/university_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => UniverSingleStateCubit()..getAllUniversity()),
      BlocProvider(create: (context) => ConnectivityCubit()),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabBoxScreen(),
    );
  }
}
