import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/BLOC/New%20Task%20DropDown/dropDown_event.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/BLOC/New%20Task%20DropDown/dropDown_state.dart';



class dropDownBloc extends Bloc<dropDownEvent , dropDownState>{

  dropDownBloc():super(dropDownState()){
    on<newDropDownValue>(newValue);
  }

  void  newValue(newDropDownValue event , Emitter<dropDownState> emit){
    emit(state.copyWith(!state.dropDownValue));
  }

}