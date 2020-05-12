import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  String _username, _email, _password;
  
   bool _obscureText = true;

  void _submit() {
    final form = _formkey.currentState;

    if (form.validate()) {
      form.save();
      print('username: $_username, Email: $_email, Password: $_password');
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Hello',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text(
                    'There',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(230.0, 175.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (val) => _username = val,
                      validator: (val) => val.length < 6 ? 'Username too short' : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                            icon: Icon(Icons.person),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (val) => _email = val,
                      validator: (val) => !val.contains('@') ? 'Invalid email' : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                            icon: Icon(Icons.email),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (val) => _password = val,
                      validator: (val) => val.length < 6 ? 'Password too short' : null,
                      obscureText: _obscureText,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() => _obscureText = !_obscureText);
                            },
                            child: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off
                              ),
                          ),
                          border: OutlineInputBorder(),
                            icon: Icon(Icons.lock),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        )
                      ),
                    ),
                  ),
                SizedBox(height: 5.0,),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(children: <Widget>[
                    RaisedButton(
                      child: Text('Submit'),
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      color: Colors.cyan,
                      onPressed: _submit,
                    ),
                    FlatButton(
                      child: Text('Existing user? Login'),
                      onPressed: () => print('user'),
                    )
                  ],),
                ),

                // Container(
                //   alignment: Alignment(1.0, 0.0),
                //   padding: EdgeInsets.only(top: 15.0, left: 20.0),
                //   child: InkWell(
                //     onTap: () => print('fuckoff'),
                //     child: Text('Forget Password',
                //     style: TextStyle(color: Colors.green,
                //     fontWeight: FontWeight.bold,
                //     fontFamily: 'MontSerrat',
                //     decoration: TextDecoration.underline
                //      ),
                //     ),
                //   ),
                //  )
               ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

