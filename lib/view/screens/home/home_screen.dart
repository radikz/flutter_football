import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football/bloc/internet/internet_cubit.dart';
import 'package:flutter_football/view/screens/home/widgets/competition_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listenWhen: (context, state) {
        return state is InternetDisconnected;
      },
      listener: (context, state) {
        print('internet disconnected');
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(content: Text('Oh dear, your internet is disconnected')),
          );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Football App', style: TextStyle(color: Colors.white),),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Container(
                alignment: Alignment.topCenter,
                child: CompetitionList()
            ),
          ),
        ),
      ),
    );
  }
}
