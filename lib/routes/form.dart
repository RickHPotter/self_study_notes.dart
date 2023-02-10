import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                          if(value != null && value.isEmpty) {
                          return 'Insert the Module Name';
                          }
                          return null;
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
                        validator: (value) {
                          int v = int.parse(value!);
                          if(value.isEmpty || v < 1 || v > 5) {
                            return 'Insert the Difficulty Level';
                          }
                          return null;
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
                          return value!.isEmpty ? 'Insert the Image URL' : null;
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
