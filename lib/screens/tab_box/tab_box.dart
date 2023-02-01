import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fifth_exam/screens/no_connectivity_screen/no_connectivity.dart';
import 'package:fifth_exam/screens/tab_box/tabs/university_multi_screen.dart';
import 'package:fifth_exam/screens/tab_box/tabs/university_single_screen.dart';
import 'package:fifth_exam/state_managers/connectivity/connectivity_cubit.dart';
import 'package:fifth_exam/state_managers/connectivity/connectivity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
    _init() async {
    print("INTERNET TURNED ON CALL ANY API");
  }
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      const UniversitySingleScreen(),
      const UniversityMultiScreen(),
      Container(),
      Container(),
    ];
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none ) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoConnectivityScreen(voidCallback: _init),
              ));
        }
      },
      child: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            currentPage = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.password), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: ""),
          ],
        ),
      ),
    );
  }
}
