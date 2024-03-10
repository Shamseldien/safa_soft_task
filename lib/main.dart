import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safa_soft_task/features/home_screen/presentation/manger/home_screen_cubit.dart';
import 'package:safa_soft_task/features/home_screen/presentation/screens/home_screens.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/manger/mrz_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenCubit(),
        ),

        BlocProvider(
          create: (context) => MrzCubit(),
        ),

      ],
      child:  MaterialApp(
        theme: ThemeData(
          useMaterial3: true
        ),
        home:const HomeScreen(),
      ),
    );
  }
}

