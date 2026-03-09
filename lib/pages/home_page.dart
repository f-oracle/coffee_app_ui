// ignore_for_file: sized_box_for_whitespace, unused_import

import 'package:coffeeappui/utils/coffee_tile.dart';
import 'package:coffeeappui/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   // 1. Selection State
  String selectedType = 'All'; 
  // list of coffee types 
  final List coffeeType = [
    // [coffee type, isSelected]
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];


  // user tapped on coffee types 
  void coffeeTypeSelected(int index){
    setState(() {
      // this for loop make every selection false
      for (int i = 0; i < coffeeType.length; i++){
        coffeeType[i][1]= false;
      }
      coffeeType[index][1] = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(Icons.menu, color: Colors.white),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Padding(padding: const EdgeInsetsGeometry.only(right: 20.0)),
          Icon(Icons.person),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 56),
            ),
          ),

          SizedBox(height: 25),

          //Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          SizedBox(height: 25),

          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context,index){
              return CoffeeType(
                coffeeType: coffeeType[index][0],
                isSelected: coffeeType[index][1],
                onTap: (){
                  coffeeTypeSelected(index);
                },
              );
            })
          ),

          // horizontal listview of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
               CoffeeTile(
                coffeeImagePath: 'lib/images/coffee2.jpg',
                coffeeName: 'Latte',
                coffeePrice: '4.20',
               ),
                CoffeeTile(
                coffeeImagePath: 'lib/images/coffee3.jpg',
                coffeeName: 'Cappiccuno',
                coffeePrice: '4.10',
               ),
                CoffeeTile(
                coffeeImagePath: 'lib/images/coffee5.jpg',
                coffeeName: 'Milk Coffee',
                coffeePrice: '4.06',
               ),
                CoffeeTile(
                coffeeImagePath: 'lib/images/coffee5.jpg',
                coffeeName: 'Tea',
                coffeePrice: '4.20',
               ),
              
              ]
                )
                ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
             children: [
              //logo
            DrawerHeader(
              child: Image.asset(
                'lib/images/logocoffee-rnbg.png',
                color: Colors.white,
                ),
            ),

            //other pages
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text('Home', style: TextStyle( color: Colors.white),),
              ),
            ),

              Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.white,),
                title: Text('About ', style: TextStyle( color: Colors.white),),
              ),
            ),
             ],
            ),
              Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                title: Text('Logout', style: TextStyle( color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
