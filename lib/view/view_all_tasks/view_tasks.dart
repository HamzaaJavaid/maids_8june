import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/constants/constants.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/network/baseAPINetwork.dart';
import 'package:project_managment_app_for_maids_by_hamzajavaid/utils/alertDialogs/alertDialog.dart';



class viewTasks extends StatefulWidget {
  String title;
  viewTasks(this.title);

  @override
  State<viewTasks> createState() => _viewTasksState();
}

class _viewTasksState extends State<viewTasks> {


  BaseAPINetwork baseAPINetwork = BaseAPINetwork();

  String getStatus(String completedValue) {
    bool isCompleted = completedValue.toLowerCase() == 'true';

    if (isCompleted) {
      return 'Completed';
    } else {
      return 'Pending';
    }
  }




  @override
  Widget build(BuildContext context) {
    final height = constants.device_height;
    final width  = constants.device_width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      title: Text('${widget.title} Tasks'),
        elevation: 6,

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(

            children: [

              SizedBox(height: 10,),
              FutureBuilder(
                  future: baseAPINetwork.GetAPIwithoutHeader(constants.getAllTasks),
                  builder: (context,AsyncSnapshot<dynamic>snapshots){
                    if(snapshots.connectionState==ConnectionState.waiting){
                      return Text('Loading');
                    }
                    else if (!snapshots.hasData){
                      return Text('No Data');
                    }
                    else {
                      return Container(
                        height: height,
                        width: width,
                        child: ListView.builder(
                            itemCount: 12,//snapshots.data.length,
                            itemBuilder: (context , index){
                              print(snapshots.data['todos'][index]['id']);
                              String status = getStatus(snapshots.data['todos'][index]['completed'].toString());
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap:(){


                                          showTaskCompletionConfirmationDialog(context , () async {

                                            var headers = {
                                              'Content-Type': 'application/x-www-form-urlencoded'
                                            };
                                            var request = http.Request('PUT', Uri.parse('https://dummyjson.com/todos/${snapshots.data['todos'][index]['id']}'));
                                            request.bodyFields = {
                                              'completed': 'true'
                                            };
                                            request.headers.addAll(headers);

                                            http.StreamedResponse response = await request.send();

                                            if (response.statusCode == 200) {
                                              print(await response.stream.bytesToString());
                                              Get.snackbar("Success", "Task Marked As Complete" ,  backgroundColor: Colors.green.withOpacity(0.6));

                                            }
                                            else {
                                            print(response.reasonPhrase);
                                            }


                                          });


                                        },
                                        child: Container(
                                          height:height/30,
                                          child: Center(
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                          ),
                                          width: width/10,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.all(Radius.circular(6))
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,), SizedBox(width: width/2,),
                                      SizedBox(width: 10,), SizedBox(width: 10,),
                                      InkWell(
                                        onTap:()async{

                                          //delete task here



                                          showDeleteDialog(context, ()async{

                                            var request = http.Request('DELETE', Uri.parse('https://dummyjson.com/todos/${snapshots.data['todos'][index]['id']}'));


                                            http.StreamedResponse response = await request.send();

                                            if (response.statusCode == 200) {
                                              print(await response.stream.bytesToString());
                                              Get.snackbar("Success", "Task Deleted SUCCESFULY" ,  backgroundColor: Colors.green.withOpacity(0.6));
                                            }
                                            else {
                                            print(response.reasonPhrase);
                                            }



                                          });





                                        },
                                        child: Container(
                                          height:height/30,
                                          child: Center(
                                            child: Text('X' ,style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18
                                            ),

                                            ),
                                          ),
                                          width: width/10,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(Radius.circular(6))
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height/4,
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,

                                          border: Border.all(color: Colors.orangeAccent ,width: 2),
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2,
                                                spreadRadius: 2,
                                                color: Colors.grey
                                            )
                                          ],

                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          //title of task
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(snapshots.data['todos'][index]['todo'],style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),

                                          //status of task

                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Text('Status of Task : '),
                                              ),
                                              SizedBox(width: 20,),
                                              Container(
                                                height: height/20,
                                                width: width/2,
                                                decoration: BoxDecoration(
                                                    color: status=='Completed'?Colors.green:Colors.red,
                                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                                ),
                                                child:Center(child: Text(getStatus(snapshots.data['todos'][index]['completed'].toString()) , style: TextStyle(
                                                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18
                                                ),),),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text('ID Number of Task:- '),
                                              SizedBox(width: width/4,),
                                              CircleAvatar(

                                                child: Center(
                                                  child: Text(snapshots.data['todos'][index]['id'].toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                  ),
                                                ),
                                                backgroundColor: Colors.cyan,
                                                radius: 30,
                                              ),
                                            ],
                                          )




                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Divider(
                                    color: Colors.black,
                                    endIndent: 10,
                                    indent: 19,
                                  ),
                                  SizedBox(height: 60,)
                                ],
                              );
                            }),
                      );
                    }
                  }
              ),


            ],
          ),
        ),
      ),
    );
  }
}
