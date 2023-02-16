import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

import '../components/task.dart';
import '../data/task_dao.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isValid({required String? value, type}) {
    if (value == null) return false;
    if (value.isNotEmpty && type == null) return true;
    if (type == 'url') return value.contains('http');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Module'),
        ),
        body: Center(
          child: Container(
            height: 650, width: 375,
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        validator: (String? value) {
                          return (isValid(value: value))
                              ? null
                              : 'Insert the Module Name';
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border:  OutlineInputBorder(),
                          hintText: 'Module Name',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: difficultyController,
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          return (isValid(value: value) &&
                              int.parse(value!) >= 1 &&
                              int.parse(value) <= 5)
                          ? null
                          : 'Insert the Difficulty Level.';
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border:  OutlineInputBorder(),
                          hintText: 'Difficulty',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: imageController,
                        keyboardType: TextInputType.url,
                        validator: (value) {
                          return (isValid(value: value, type: 'url'))
                              ? null
                              : 'Insert the Image URL';
                        },
                        onChanged: (text) {
                          setState(() {
                          });
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border:  OutlineInputBorder(),
                          hintText: 'Image',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (
                              BuildContext context,
                              Object exception,
                              StackTrace? stackTrace) {
                            return Container(color: Colors.white);
                          },
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()) {
                            TaskDao().create(Task(
                                title: nameController.text,
                                difficulty: int.parse(difficultyController.text),
                                path: imageController.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Saving...'),
                                ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Add'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
