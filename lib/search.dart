import 'package:flutter/material.dart';
import 'customShowSearch.dart';

import 'api.dart';

Future<String> find(BuildContext context) async {
  //showSearch(context: null, delegate: null)
  String cool = await showSearchWithHeader(context: context, delegate: PlaceDelegate());
  return cool;
}

enum Destination{
  To,
  From
}

class PlaceDelegate extends CustomSearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      FlatButton(child: Text("Clear"),
      onPressed: ()=>query="",)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return InkWell(
      onTap: () => close(context, null),
      child: Icon(Icons.close),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: searchStrings(query),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return ListView(
              children: snapshot.data.map((t) =>
                  InkWell(
                    onTap: ()=>close(context,t),
                    child: ListTile(title:
                    Text(t),),
                  ),
              ).toList()


          );
        if(snapshot.hasError)
          return Center(
            child:Icon(Icons.warning,size: 200,color: Colors.red,)
          );

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();

  }
}
