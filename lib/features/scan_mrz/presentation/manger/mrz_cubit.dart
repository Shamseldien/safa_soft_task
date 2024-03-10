import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mrz_scanner/mrz_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:safa_soft_task/core/models/mrz_scanned_data_model.dart';
import 'package:safa_soft_task/core/utils/ext.dart';
import 'package:safa_soft_task/core/utils/mrz_helper.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/screens/mrz_result_screen.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/manger/mrz_state.dart';


class MrzCubit extends Cubit<MrzState> {
  MrzCubit() : super(MrzState(isPermissionGranted: false));

  static MrzCubit get (context) => BlocProvider.of(context);

  final textRecognizer = TextRecognizer();
  var recognizedText = '';
  MRZResult? mrzResult;
  final picker = ImagePicker();
  File? selectedImage;


  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if(status.isPermanentlyDenied){
      openAppSettings();
    }
    emit(state.copyWith(isPermissionGranted: status == PermissionStatus.granted));
  }

  Future pickImageFromGallery(BuildContext context) async {

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedFile!=null){
      selectedImage = File(pickedFile.path);
      context.pop();
      context.pushScreen(const MrzResultScreen());
    }

    // scanImage(context);
  }


  Future<void> scanImage(BuildContext context) async {

    try {
      emit(state.copyWith(isLoading: true));
      if (selectedImage == null) return;
      //_imageFile = File(selectedImage!.path);
      final inputImage = InputImage.fromFilePath(selectedImage!.path);
      final recognizedTextBlocks = await TextRecognizer().processImage(inputImage);

      for (TextBlock block in recognizedTextBlocks.blocks) {
        for (TextLine line in block.lines) {
          recognizedText += ('${line.text}\n');
        }
      }



      String fullText = recognizedText;

      String trimmedText = fullText.replaceAll(' ', '');
      List allText = trimmedText.split('\n');

      List<String> ableToScanText = [];
      for (var e in allText) {
        if (MRZHelper.testTextLine(e).isNotEmpty) {
          ableToScanText.add(MRZHelper.testTextLine(e));
        }
      }


      List<String>? result = MRZHelper.getFinalListToParse([...ableToScanText]);


      print("**************************");
      print(result);
      print("**************************");

      if (result != null) {
        mrzResult = MRZParser.parse(result);
        // shwResDialog(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('result is null scanning text'),
          ),
        );
      }


      emit(state.copyWith(isLoading: false));
      // await navigator.push(
      //  MaterialPageRoute(builder: (context) => ScanResultPageSolution2(text: recognizedText,),)
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred when scanning text'),
        ),
      );
    }


  }



  Future<void> saveExtractedData(BuildContext context ) async {
    final navigator = Navigator.of(context);

    try {
      // final mRZModelSolution1 = Hive.box<MRZModelSolution1>(Constants.mrzHiveBoxSolution1);
      // mRZModelSolution1.add(mrzModel);
      // emit(state.copyWith(isLoading: false));
      // await navigator.push(
      //     MaterialPageRoute(builder: (context) => const StoredResultPageSolution1(),)
      // );
      // if(recognizedText.isNotEmpty){
      //
      // }else{
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text('Empty text'),
      //     ),
      //   );
      // }

    } catch (e) {
      emit(state.copyWith(isLoading: false));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('An error occurred when scanning text'),
      //   ),
      // );
    }
  }
}


