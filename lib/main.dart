import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_store_online_project/features/features_intro/presentation/screens/spash_screen.dart';
import 'features/features_intro/presentation/bloc/splash_cubit/splash_cubit.dart';

void main() {
runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (_)=> SplashCubit()),
    ],
    child: const MyApp()
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'super_store',
      home: SplashScreen(),

    );
  }
}