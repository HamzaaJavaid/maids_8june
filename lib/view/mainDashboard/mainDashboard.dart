import 'package:flutter/material.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/constants/constants.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/modals_variables/modals_var_info.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/utils/alertDialogs/alertDialog.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/view/login/login.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/view/view_all_tasks/view_tasks.dart';

import '../Create New Task/create_new_task.dart';



class mainDashbaord extends StatefulWidget {
  const mainDashbaord({super.key});

  @override
  State<mainDashbaord> createState() => _mainDashbaordState();
}

class _mainDashbaordState extends State<mainDashbaord> {
  @override
  Widget build(BuildContext context) {
    final height = constants.device_height;
    final width  = constants.device_width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Onboard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Center(
          child: Column(
            children: [
              SizedBox(height: constants.device_height/20,),

              Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.withOpacity(0.7),
                    borderRadius: const  BorderRadius.all(Radius.circular(40)),

                  ),
                  width: width/1.1,
                  height: height/4,
                  child : Stack(
                    children: [
                      //dashboard vector
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(

                            width: width/2,
                            height: height,
                            decoration:   BoxDecoration(

                              image:   DecorationImage(
                                  opacity: 0.5,
                                  image: AssetImage(constants.dashobaard_welcome)
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(40)),

                            ),

                          ),
                        ],
                      ),
                      //dashboard data from Database
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height/40,),
                          Row(

                            children: [
                              SizedBox(width: width/22,),
                              CircleAvatar(backgroundColor: Colors.white24,backgroundImage: NetworkImage(vm_var.image),),
                              SizedBox(width: width/1.7,),
                              GestureDetector(
                                onTap: (){
                                  showLogoutConfirmationDialog(context, (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                  });
                                },
                                child:  const Icon(Icons.logout_outlined,color: Colors.white,size: 35,),
                              )

                            ],),
                          SizedBox(height: height/40,),
                          Row(
                            children: [
                              SizedBox(width: width/22,),
                              Text(vm_var.name,style:  const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34
                              ),)
                            ],
                          ),
                          SizedBox(height: height/350,),
                          Row(
                            children: [
                              SizedBox(width: width/22,),
                              Text(vm_var.email,style: const  TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14
                              ),)
                            ],
                          ),

