import 'package:flutter/material.dart';
import 'package:items/constants.dart';
import 'package:items/model/list_item.dart';
import 'package:items/service/database_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: Center(
        child: FutureBuilder<List<ListItem>>(
            future: DatabaseService().items,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildListView(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView _buildListView(List<ListItem> items) {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${items[index].title}'),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
