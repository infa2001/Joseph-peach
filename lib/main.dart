import 'package:flutter/material.dart';
import 'package:login_pagebloc/pagetwo.dart';
import 'package:login_pagebloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Peach Bloc Pattern"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context, snapshot) => TextField(
                  onChanged: bloc.emailChanged,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter email",
                      labelText: "Email",
                      errorText: 'snapshot.error'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder: (context, snapshot) => TextField(
                  onChanged: bloc.passwordChanged,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter password",
                      labelText: "Password",
                      errorText: 'snapshot.error'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder: (context, snapshot) => RaisedButton(
                  color: Colors.tealAccent,
                  onPressed:
                      snapshot.hasData ? () => changeThePage(context) : null,
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

RaisedButton(
    {required MaterialAccentColor color,
    Function()? onPressed,
    required Text child}) {}
