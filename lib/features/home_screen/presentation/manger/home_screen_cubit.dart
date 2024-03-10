import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safa_soft_task/core/utils/ext.dart';
import 'package:safa_soft_task/features/home_screen/presentation/manger/home_screen_states.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/manger/mrz_cubit.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/screens/scan_mrz.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenStates());

  static HomeScreenCubit get(context) => BlocProvider.of(context);


  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 250,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.orange),
                          minimumSize: MaterialStateProperty.resolveWith((states) =>const Size(200, 45))
                      ),
                      onPressed: () {
                        context.read<MrzCubit>().pickImageFromGallery(context);
                      }, child:const Text("Scan From File",style: TextStyle(
                    color: Colors.white
                  ),)),
                const SizedBox(height: 30,),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.deepOrange),
                          minimumSize: MaterialStateProperty.resolveWith((states) =>const Size(200, 45))
                      ),
                      onPressed: () {
                        context.pushScreen(ScanMrz());
                      }, child: const Text("Scan From Camera",style: TextStyle(
                      color: Colors.white
                  ))),
                ],
              ),
            ),
          );
        }
    );
  }
}


