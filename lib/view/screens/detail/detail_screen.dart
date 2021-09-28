import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football/bloc/standing/standing_bloc.dart';
import 'package:flutter_football/model/enum.dart';
import 'package:flutter_football/view/screens/detail/widgets/matches_tab/matches_list.dart';
import 'package:flutter_football/view/screens/detail/widgets/standing_tab/standing_list.dart';
import 'package:flutter_football/view/screens/error/error_screen.dart';

class DetailScreen extends StatelessWidget {

  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<StandingBloc, StandingState>(
            builder: (context, state) {
              switch (state.status) {
                case DataStatus.failure:
                  return ErrorScreen();
                case DataStatus.success:
                  return Text(state.data!.competition.name);
                default:
                  return Text('Loading...');
              }
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5, right: 5, left: 10),
          child: Column(
            children: [
              Container(
                child: TabBar(
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "STANDING",
                    ),
                    Tab(
                      text: "MATCHES",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TabBarView(
                    children: [
                      StandingList(),
                      MatchesList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
