


import 'package:equatable/equatable.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/constants/constants.dart';

class dropDownState extends Equatable{

  final bool dropDownValue;

  const dropDownState({this.dropDownValue=false});

  dropDownState copyWith(bool? newDropDownValue){
    return dropDownState(
      dropDownValue: newDropDownValue??this.dropDownValue
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [dropDownValue];

}