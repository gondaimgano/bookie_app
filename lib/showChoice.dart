import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models.dart';
enum Choice{
 TRIP,
 PASSENGERS
}

Future<String> showChoice(BuildContext context,Choice choice) async{
  var result=await showModalBottomSheet(context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
    ),
    builder: (context)=>_show(choice),);

  return result;
}

Widget _show(Choice choice)=>choice==Choice.TRIP?_tripChoices():_passengerChoices();

Widget _tripChoices()=>Consumer<TransportSearch>(
  builder: (context,model,child){
    return Container(
      padding: EdgeInsets.all(16),
      height: 150,
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: ()=>model.tripChoice="Round Trip",
              child: ListTile(leading:Icon(Icons.done),title: Text("Round Trip"),)),
          InkWell(
            onTap: ()=>model.tripChoice="One Trip",
              child: ListTile(leading:Icon(Icons.done),title: Text("One Trip"),)),
        ],
      ),
    );
  },

);

Widget _passengerChoices()=>Container(
  height: 400,
  child: Column(
    children: <Widget>[

    ],
  ),
);
