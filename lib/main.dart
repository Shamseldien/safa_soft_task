import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safa_soft_task/core/helpers/shared_pref.dart';
import 'package:safa_soft_task/features/home_screen/presentation/manger/home_screen_cubit.dart';
import 'package:safa_soft_task/features/home_screen/presentation/screens/home_screens.dart';
import 'package:safa_soft_task/features/saved_mrz/presentation/manger/saved_mrz_cubit.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/manger/mrz_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsSingleton().init();
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
        BlocProvider(
          create: (context) => SavedMrzCubit(),
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

