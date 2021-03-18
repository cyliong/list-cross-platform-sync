import 'package:flutter/material.dart';
import 'package:items/constants.dart';
import 'package:items/model/list_item.dart';
import 'package:items/page/item_page.dart';
import 'package:items/page/login_page.dart';
import 'package:items/service/authentication_service.dart';
import 'package:items/service/database_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ListItem>> _items;

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
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Log Out',
            onPressed: () async {
              await AuthenticationService().signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<ListItem>>(
            future: _items,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return items.isEmpty
                    ? Text(
                        'No Items',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey,
                        ),
                      )
                    : _buildListView(items);
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

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Item deleted"),
              duration: Duration(seconds: 1),
            ));
          },
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text('${item.title}'),
            onTap: () => _showInputDialog(item: item),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Future<void> _showInputDialog({ListItem? item}) async {
    final savedItem = await showDialog<ListItem>(
      context: context,
      builder: (context) => ItemPage(item: item),
    );
    if (savedItem != null) {
      setState(() {
        _items = DatabaseService().items;
      });
    }
  }
}
