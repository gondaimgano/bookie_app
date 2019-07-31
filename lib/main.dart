import 'package:bookie_app/search.dart';
import 'package:bookie_app/showChoice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';
import 'package:intl/intl.dart';

void main() => runApp(BookieApp());

class BookieApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TransportSearch>(
          builder: (_) => TransportSearch(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookie App',
        theme: ThemeData(
            fontFamily: "Rubik",
            primarySwatch: Colors.deepOrange,
            ),
        home: Pot(),
      ),
    );
  }
}

class Pot extends StatelessWidget {
  final TextEditingController txtctl = TextEditingController();
  final TextEditingController txtctl0 = TextEditingController();
  final prefixIcon = Icon(Icons.donut_small);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: Colors.blueGrey,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "What is your destination ?",
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
          ),

          SliverToBoxAdapter(
              child: SizedBox(
            height: 12,
          )),
          SliverToBoxAdapter(
            child: Card(
              elevation: 25.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                color: Colors.white70,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    RoundTripPassengerContainer(),
                    SizedBox(
                      height: 12,
                    ),
                    //in here
                    FromToWidget(),
                    TransportTextFieldWidget(
                      prefixIcon: Icon(Icons.date_range),
                      label: Provider.of<TransportSearch>(context).dateFromTo(),
                      onPressed: () async{
                        var date=DateTime.now();
                       try{
                         DateTime from= await showDatePicker(context: context,
                           initialDatePickerMode: DatePickerMode.year,
                           initialDate: date,
                           firstDate:date,
                           lastDate: DateTime.now().add(Duration(days: 300,),),

                         );
                         Provider.of<TransportSearch>(context).fromDate=from.toString();
                         DateTime to= await showDatePicker(context: context,
                           initialDate: from,
                           firstDate:from,
                           lastDate: DateTime.now().add(Duration(days: 300,),),

                         );
                         Provider.of<TransportSearch>(context).toDate=to.toString();
                       }
                       on  Exception catch(ex){
                         var date=DateTime.now();
                         Provider.of<TransportSearch>(context).fromDate=date.toString();
                         Provider.of<TransportSearch>(context).fromDate=date.toString();
                        }
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TransportButtonWidget(),
                    SizedBox(
                      height: 40,
                    ),
                    Row(children: [
                      Text(
                        "How it works",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.done,
                        color: Colors.grey,
                      ),
                      title: Text("Search"),
                      subtitle:
                          Text("Find bus and flight prices across Zimbabwe"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.bookmark,
                        color: Colors.grey,
                      ),
                      title: Text("Compare"),
                      subtitle: Text(
                          "Choose the fastest and cheapest routes from 800+ partners"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.card_giftcard,
                        color: Colors.grey,
                      ),
                      title: Text("Book"),
                      subtitle: Text(
                          "Book tickets and get customer support 7 days a week throughout your journey"),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          )
          //SliverToBoxAdapter(child: ,)
        ],
      ),
      /*bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
        BottomNavigationBarItem(icon: Icon(Icons.feedback), title: Text("")),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text("")),
      ]),*/
    );
  }
}

class RoundTripPassengerContainer extends StatelessWidget {
  const RoundTripPassengerContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transNotifier=Provider.of<TransportSearch>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        InkWell(
          onTap: () async {
            var result = await showChoice(context, Choice.TRIP);
            //transNotifier.tripChoice=result;
          },
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            children: <Widget>[
              Text(transNotifier.tripChoice??"Round Trip"),
              RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () async {
            var result = await showChoice(context, Choice.PASSENGERS);
          },
          child: Row(
            children: <Widget>[
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 12,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  Text(Provider.of<TransportSearch>(context).totalAdults()),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 12,
                children: <Widget>[
                  Icon(
                    Icons.child_care,
                    color: Colors.grey,
                  ),
                  Text(Provider.of<TransportSearch>(context).noOfInfants),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TransportButtonWidget extends StatelessWidget {
  const TransportButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 40),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.deepOrange, borderRadius: BorderRadius.circular(8)),
      child: FlatButton(
          onPressed: () {},
          child: Text(
            "Search",
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          )),
    );
  }
}

class FromToWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var transNotifier=Provider.of<TransportSearch>(context);
    return Container(
      height: 115,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                TransportTextFieldWidget(

                  prefixIcon: Icon(Icons.donut_small),
                  label: transNotifier.fromPlace,
                  onPressed: () async{
                    var locationFrom=await find(context);
                    if(locationFrom!=null)
                      transNotifier.fromPlace=locationFrom;
                  },
                ),
                TransportTextFieldWidget(prefixIcon: Icon(Icons.pin_drop),
                    label: transNotifier.toPlace,
                    onPressed: () async{
                      var locationTo=await find(context);
                      if(locationTo!=null)
                        transNotifier.toPlace=locationTo;
                    },),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {},
                child: RotatedBox(
                  child: Icon(
                    Icons.compare_arrows,
                    color: Colors.grey,
                  ),
                  quarterTurns: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransportTextFieldWidget extends StatelessWidget {
TransportTextFieldWidget({
    Key key,
    @required this.prefixIcon,
    this.onPressed,
    this.label,
   // this.transNotifier,
  }) : super(key: key);

  final Widget prefixIcon;
 final  String label;
  final Function onPressed;
 // final TransportSearch transNotifier;
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      width: double.infinity,
      child: InkWell(
        onTap:onPressed?? () async => await find(context),
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              labelText: label ?? "From City, Location",
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              contentPadding: EdgeInsets.all(4),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(style: BorderStyle.none, width: 0))),
        ),
      ),
    );
  }
}
