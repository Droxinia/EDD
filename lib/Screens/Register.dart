import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up / Sign In Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showSignInForm = false;
  bool _showSignUpForm = false;

  void _toggleSignInForm() {
    setState(() {
      _showSignInForm = !_showSignInForm;
    });
  }

  void _toggleSignUpForm() {
    setState(() {
      _showSignUpForm = !_showSignUpForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up / Sign In Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Welcome to the app!',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _toggleSignInForm,
            tooltip: 'Sign In',
            child: const Icon(Icons.person),
          ),
          const SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: _toggleSignUpForm,
            tooltip: 'Sign Up',
            child: const Icon(Icons.person_add),
          ),
        ],
      ),
      persistentFooterButtons: <Widget>[
        if (_showSignInForm)
          Container(
            width: double.infinity,
            color: Colors.grey[100],
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  RaisedButton(
                    onPressed: () {},
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ),
          ),
        if (_showSignUpForm)
          Container(
            width: double.infinity,
            color: Colors.grey[100],
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
