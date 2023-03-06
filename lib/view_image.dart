import 'package:flutter/material.dart';
import 'widget/icon_button.dart';
import 'package:flutter/cupertino.dart';

class ViewImage extends StatelessWidget{
  const ViewImage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: CupertinoIcons.back,
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Center(
        child: Hero(
            tag: 'my_download',
            child: Image(image: const AssetImage('repo/my_download.jpg'), width: MediaQuery.of(context).size.width * 0.9,))
      ),
    );
  }
}