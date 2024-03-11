import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safa_soft_task/core/utils/ext.dart';
import 'package:safa_soft_task/features/home_screen/presentation/manger/home_screen_cubit.dart';
import 'package:safa_soft_task/features/home_screen/presentation/manger/home_screen_states.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/screens/scan_mrz.dart';

import '../../../saved_mrz/presentation/screens/saved_mrz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit,HomeScreenStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title:const Text("Mrz Scanner"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.purple),
                      minimumSize: MaterialStateProperty.resolveWith((states) =>const Size(200, 45))
                    ),
                    onPressed: (){
                      context.pushScreen(ScanMrz());
                    }, child: const Text("Scan Mrz",style: TextStyle(
                  color: Colors.white
                ),))),

                const SizedBox(height: 30,),
                Center(child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.deepPurple),
                        minimumSize: MaterialStateProperty.resolveWith((states) =>const Size(200, 45))
                    ),
                    onPressed: (){
                      context.pushScreen(const SavedMrzScreen());
                    }, child:const Text("Saved Data",style: TextStyle(
                    color: Colors.white
                ),))),
              ],
            ),
          );
        },
    );
  }
}
