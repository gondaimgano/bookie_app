import 'dart:async';
import 'dart:io';

const List<String> myhome=[
  "London",
  "Madrid",
  "Sydney",
  "Bolivia",
  "Sussex",
  "Grandila",
  "Capetown",

];

Future<List<String>> searchStrings(String query) async{

   List<String> results = await Future.delayed(Duration(seconds: 5), () => myhome.where((target) => target.toLowerCase().contains(query.toLowerCase())).toList());


   return results;


}