import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransportSearch with ChangeNotifier{
  String _tripChoice="Round Trip";
  String _noOfAdults="0";
  String _noOfChildren="0";
  String _noOfInfants="0";
  String _fromPlace="From City, Location";
  String _toPlace="To City, Location";
  String _toDate;
  String _fromDate;

  String get tripChoice=>_tripChoice;
  String get noOfAdults=>_noOfAdults;
  String get noOfChildren=>_noOfChildren;
  String get noOfInfants=>_noOfInfants;
  String get fromPlace=>_fromPlace;
  String get toPlace=>_toPlace;
  String get fromDate=>_fromDate;
  String get toDate=>_toDate;

  set tripChoice(String p){
    _tripChoice=p;
    notifyListeners();
  }
  set noOfAdults(String p){
    _noOfAdults=p;
    notifyListeners();
  }
  set noOfChildren(String p){
    _noOfChildren=p;
    notifyListeners();
  }
  set noOfInfants(String p){
    _noOfInfants=p;
    notifyListeners();
  }
  set fromPlace(String p){
    _fromPlace=p;
    notifyListeners();
  }
  set toPlace(String p){
    _toPlace=p;
    notifyListeners();
  }
  set toDate(String p){
    _toDate=p;
    notifyListeners();
  }
  set fromDate(String p){
    _fromDate=p;
    notifyListeners();
  }


}