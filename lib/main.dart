import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/BLOC/New%20Task%20DropDown/dropDown_bloc.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/view/login/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BlocProvider(
        create: (_)=> dropDownBloc(),
          child: LoginPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
