import 'package:flutter/material.dart';
import 'package:partsbay/authentication/loginpage.dart';
import 'package:partsbay/provider/changeprovider.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Change(),
      child: Loginpage(),
    );
  }
}
