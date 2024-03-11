import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:safa_soft_task/core/helpers/shared_pref.dart';
import 'package:safa_soft_task/core/models/mrz_scanned_data_model.dart';
import 'package:safa_soft_task/core/utils/constant.dart';
import 'package:safa_soft_task/features/saved_mrz/presentation/manger/saved_mrz_states.dart';


class SavedMrzCubit extends Cubit<SavedMrzStates> {
  SavedMrzCubit() : super(SavedMrzStates());
  static SavedMrzCubit get(context) => BlocProvider.of(context);
  SharedPrefsSingleton prefs = SharedPrefsSingleton();
   List<MrzScannedDataModel> savedList=[];
  void getSavedMrz(){
    emit(state.copyWith(isLoading: true));
    savedList = prefs.getList(Constants.saveMrzData, (p0) => MrzScannedDataModel.fromJson(p0));
    emit(state.copyWith(isLoading: false));
  }

}


