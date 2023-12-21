import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  var arrToDoList = [];
  var txbItem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.comment_outlined, color: Colors.blue,),
              labelText: "Please input here...",
              enabledBorder: myInputBorder(),
              focusedBorder: myFocusBorder()
            ),
            controller: txbItem,
          ),
          SizedBox(height: 10.0,),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                if (txbItem.text != "") {
                  arrToDoList.add(txbItem.text);
                }
              });
              txbItem.text = "";
            },
            icon: Icon(Icons.add, color: Colors.white,),
            label: Text(
              "Save",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              )
            ),
          ),
          ListView.builder(
            shrinkWrap: true ,
            itemCount: arrToDoList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                confirmDismiss: (e) async {
                  return await showDialog(
                    context: context,
                    barrierColor: Colors.grey.withOpacity(0.5),
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        content: Text(
                          "Do you want to delete this record?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        actions: [
                          FloatingActionButton(
                            backgroundColor: Colors.redAccent,
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Icon(Icons.delete_outline_rounded, color: Colors.white, size: 35.0,),
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.redAccent,
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Icon(Icons.cancel_outlined, color: Colors.white, size: 35.0,),
                          )
                        ],
                      );
                    },

                  );
                },
                background: Container(
                  color: Colors.red,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  alignment: Alignment.centerRight,
                  child: Center(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.orangeAccent
                  ),
                  child: ListTile(
                    title: Text(
                      "${arrToDoList[index]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0
                      ),
                    ),
                    leading: Icon(Icons.description_outlined, color: Colors.white,),
                    trailing: InkWell(
                      child: Icon(Icons.remove_circle_outline, color: Colors.white,),
                      onTap: () {
                        setState(() {
                          arrToDoList.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  OutlineInputBorder myInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 3.0
      )
    );
  }

  OutlineInputBorder myFocusBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderSide: BorderSide(
            color: Colors.orangeAccent,
            width: 3.0
        )
    );
  }
}
