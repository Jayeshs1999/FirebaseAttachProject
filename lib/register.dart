import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return registrationState();
  }
}
class registrationState extends State<Register>{
  final fb=FirebaseDatabase.instance;
  var retrieveName="";
  String name="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ref=fb.reference().child("Student");
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Attach"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),

                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      hintText: "Enter your name"
                    ),
                    onChanged: (value){
                      setState(() {
                        name=value;
                      });
                    },
                  )
              ),
            RaisedButton(onPressed: (){
              ref.child("name").set(name);

            },
            child:Text("Keep this in firebase"),
            ),
          ],
        ),

      ),
    );
  }

}