


import 'package:flutter/material.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/view/login/login.dart';

void  showDeleteDialog(BuildContext context, Function onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.red,
        title: Text('Warning' , style: TextStyle(
          color: Colors.white,
        ),),
        content: Text('Are you sure you want to delete?',style: TextStyle(
          color: Colors.white,
        ),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No',),
          ),
          TextButton(

            onPressed: () {
               onConfirm();
              Navigator.of(context).pop();
            },

            child: Text('Yes',style: TextStyle(
              color: Colors.white,
            ),),
          ),
        ],
      );
    },
  );
}

void  showTaskCompletionConfirmationDialog(BuildContext context, Function onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.green,
        title: Text('Warning',style: TextStyle(
          color: Colors.white,
        ),),
        content: Text('Are you sure you want to mark this task as Complete?',style: TextStyle(
          color: Colors.white,
        ),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
          TextButton(

            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },

            child: Text('Yes',style: TextStyle(
              color: Colors.white,
            ),),
          ),
        ],
      );
    },
  );
}

void  showLogoutConfirmationDialog(BuildContext context, Function onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Logout',style: TextStyle(
          color: Colors.black,
        ),),
        content: Text('Are you sure you want to Logout?',style: TextStyle(
          color: Colors.black,
        ),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
          TextButton(

            onPressed: () {
             
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },

            child: Text('Yes',style: TextStyle(
              color: Colors.black,
            ),),
          ),
        ],
      );
    },
  );
}

