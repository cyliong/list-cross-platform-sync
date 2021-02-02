import 'package:flutter/material.dart';
import 'package:items/constants.dart';
import 'package:items/model/list_item.dart';
import 'package:items/page/item_page.dart';
import 'package:items/service/database_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<ListItem>> _items;

  @override
  void initState() {
    super.initState();
    _items = DatabaseService().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: Center(
        child: FutureBuilder<List<ListItem>>(
            future: _items,
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
        onPressed: () => _showInputDialog(),
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView _buildListView(List<ListItem> items) {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Dismissible(
          key: Key('item_dismissible_${item.id}'),
          onDismissed: (direction) async {
            await DatabaseService().deleteItem(item);
            setState(() {
              items.removeAt(index);
            });
          },
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text('${item.title}'),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Future<void> _showInputDialog() async {
    final savedItem = await showDialog<ListItem>(
      context: context,
      builder: (context) => ItemPage(),
    );
    if (savedItem != null) {
      setState(() {
        _items = DatabaseService().items;
      });
    }
  }
}
