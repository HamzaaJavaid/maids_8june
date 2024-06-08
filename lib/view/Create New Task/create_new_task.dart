import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/BLOC/New%20Task%20DropDown/dropDown_bloc.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/BLOC/New%20Task%20DropDown/dropDown_event.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/BLOC/New%20Task%20DropDown/dropDown_state.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/constants/constants.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/modals_variables/modals_var_info.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/network/baseAPINetwork.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  String _taskTitle = '';
  bool _isCompleted = false;
  BaseAPINetwork baseAPINetwork = BaseAPINetwork();



  @override
  Widget build(BuildContext context) {
    final height = constants.device_height;
    final width  = constants.device_width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Task Title'),
              onChanged: (value) {
                setState(() {
                  _taskTitle = value;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<bool>(
              value: _isCompleted,
              onChanged: (value) {

               setState(() {
                 _isCompleted = value!;
               });
              },
              items: [
                DropdownMenuItem<bool>(
                  value: true,
                  child: Text('Completed'),
                ),
                DropdownMenuItem<bool>(
                  value: false,
                  child: Text('Pending'),
                ),
              ],
            ),
            SizedBox(height: 20),
            MaterialButton(
              shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.transparent)
              ),
              color: Colors.greenAccent,
              height: height/15,
              minWidth: width/1.1,
              onPressed: ()async{

               if(_taskTitle.isEmpty){
                 Get.snackbar("Warning", 'You need to give title of the Task',backgroundColor: Colors.redAccent.withOpacity(0.8));
               }
               else{
                 final data  = await baseAPINetwork.PostAPIwithHeader(
                     constants.AddNewSpecificTasks,
                     {
                       'todo':_taskTitle,
                       'completed':_isCompleted,
                       "userId":vm_var.id,
                     },
                     {
                       "Content-Type":'application/json'
                     }
                 );
                 Get.snackbar("Hurray", 'You Created your Task',backgroundColor: Colors.green.withOpacity(0.8));
                 Navigator.pop(context);
                 print(data);
               }




              },
              child: const Text('Create Task Now',style: TextStyle(
                  color: Colors.white,fontSize: 21
              ),),
            ),

          ],
        ),
      ),
    );
  }
}