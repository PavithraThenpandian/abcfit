import 'package:abc_fit/pallete.dart';
import 'package:flutter/material.dart';

import 'navbar.dart';

class Home extends StatelessWidget {
  Home();
  @override
  Widget build(BuildContext context) {
    // ThemeData(primaryColor: Colors.black87);
    return Scaffold(
      // backgroundColor: Colors.grey[700],

      body: Navbar(),
    );
  }
}
