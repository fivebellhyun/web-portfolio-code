import 'package:flutter/material.dart';

class Responsive extends StatelessWidget{
  const Responsive({super.key, required this.mobile, this.mobileLarge, this.tablet, required this.desktop});

  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop; 

  static bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width <= 500;

  static bool isMobileLarge(BuildContext context) =>
    MediaQuery.of(context).size.width <= 700;
  
  static bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width < 1024;
  
  static bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1024;

  @override 
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    if(size.width >= 1024){
      return desktop;
    } else if(size.width >= 700 && tablet != null){
      return tablet!;
    } else if(size.width >= 450 && mobileLarge != null){
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}