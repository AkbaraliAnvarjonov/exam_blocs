import 'package:fifth_exam/state_managers/university_single_cubit/university_cubit.dart';
import 'package:fifth_exam/state_managers/university_single_cubit/university_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniversitySingleScreen extends StatelessWidget {
  const UniversitySingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("University Single Cubit")),
      body: BlocBuilder<UniverSingleStateCubit, UniversityCubitSingleState>(
        builder: (context, state) {
          if (state.status == Status.error) {
            return Text(state.error.toString());
          }
          if (state.status == Status.succes) {
            return ListView.builder(
              itemCount: state.universities!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.universities![index].name),
                );
              },
            );
          }
          if (state.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
