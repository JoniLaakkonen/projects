import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:markitup/pages/signuppage.dart';
import 'package:markitup/provider/colorprovider.dart';
import 'package:provider/provider.dart';

import 'tasklistpage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String _message = '';


  // Example: Replace with your actual server URL
  final String url = "https://your-server-url.com/login.php";

  Future<void> _login() async {
    // Basic input validation
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _message = "Please enter both username and password";
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
    // Sending a POST request to the server
    final res = await http.post(
      Uri.parse(url),
      body: {
        'username': _usernameController.text,
        'password': _passwordController.text,  
        //ensure that the communication between your Flutter app and server is over HTTPS to 
        //protect sensitive user information (like passwords). You should also consider 
        //hashing passwords server-side instead of sending them in plain text    
    });

    setState(() {
      _isLoading = false;
    });

          if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        if (data['success']) {
          setState(() {
            _message = "Login successful!";
          });
        } else {
          setState(() {
            _message = "Invalid username or password";
          });
        }
      } else {
        setState(() {
          _message = "Error: ${res.statusCode}. Please try again.";
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _message = "An error occurred: Please try again or contact the support";
      });
    }
  }
  void _tosingup() {
    // Handle forgot password functionality here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  }
  void _forgotPassword() {
    // Handle forgot password functionality here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TasklistPage()),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: colorProvider.primary,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end, // Align title to the right
          children: [
            Text(
              "Taskflow",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: colorProvider.textColorLight, // White color for header
              ),
            ),
          ],
        ),
        centerTitle: false, // Prevent automatic centering of the title
        backgroundColor: colorProvider.primary,
        elevation: 0,  // Remove shadow/elevation
      ),
      //Desice wheter still loading or to show login format
      body: SingleChildScrollView(  // Wrap in SingleChildScrollView
        child: Center(child: _isLoading
        ? const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 200.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CircularProgressIndicator(),] // Centered spinner
            )
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB( 16.0, 150.0, 16.0, 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                  'Log in', // Header text
                  style: TextStyle(
                    fontSize: 46.0,
                    fontWeight: FontWeight.bold,
                    color: colorProvider.textColorLight, // White color for header
                  ),
                ),
                const SizedBox(height: 50.0),
                Align(
                  alignment: Alignment.center, // Align to the left
                  child: Text(
                    _message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorProvider.warning,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(  borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(  borderSide: BorderSide(color: Color(0xFF17252A)),
                    ),
                    fillColor: colorProvider.textColorLight,
                    filled: true,
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: colorProvider.textColorLGray, // White color for header
                    ),
                  ),
                    obscureText: false,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(  borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(  borderSide: BorderSide(color: Color(0xFF17252A)),
                    ),
                    fillColor: colorProvider.textColorLight,
                    filled: true,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: colorProvider.textColorLGray, // White color for header
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft, // Align to the left
                  child: TextButton(
                    onPressed: _forgotPassword,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: colorProvider.textColorLight, // Custom color for the link
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorProvider.primary,
                      padding: const EdgeInsets.symmetric(vertical:16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                    onPressed: _login,
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                        color: colorProvider.textColorLight,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: _tosingup,
                    child: Text(
                      "Don't have account yet? Sing up here.",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: colorProvider.textColorLight,
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}