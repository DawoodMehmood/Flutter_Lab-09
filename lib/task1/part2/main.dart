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

  reportLogins() async {
    int loginNumber = await fetchLoginAmount();
    return 'Total number of logins: $loginNumber';
  }
  changeUsername() async {
    try {
      String username = await fetchNewUsername();
      return username;
    } catch (e) {
      return e.toString();
    }
  }
  fetchLoginAmount() async {
    return Future.delayed(
        Duration(
          seconds: 1,
        ),
        () => 57);
  }
  fetchNewUsername() async {
    return Future.delayed(
        Duration(
          seconds: 3,
        ),
        () => 'Asim');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 1'),
      ),
      body: Center(
        child: FutureBuilder(
          future: reportLogins(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? CircularProgressIndicator()
                  : snapshot.connectionState == ConnectionState.done
                      ? Text('${snapshot.data}')
                      : Text('Error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
