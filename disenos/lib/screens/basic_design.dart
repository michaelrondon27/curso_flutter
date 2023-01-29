import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
   
  const BasicDesignScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(
           image: AssetImage('assets/landscape.jpeg')
          ),

          const Title(),

          const ButtonSection(),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text('Pariatur consectetur voluptate et enim et reprehenderit enim esse et laborum cillum sint culpa. Veniam ipsum ex consectetur duis qui incididunt est deserunt. Deserunt aliquip id cupidatat cillum tempor incididunt.')
          )
        ]
      )
    );
  }
}

class Title extends StatelessWidget {

  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
    
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.black45)
              )
            ]
          ),

          Expanded(child: Container()),
    
          const Icon(Icons.star, color: Colors.red),
    
          const Text('41')
        ]
      ),
    );
  }

}

class ButtonSection extends StatelessWidget {
  
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButton(
            icon: Icons.call,
            text: 'Call'
          ),
    
          CustomButton(
            icon: Icons.map_sharp,
            text: 'Route'
          ),
    
          CustomButton(
            icon: Icons.share,
            text: 'Share'
          )
        ]
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final String text;
  
  const CustomButton({
    Key? key, 
    required this.icon,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 30),

        Text(text, style: const TextStyle(color: Colors.blue))
      ],
    );
  }
}
