import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
   
  const CustomCardType2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 30,
      shadowColor: AppTheme.primaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
      ),
      child: Column(
        children: [
          const FadeInImage(
            fadeInDuration: Duration(milliseconds: 300),
            fit: BoxFit.fill,
            height: 230,
            image: NetworkImage('https://thelandscapephotoguy.com/wp-content/uploads/2019/01/landscape%20new%20zealand%20S-shape.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
          ),

          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(bottom: 10, right: 20, top: 10),
            child: const Text('Un hermoso paisaje')
          )
        ],
      ),
    );
  }
}