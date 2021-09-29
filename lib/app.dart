import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football/bloc/match/match_bloc.dart';
import 'package:flutter_football/bloc/splash/splash_bloc.dart';
import 'package:flutter_football/bloc/standing/standing_bloc.dart';
import 'package:flutter_football/view/screens/detail/detail_screen.dart';
import 'package:flutter_football/view/screens/home/home_screen.dart';
import 'package:flutter_football/view/screens/splash/splash_screen.dart';
import 'bloc/competition/competition_bloc.dart';
import 'bloc/internet/internet_cubit.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (ctx) => InternetCubit(connectivity: Connectivity())),
          BlocProvider(create: (ctx) => SplashBloc()..add(NavigateSplash())),
          BlocProvider(create: (ctx) =>
          CompetitionBloc()
            ..add(CompetitionFetched())),
          BlocProvider(create: (ctx) => StandingBloc()),
          BlocProvider(create: (ctx) => MatchBloc()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              switch(state.status){
                case SplashStatus.success:
                  print('splash success');
                  return HomeScreen();
                default:
                  print('splash loading');
                  return SplashScreen();
              }
            },
          ),
          routes: {
            DetailScreen.routeName: (ctx) => DetailScreen(),
          },
        ));
  }
}
