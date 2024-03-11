import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safa_soft_task/core/utils/ext.dart';
import 'package:safa_soft_task/features/home_screen/presentation/manger/home_screen_states.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/manger/mrz_cubit.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/screens/scan_mrz.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenStates());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

}


