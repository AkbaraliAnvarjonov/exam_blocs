import 'package:fifth_exam/state_managers/university_multi_cubit/university_cubit.dart';
import 'package:fifth_exam/state_managers/university_multi_cubit/university_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniversityMultiScreen extends StatelessWidget {
  const UniversityMultiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UniverMultiStateCubit()..getAllUniversity(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Multi Cubit")),
        body: BlocBuilder<UniverMultiStateCubit, UniverMultiState>(
          builder: (context, state) {
            if (state is LoadDataInFailury) {
              return Text(state.error.toString());
            }
            if (state is LoadDataInSuccess) {
              return ListView.builder(
                itemCount: state.universities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.universities[index].name),
                  );
                },
              );
            }
            if (state is LoadDataInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
