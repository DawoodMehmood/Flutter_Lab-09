import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  fetchUsername() async {
    return Future.delayed(
        Duration(
          seconds: 3,
        ),
        () => 'Asim');
  }
  addHello(user) {
    return 'Hello $user';
  }
  greetUser() async {
    String username = await fetchUsername();
    return addHello(username);
  }
  sayGoodbye() async {
    try {
      String result = await logoutUser();
      return '$result Thanks, see you next time';
    } catch (e) {
      return 'Caught error: ${e.toString()}';
    }
  }
  logoutUser() async {
    return Future.delayed(Duration(milliseconds: 500), () => 'Asim');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 1'),
      ),
      body: Center(
        child: FutureBuilder(
          future: greetUser(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? CircularProgressIndicator()
                  : snapshot.connectionState == ConnectionState.done
                      ? Text('${snapshot.data}')
                      : Text('Error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String message = await sayGoodbye();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
