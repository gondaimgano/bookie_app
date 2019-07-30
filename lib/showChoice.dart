import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models.dart';

enum Choice { TRIP, PASSENGERS }

Future<String> showChoice(BuildContext context, Choice choice) async {
  var result = await showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40))),
    builder: (context) => _show(choice),
  );

  return result;
}

Widget _show(Choice choice) =>
    choice == Choice.TRIP ? _tripChoices() : _passengerChoices();

Widget _tripChoices() => Consumer<TransportSearch>(
      builder: (context, model, child) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 150,
          child: ListView(
            children: <Widget>[
              InkWell(
                  onTap: () => model.tripChoice = "Round Trip",
                  child: ListTile(
                    leading: Icon(Icons.done),
                    title: Text("Round Trip"),
                  )),
              InkWell(
                  onTap: () => model.tripChoice = "One Trip",
                  child: ListTile(
                    leading: Icon(Icons.done),
                    title: Text("One Trip"),
                  )),
            ],
          ),
        );
      },
    );

Widget _passengerChoices() => Consumer<TransportSearch>(
      builder: (context, model, child) => Container(
        height: 450,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Text(
              "Passengers",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text("Adult"),
              subtitle: Text("More than 14 years old"),
              trailing: Wrap(
                spacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => model.calcAdults(1),
                  ),
                  Text(model.noOfAdults),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () =>model.calcAdults(-1),
                  )
                ],
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Children"),
              subtitle:
                  Text("In france bla blabla \n blabla bla \nbla bla bla \n"),
              trailing: Wrap(
                spacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => model.calcChildren(1),
                  ),
                  Text(model.noOfChildren),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => model.calcChildren(-1),
                  )
                ],
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Infants"),
              subtitle: Text("Below the age of 5 years"),
              trailing: Wrap(
                spacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () =>model.calcInfants(1),
                  ),
                  Text(model.noOfInfants),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () =>model.calcInfants(-1),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
