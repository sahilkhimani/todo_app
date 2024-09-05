import 'package:flutter/material.dart';

class TasksTodo extends StatefulWidget {
  const TasksTodo({super.key});

  @override
  State<TasksTodo> createState() => _TasksTodoState();
}

class _TasksTodoState extends State<TasksTodo> {
  List<String> tasksList = ["sahil ", "asif"];
  TextEditingController taskController = TextEditingController();
  TextEditingController taskEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Todo List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Container(
                        height: 70,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ]),
                        child: Center(
                          child: ListTile(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return editDialogue(
                                        tasksList[index], index);
                                  });
                            },
                            tileColor: Colors.white,
                            leading: CircleAvatar(
                              backgroundColor: Colors.limeAccent,
                              foregroundColor: Colors.black,
                              child: Text("${index + 1}"),
                            ),
                            title: Text(
                              tasksList[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  tasksList.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border:
                      Border.all(style: BorderStyle.solid, color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your task",
                          contentPadding: EdgeInsets.only(left: 10)),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.limeAccent,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        if (taskController.text != "") {
                          setState(() {
                            tasksList.add(taskController.text);
                            taskController.clear();
                          });
                        }
                      },
                      child: const Text("Add"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget editDialogue(String taskText, int taskIndex) {
    return AlertDialog(
      title: const Text("Edit Task"),
      icon: const Icon(Icons.edit),
      content: TextField(
        controller: taskEditController,
        decoration: InputDecoration(
          hintText: taskText,
          contentPadding: const EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              if (taskEditController.text != "") {
                setState(() {
                  tasksList[taskIndex] = taskEditController.text;
                  taskEditController.clear();
                });
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
  }
}
