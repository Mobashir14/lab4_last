import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ItemListScreen(),
    );
  }
}

// Stateful widget to manage state
class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hi '),
      ),
      body: Column(
        children: <Widget>[
          const HeaderWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  itemName: items[index],
                  onTap: () {
                    setState(() {
                      selectedItem = items[index];
                    });
                  },
                );
              },
            ),
          ),
          SelectedItemDisplay(selectedItem: selectedItem),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue.shade100,
      child: const Text(
        'Select an Item from the List Below',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
class ItemCard extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const ItemCard({
    required this.itemName,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(itemName),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}


class SelectedItemDisplay extends StatelessWidget {
  final String selectedItem;

  const SelectedItemDisplay({
    required this.selectedItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey.shade200,
      child: Text(
        selectedItem.isNotEmpty
            ? 'You selected: $selectedItem'
            : 'No item selected',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
