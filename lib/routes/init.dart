import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// import '../components/task.dart';
// import 'package:lesson_one/data/task_inherited.dart';

import '../components/task.dart';
import '../data/task_dao.dart';
import 'form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Learning Progress',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoSlab'),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(40, 236, 249, 255),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 80),
          child: FutureBuilder<List<Task>>(
              future: TaskDao().findAll(),
              builder: (context, snapshot)
              {
                List<Task>? items = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return buildLoadingCenter();
                  case ConnectionState.waiting:
                    return buildLoadingCenter();
                  case ConnectionState.active:
                    return buildLoadingCenter();
                  case ConnectionState.done:
                    if (snapshot.hasData && items != null) {
                    print('imhere');
                      if (items.isNotEmpty) {

                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task task = items[index];
                            return task;
                          }
                      );
                    }
                    return Center(
                        child: Column(
                          children: const [
                            Icon(Icons.error_outline, size: 128),
                            Text(
                                'No Tasks to Display here...',
                            style: TextStyle(fontSize: 32),
                            ),
                          ],
                        ),);
                 }
                return const Text('Unknown Error...');
                }
              }),
            // TaskInherited.of(context).taskList,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (newContext) => FormScreen(taskContext: context))
              );
        },
          child: const Icon(Icons.add),
        ),
    );
  }

  Center buildLoadingCenter() {
    return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Loading...'),
                      ],
                    )
                  );
  }
}
