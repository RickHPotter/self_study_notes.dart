import 'package:flutter/material.dart';

import 'form.dart';
import '../components/task.dart';
import '../data/task_dao.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh_sharp)),
        ],
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
        padding: const EdgeInsets.only(top: 8, bottom: 80),
        child: FutureBuilder<List<Task>> (
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              debugPrint('[INIT SCREEN] Listing all tasks...');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return buildLoadingCenter();
                case ConnectionState.waiting:
                  return buildLoadingCenter();
                case ConnectionState.active:
                  return buildLoadingCenter();
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (newContext) => FormScreen(taskContext: context)
              )
          ).then((value) => setState(() {
            debugPrint('[INIT_SCREEN] Reloading Initial Screen...');
          }));
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
      ));
  }
}
