import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrz_scanner/mrz_scanner.dart';
import 'package:safa_soft_task/core/models/mrz_scanned_data_model.dart';
import 'package:safa_soft_task/core/utils/constant.dart';
import 'package:safa_soft_task/core/utils/ext.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/manger/mrz_cubit.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/manger/mrz_state.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/screens/mrz_result_screen.dart';


class ScanMrz extends StatelessWidget {
  ScanMrz({super.key});

  final MRZController controller = MRZController();

  @override
  Widget build(BuildContext context) {
context.read<MrzCubit>().requestCameraPermission();
    return BlocConsumer<MrzCubit, MrzState>(
      listener: (context, state) {
        if (state.isLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (!state.isPermissionGranted) {
          return Scaffold(
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(Constants.globalPadding),
                child: const Text(
                  'Camera permission denied',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }
        return MRZScanner(
          controller: controller,
          onSuccess: (mrzResult) async {
            context.read<MrzCubit>().mrzResult = mrzResult;
            context.pushScreen(const MrzResultScreen());
          },
        );
      },
    );
  }
}
