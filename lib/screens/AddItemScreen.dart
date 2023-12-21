import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _items = ["Item"];
  GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, "Item added ${_items.length + 1} time(s)");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 2));
  }

  void _removeItem(int index, BuildContext context) {
    AnimatedList.of(context).removeItem(index, (_, animation) {
      return FadeTransition(
       opacity: animation,
       child: SizeTransition(
         sizeFactor: animation,
         child: SizedBox(
           height: 150,
           child: Card(
             margin: const EdgeInsets.symmetric(vertical: 20),
             elevation: 10,
             color: Colors.red[400],
             child: const Center(
               child: Text(
                 "Item was deleted",
                 style: TextStyle(
                   fontSize: 28,
                   color: Colors.white
                 ),
               ),
             ),
           ),
         ),
       ),
      );
    }, duration: const Duration(seconds: 2));

    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Item"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: Icon(Icons.add_box_rounded),
          )
        ],
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: 1,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            key: UniqueKey(),
            position: Tween<Offset>(
              begin: const Offset(-1, -0.5),
              end: const Offset(0, 0)
            ).animate(animation),
            child: RotationTransition(
              turns: animation,
              child: SizeTransition(
                axis: Axis.vertical,
                sizeFactor: animation,
                child: SizedBox(
                  height: 150,
                  child: InkWell(
                    onTap: () => _removeItem(index, context),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      elevation: 10,
                      color: Colors.primaries[
                      (index * 100) % Colors.primaries.length][300],
                      child: Center(
                        child: Text(
                          _items[index],
                          style: const TextStyle(
                            fontSize: 28
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
