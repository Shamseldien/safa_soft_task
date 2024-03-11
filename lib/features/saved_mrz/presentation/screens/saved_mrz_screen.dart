import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safa_soft_task/core/utils/ext.dart';
import 'package:safa_soft_task/features/saved_mrz/presentation/manger/saved_mrz_cubit.dart';
import 'package:safa_soft_task/features/saved_mrz/presentation/manger/saved_mrz_states.dart';
class SavedMrzScreen extends StatelessWidget {
  const SavedMrzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SavedMrzCubit>().getSavedMrz();
    return BlocConsumer<SavedMrzCubit,SavedMrzStates>(
        listener: (context,state){},
      builder: (context,state){
       return Scaffold(
          appBar: AppBar(
            title: Text("Saved Data"),
          ),
         body: ListView.builder(
             itemCount:context.read<SavedMrzCubit>().savedList.length ,
             itemBuilder: (context,index)=>Padding(
               padding: const EdgeInsets.all(5.0),
               child: Card(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Name : ${context.read<SavedMrzCubit>().savedList[index].givenNames}'),
                       Text('Gender : ${context.read<SavedMrzCubit>().savedList[index].sex.name}'),
                       Text('Country Code : ${context.read<SavedMrzCubit>().savedList[index].countryCode}'),
                       Text('Date of Birth : ${context.read<SavedMrzCubit>().savedList[index].birthDate.formatDate}'),
                       Text('Expiry Date : ${context.read<SavedMrzCubit>().savedList[index].expiryDate.formatDate}'),
                       Text('Mrz Num : ${context.read<SavedMrzCubit>().savedList[index].documentNumber}'),
                       Text('Mrz Type : ${context.read<SavedMrzCubit>().savedList[index].documentType}'),
                     ],
                   ),
                 ),
               ),
             )
         ),

        );
      },
    );
  }
}
