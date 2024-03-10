import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safa_soft_task/core/utils/ext.dart';
import 'package:safa_soft_task/features/scan_mrz/presentation/manger/mrz_cubit.dart';
class MrzResultScreen extends StatelessWidget {
  const MrzResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name : ${context.read<MrzCubit>().mrzResult!.givenNames}'),
            Text('Gender : ${context.read<MrzCubit>().mrzResult!.sex.name}'),
            Text('Country Code : ${context.read<MrzCubit>().mrzResult!.countryCode}'),
            Text('Date of Birth : ${context.read<MrzCubit>().mrzResult!.birthDate.formatDate}'),
            Text('Expiry Date : ${context.read<MrzCubit>().mrzResult!.expiryDate.formatDate}'),
            Text('Mrz Num : ${context.read<MrzCubit>().mrzResult!.documentNumber}'),
            Text('Mrz Type : ${context.read<MrzCubit>().mrzResult!.documentType}'),
             const SizedBox(height: 10,),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<MrzCubit>().saveExtractedData(
                    context,
                  );
                },
                label: const Text('Save'),
                icon: const Icon(Icons.save),
              ),
            )
          ],
        ),
      ),
    );
  }
}
