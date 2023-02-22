import 'package:crud_app/util/dialog_box.dart';
import 'package:crud_app/util/todo_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageChanged = 0;
  // text Controller
  final _controller = TextEditingController();

  // list of todo tasks
  List toDoList = [
    ["Make Coffee", false],
    ["Do hike", true],
  ];

  // Completed Tasks lists
  List toDoComp = [];

  // Checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      value == true
          ? toDoComp.add(toDoList[index])
          : toDoComp.remove(toDoList[index]);
    });
  }

  //On Save Method
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Create a New Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //Delete All Task
  void deleteAll() {
    setState(() {
      toDoComp = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          'TO DO',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 99, 122, 248)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              pageController.animateToPage(++pageChanged,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic);
            },
            icon: Icon(Icons.check),
          )
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pageChanged == 0 ? createNewTask : deleteAll,
        child: pageChanged == 0 ? Icon(Icons.add) : Icon(Icons.close),
      ),
      body: PageView(
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            pageChanged = index;
          });
        },
        controller: pageController,
        children: [
          ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onchanged: (value) => checkBoxChanged(value, index),
              );
            },
          ),

          // SecondPage
          toDoComp.length != 0
              ? ListView.builder(
                  itemCount: toDoComp.length,
                  itemBuilder: (context, index) {
                    return ToDoTile(
                      taskName: toDoComp[index][0],
                      taskCompleted: toDoComp[index][1],
                      onchanged: (value) => checkBoxChanged(value, index),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "No Completed tasks!!",
                    style: TextStyle(
                      color: Colors.white12,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
