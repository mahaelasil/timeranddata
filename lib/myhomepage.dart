// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime=DateTime(2022,02,25,12,30);
  TimeOfDay time=const TimeOfDay(hour: 07,minute: 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${dateTime.day}/${dateTime.month}/${dateTime.year}''-${dateTime.hour}:${dateTime.month}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Select date & time',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: ()async{
           DateTime?newDate= await showDatePicker(
           context:context,
            initialDate:dateTime,
            firstDate:DateTime(2000),
            lastDate:DateTime(2100),
            );
           if(newDate==null)return;

           TimeOfDay?newTime=await showTimePicker(
             context: context,
               initialTime: time,
           );
           if(newTime==null)return;

           setState(() {
             dateTime=newDate;
             time=newTime;
           }
           );
                },

            ),
          ],
        ),
      ),
    );
  }
}
