import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
  const CustomAppBar({super.key});
  
  @override 
  Widget build(BuildContext context){
    return Container(
      height: 50,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16)
          )
        ]
      ),
      child: Row(children: [
        Image.asset("repo/water.png", height: 50,),
        const SizedBox(width: 5,),
        const Text('Toass\'s Portfolio', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        MenuItem(
          title: 'test', 
          function: (){}),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: const Icon(Icons.search, size: 20,),
          ),
        ),
        const SizedBox(width: 20,)
      ]),
    );
  }
}

class MenuItem extends StatelessWidget{
  const MenuItem({Key? key, required this.title, required this.function}) : super(key: key);
  final String title;
  final Function function;

  @override 
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){
        function;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
    );
  }
}