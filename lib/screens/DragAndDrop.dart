import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list_expansion.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

class FlutterDrageAndDrop extends StatefulWidget {
  const FlutterDrageAndDrop({super.key});

  @override
  State<FlutterDrageAndDrop> createState() => _FlutterDrageAndDropState();
}

// create class
class InnerList {
  final String name;
  List<String> content;
  InnerList({required this.name, required this.content});
}

class _FlutterDrageAndDropState extends State<FlutterDrageAndDrop> {
  late List<InnerList> _list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = List.generate(5, (outerIndex) {
      return InnerList(
        name: outerIndex.toString(),
        content: List.generate(3, (innerIndex) => '$outerIndex.$innerIndex')
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Drag And Drop"),
      ),
      body: DragAndDropLists(
        children: List.generate(_list.length, (index) => _buildList(index)),
        onItemReorder: _onItemReorder,
        onListReorder: _onListReOrder,
        listGhost: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(7)
              ),
              child: Icon(Icons.add_box),
            ),
          ),
        ),
      ),
    );
  }

  _buildList(int outerIndex) {
    var innerList = _list[outerIndex];
    return DragAndDropListExpansion(
      title: Text('List ${innerList.name}'),
      subtitle: Text('Subtitle ${innerList.name}'),
      leading: Icon(Icons.ac_unit),
      children: List.generate(innerList.content.length, (index) =>
          _buildItem(innerList.content[index]),
      ),
      listKey: ObjectKey(innerList)
    );
  }

  _buildItem(String item) {
    return DragAndDropItem(
      child: ListTile(
        title: Text(item),
      )
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex
      ) {
    setState(() {
      var movedItem = _list[oldListIndex].content.removeAt(oldItemIndex);
      _list[newListIndex].content.insert(newItemIndex, movedItem);
    });
  }

  _onListReOrder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _list.removeAt(oldListIndex);
      _list.insert(newListIndex, movedList);
    });
  }
}