                          SizedBox(height: height/80,),

                        ],
                      )
                    ],
                  )

              ),
              SizedBox(height: height/30,),
              Container(
                width: width,
                height: height/6,
                child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return  Row(
                      children: [
                        //view task info
                        SizedBox(width: width/30,),
                        Container(
                          decoration:   BoxDecoration(
                            color: Color.fromRGBO(238, 229, 215, 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(image: AssetImage(constants.view_tasks),opacity: 0.3)

                          ),
                          height: height/5,
                          width: width/2.2,
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  //Container(height:height,width:width/3,decoration:   BoxDecoration(image: DecorationImage(image: AssetImage(constants.view_tasks),opacity: 0.3),),)
                                ],),
                              Column(
                                children: [
                                  SizedBox(height: height/60,),
                                  Row(children: [SizedBox(width: width/32,),const Text('View',style: TextStyle(
                                      color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 19
                                  ),)],),
                                  Row(children: [SizedBox(width: width/32,), const Text('All Tasks',style: TextStyle(
                                      color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 19
                                  ),)],),
                                  Row(
                                    children: [
                                      SizedBox(width: width/70,),
                                      GestureDetector(
                                        onTap: (){

                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> viewTasks('View')));


                                        },
                                        child: Container(
                                          margin: const  EdgeInsets.all(8),
                                          width: width/4.8,
                                          height: height/40,
                                          decoration: BoxDecoration(
                                            color: Colors.redAccent.withOpacity(0.4),
                                            borderRadius:  const BorderRadius.all(Radius.circular(5)),

                                          ),
                                          child: const Text('  View Now',style: TextStyle(
                                              color: Colors.white
                                          ),),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),


                        // edit and delete tasks
                        SizedBox(width: width/50,),
                        Container(
                          decoration:   BoxDecoration(
                            color: Color.fromRGBO(227, 234, 253, 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(image: AssetImage(constants.edit_task),fit: BoxFit.cover,opacity: 0.3)
                          ),
                          height: height/4,
                          width: width/2.2,
                          child: Column(
                            children: [
                              SizedBox(height: height/60,),
                              Row(children: [SizedBox(width: width/32,), const Text('Edit',style: TextStyle(
                                  color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 19
                              ),)],),
                              Row(children: [SizedBox(width: width/32,), const Text('Tasks',style: TextStyle(
                                  color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 19
                              ),)],),
                              Row(
                                children: [
                                  SizedBox(width: width/70,),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> viewTasks('Edit')));
                                    },
                                    child: Container(
                                      margin:  const EdgeInsets.all(8),
                                      width: width/4.8,
                                      height: height/40,
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent.withOpacity(0.4),
                                        borderRadius: const  BorderRadius.all(Radius.circular(5)),

                                      ),
                                      child:  const Text('  Edit Now',style: TextStyle(
                                          color: Colors.white
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),



                      ],
                    );
                  },
                ),
                //add new task





                /*
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //report now container
                    SizedBox(width: width/30,),
                    Container(
                      decoration:  const BoxDecoration(
                        color: Color.fromRGBO(238, 229, 215, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      height: height/5,
                      width: width/2.2,
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Container(height:height,width:width/3,decoration: const  BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/reportIncident_icon.png'),opacity: 0.3),),)],),
                          Column(
                            children: [
                              SizedBox(height: height/60,),
                              Row(children: [SizedBox(width: width/32,),const Text('Report',style: TextStyle(
                                  color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 19
                              ),)],),
                              Row(children: [SizedBox(width: width/32,), const Text('Incident',style: TextStyle(
                                  color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 19
                              ),)],),
                              Row(
                                children: [
                                  SizedBox(width: width/70,),
                                  GestureDetector(
                                    onTap: (){
                                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> reportIncidentScreen(widget.province)));
                                    },
                                    child: Container(
                                      margin: const  EdgeInsets.all(8),
                                      width: width/4.8,
                                      height: height/40,
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent.withOpacity(0.4),
                                        borderRadius:  const BorderRadius.all(Radius.circular(5)),

                                      ),
                                      child: const Text('  Report Now',style: TextStyle(
                                          color: Colors.white
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    //requested Incident
                    SizedBox(width: width/50,),
                    Container(
                      decoration: const  BoxDecoration(
                        color: Color.fromRGBO(227, 234, 253, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      height: height/4,
                      width: width/2.2,
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Container(height:height,width:width/3,decoration:  const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/trackReports_icon.png'),opacity: 0.3),),)],),
                          Column(
                            children: [
                              SizedBox(height: height/60,),
                              Row(children: [SizedBox(width: width/32,), const Text('Track',style: TextStyle(
                                  color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 19
                              ),)],),
                              Row(children: [SizedBox(width: width/32,), const Text('Reports',style: TextStyle(
                                  color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 19
                              ),)],),
                              Row(
                                children: [
                                  SizedBox(width: width/70,),
                                  GestureDetector(
                                    onTap: (){
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> const AllhistoryScreens()));
                                    },
                                    child: Container(
                                      margin:  const EdgeInsets.all(8),
                                      width: width/4.8,
                                      height: height/40,
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent.withOpacity(0.4),
                                        borderRadius: const  BorderRadius.all(Radius.circular(5)),

                                      ),
                                      child:  const Text('  Check Now',style: TextStyle(
                                          color: Colors.white
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    SizedBox(width: width/50,),
                  ],
                ),

                 */
              ),
              SizedBox(height: height/30,),
              Container(
                width: width/1.1,
                height: height/4,
                decoration: const  BoxDecoration(
                    //color: Color.fromRGBO(240, 239, 255, 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(240, 239, 255, 1),
                      blurRadius: 5,
                      spreadRadius: 5,
                    )
                  ]
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: const  BoxDecoration(
                            image: DecorationImage(
                                opacity: 0.5,
                                image: AssetImage("assets/images/new_task.png")
                            ),
                          ),
                          width: width/2,
                          height: height/1.4,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: height/50,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: width/20),
                          child: Text(
                            'Create New \nTask',
                            style: TextStyle(
                                color: Colors.orangeAccent.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.bold

                            ),
                          ),
                        ),
                        MaterialButton(
                          shape:  const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                          minWidth: width/10,
                          height: height/20,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTaskScreen()));
                          },
                          color: Colors.lightBlueAccent,
                          child:  const Text("Create Now",style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
