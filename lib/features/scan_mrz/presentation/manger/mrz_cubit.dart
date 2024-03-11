import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrz_scanner/mrz_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
 import 'package:safa_soft_task/core/helpers/shared_pref.dart';
import 'package:safa_soft_task/core/models/mrz_scanned_data_model.dart';
import 'package:safa_soft_task/core/utils/constant.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/manger/mrz_state.dart';



class MrzCubit extends Cubit<MrzState> {
  MrzCubit() : super(MrzState(isPermissionGranted: false));

  static MrzCubit get (context) => BlocProvider.of(context);
  MRZResult? mrzResult;
  MrzScannedDataModel? mrzScannedDataModel;
   SharedPrefsSingleton prefs = SharedPrefsSingleton();


  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if(status.isPermanentlyDenied){
      openAppSettings();
    }
    emit(state.copyWith(isPermissionGranted: status == PermissionStatus.granted));
  }

  
  
  void saveMrz(BuildContext context)async{
     try {

     final  List<MrzScannedDataModel> savedList = prefs.getList(Constants.saveMrzData, (p0) => MrzScannedDataModel.fromJson(p0));

      mrzScannedDataModel = MrzScannedDataModel(
        surnames: mrzResult!.surnames,
        sex: mrzResult!.sex,
        personalNumber: mrzResult!.personalNumber,
        nationalityCountryCode:mrzResult!.nationalityCountryCode ,
        givenNames: mrzResult!.givenNames,
        expiryDate:mrzResult!.expiryDate ,
        documentType: mrzResult!.documentType,
        documentNumber:mrzResult!.documentNumber ,
        countryCode:mrzResult!.countryCode ,
        birthDate: mrzResult!.birthDate,
        personalNumber2: mrzResult!.personalNumber2,
      );

     savedList.add(mrzScannedDataModel!);

     await prefs.saveList(Constants.saveMrzData, savedList);



     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
         content: Text('Mrz Data Saved Successfully'),
       ),
     );
     emit(state.copyWith(isLoading: false));
    } catch (e) {

      emit(state.copyWith(isLoading: false));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred when save Mrz Data'),
        ),
      );
    }
  }


 }


