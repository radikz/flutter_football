import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football/bloc/standing/standing_bloc.dart';
import 'package:flutter_football/view/screens/detail/widgets/standings_list.dart';

class DetailScreen extends StatelessWidget {

  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: Colors.white,
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
          title: BlocBuilder<StandingBloc, StandingState>(
            builder: (context, state) {
              switch (state.status) {
                case StandingStatus.failure:
                  return Center(
                    child: Text('Failed to load data'),
                  );
                case StandingStatus.success:
                  return Text(state.data!.competition.name);
                default:
                  return Center(
                    child: Text('Loading...'),
                  );
              }
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5, right: 5, left: 10),
          child: TabBarView(
            children: [
              StandingsList(),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}
