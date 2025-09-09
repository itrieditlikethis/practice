import 'package:flutter/material.dart';

class ReorderableListViewBuilder extends StatefulWidget {
  const ReorderableListViewBuilder({super.key});

  @override
  State<StatefulWidget> createState() => _ReorderableListViewBuilderState();
}

class _ReorderableListViewBuilderState
    extends State<ReorderableListViewBuilder> {
  final _listOfElements = List.generate(
    20,
    (index) => 'Element ${index.toString()}',
  );

  void onReorderElement(int oldIdx, int newIdx) {
    debugPrint('old: $oldIdx | new: $newIdx');
    setState(() {
      if (oldIdx < newIdx) {
        newIdx -= 1;
        debugPrint('old: $oldIdx | new: $newIdx');
      }

      final String draggedElement = _listOfElements.removeAt(oldIdx);
      _listOfElements.insert(newIdx, draggedElement);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ValueKey in reorderable list')),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          return Card(
            key: ValueKey(_listOfElements[index]),
            color: ColorScheme.of(context).primaryContainer,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text(
                _listOfElements[index],
                style: TextStyle(fontSize: 30),
              ),
              trailing: Icon(Icons.drag_handle),
              subtitle: TextField(style: TextStyle(fontSize: 25)),
              contentPadding: EdgeInsets.all(25),
            ),
          );
        },
        itemCount: _listOfElements.length,
        // buildDefaultDragHandles: false,
        onReorder: onReorderElement,
      ),
    );
  }
}
