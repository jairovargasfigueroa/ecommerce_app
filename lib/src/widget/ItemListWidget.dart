import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/src/controllers/api_service.dart';
import 'package:flutter/material.dart';

class ItemListWidget extends StatefulWidget {
  final Map<String, dynamic> config;

  const ItemListWidget({super.key, required this.config});

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  @override
  Widget build(BuildContext context) {
    final String apiUrl = widget.config['api'] as String;
    final List<Map<String, dynamic>> fields =
        List<Map<String, dynamic>>.from(widget.config['fields']);

    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo')),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService.instance.requestApi<List<dynamic>>(url: apiUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              // print('${item['id']} -> ${item['imagen']}');

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    item[fields[0]['prop']]?.toString() ?? fields[0]['default'],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: fields.skip(1).map<Widget>((field) {
                      final value =
                          item[field['prop']]?.toString() ?? field['default'];
                      return Text('${field['label']}: $value');
                    }).toList(),
                  ),
                  // leading: Image.network(
                  leading: widget.config['imgLeading'] != null
                      ? Image.network(
                          height: 60,
                          width: 60,
                          '${item[widget.config['imgLeading']]}',
                        )
                      : null,
                  trailing: widget.config['imgTrailing'] != null
                      ? Image.network(
                          height: 60,
                          width: 60,
                          '${item[widget.config['imgTrailing']]}',
                        )
                      : null,

                  // leading: item['actions'],
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
