import 'package:bookie_app/search.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookie App',
      theme: ThemeData(
          fontFamily: "Rubik",
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey,
              contentPadding: EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))))),
      home: BookieApp(),
    );
  }
}

class BookieApp extends StatelessWidget {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 12,
                          children: <Widget>[
                            Text("Round Trip"),
                            RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 12,
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                Text("0"),
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
                                Text("0"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    //in here
                    FromToWidget(),
                    TransportTextFieldWidget(
                      prefixIcon: Icon(Icons.date_range),
                      label: DateTime.now().toString(),
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
      bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
        BottomNavigationBarItem(icon: Icon(Icons.feedback), title: Text("")),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text("")),
      ]),
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
    return Container(
      height: 115,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                TransportTextFieldWidget(
                  prefixIcon: Icon(Icons.donut_small),
                ),
                TransportTextFieldWidget(prefixIcon: Icon(Icons.pin_drop)),
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
  const TransportTextFieldWidget({
    Key key,
    @required this.prefixIcon,
    this.label,
  }) : super(key: key);

  final Icon prefixIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      width: double.infinity,
      child: InkWell(
        onTap: () async => await find(context) ,
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              labelText: label ?? "City, Location",
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
