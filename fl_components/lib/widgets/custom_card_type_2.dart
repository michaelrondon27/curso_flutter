import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {

  final String imageUrl;
  final String? name;
   
  const CustomCardType2({
    Key? key,
    required this.imageUrl,
    this.name
  }) : super(key: key);
  
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
          FadeInImage(
            fadeInDuration: const Duration(milliseconds: 300),
            fit: BoxFit.fill,
            height: 230,
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
          ),

          if (name != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(bottom: 10, right: 20, top: 10),
              child: Text(name!)
            )
        ],
      ),
    );
  }
}