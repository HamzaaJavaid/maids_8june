
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/modals_variables/modals_var_info.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/view/mainDashboard/mainDashboard.dart';

import '../../network/baseAPINetwork.dart';

import 'package:get/utils.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/network/baseAPINetwork.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/constants/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  BaseAPINetwork BaseApi = BaseAPINetwork();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    constants.device_height =  MediaQuery.of(context).size.height ;
    constants.device_width =  MediaQuery.of(context).size.width ;
    return PopScope(
      canPop: false,
      child: Scaffold(

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: constants.device_height/6),
                  Container(
                    width: constants.device_width/2,
                    height: constants.device_height/10,
                    decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: constants.device_height/10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    shape: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.transparent)
                    ),
                    color: Colors.greenAccent,
                    height: constants.device_height/15,
                    minWidth: constants.device_width/1.1,
                    onPressed: () async{
                      String username = usernameController.text;
                      String password = passwordController.text;
                      // Add your login logic here


                      setState(() {
                        loading = true;
                      });

                      var data = await BaseAPINetwork().PostAPIwithHeader(
                          constants.login,
                          {
                            'username':username,
                            "password":password,
                          },
                          {
                            'Content-Type':'application/json'
                          }
                      );
                      if(data['message']=="Invalid credentials"){

                        setState(() {
                          loading = false;
                        });

                        Get.snackbar("Warning", data!['message'] ,  backgroundColor: Colors.redAccent.withOpacity(0.6));
                      }
                      else if(data['id']!=0){
                        setState(() {
                          loading = false;
                        });
                        Get.snackbar("Success", "Welcome Back" ,  backgroundColor: Colors.green.withOpacity(0.6));

                        vm_var.id = data['id'].toString();
                        vm_var.name = data['username'].toString() ;
                        vm_var.email = data['email'].toString();
                        vm_var.image = data['image'].toString();
                        vm_var.authToken = data['token'].toString();

                        //print(vm_var.id);print(vm_var.name);print(vm_var.email);print(vm_var.authToken);print(vm_var.image);
                        usernameController.clear();
                        passwordController.clear();


                        Navigator.push(context, MaterialPageRoute(builder: (context)=>mainDashbaord()));

                      }


                      setState(() {
                        loading = false;
                      });





                    },
                    child:  loading==true ? CircularProgressIndicator(color: Colors.white,) : Text('Login',style: TextStyle(
                        color: Colors.white,fontSize: 21
                    ),),
                  ),
                  SizedBox(height: constants.device_height/40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont Have an Accoount ?'),
                      TextButton(onPressed: (){

                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>const signUpScreen()));
                      }, child: const Text('Sign Up'))
                    ],
                  ),
                  SizedBox(height: constants.device_height/17,),
                  const Text('Version 1.0.0',style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 11
                  ),),


                ],
              ),
            ),
          ),
        ),
      ),
    ),);
  }
}
