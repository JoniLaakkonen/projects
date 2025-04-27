import 'dart:convert';

import 'package:filmit/provider/colorprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'homepage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String _message = '';
  bool _agreeTerms = false;


  // Example: Replace with your actual server URL
  final String url = "https://your-server-url.com/login.php";

  Future<void> _signup() async {
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
            _message = "Account creation successful!";
          });
        } else {
          setState(() {
            _message = "Username or pasword is not valid. It must contain (....)";
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
        backgroundColor: Colors.transparent,
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
            padding: const EdgeInsets.fromLTRB( 16.0, 100.0, 16.0, 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                  'Sign up', // Header text
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
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorProvider.secondary,
                      padding: const EdgeInsets.symmetric(vertical:16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                    onPressed: _signup,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center-align items
                      children: [
                        Image.asset(
                          'lib/images/apple.png', // Path to your image asset
                          width: 24.0, // Set the desired width for the icon
                          height: 24.0, // Set the desired height for the icon
                        ),
                        const SizedBox(width: 8.0), // Space between icon and text
                        Text(
                          "Continue with Apple",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: colorProvider.textColorLGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorProvider.secondary,
                      padding: const EdgeInsets.symmetric(vertical:16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                    onPressed: _signup,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center-align items
                      children: [
                        Image.asset(
                          'lib/images/google.png', // Path to your image asset
                          width: 24.0, // Set the desired width for the icon
                          height: 24.0, // Set the desired height for the icon
                        ),
                        const SizedBox(width: 8.0), // Space between icon and text
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: colorProvider.textColorLGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text("OR",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: colorProvider.textColorLight,
                  ),
                ),
                const SizedBox(height: 16.0),
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
                    hintText: 'Email',
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
                  child: Row(
                    children: [
                      Checkbox(
                        value: _agreeTerms,
                        semanticLabel: 'Agree terms of usage.',
                        onChanged: (bool? newValue) {
                          setState(() {
                            _agreeTerms = newValue ?? false; // Update state
                          });
                        },
                      ),
                    ],
                  )
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
                    onPressed: _signup,
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                        color: colorProvider.textColorLight,
                      ),
                    ),
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