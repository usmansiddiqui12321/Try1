

import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Cart%20screen/cartscreen.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Favorite/favorite.dart';
import 'package:dsaproject/Screens/Home%20Screen/home_screen.dart';

class DrawerB extends StatefulWidget {
  const DrawerB({Key? key}) : super(key: key);

  @override
  _DrawerBState createState() => _DrawerBState();
}

class _DrawerBState extends State<DrawerB> {
  final padding = const EdgeInsets.only(top: 15, left: 15);
  Color primary = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/su1.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken),
              ),
            ),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //backgroun profile image
                Container(
                  height: 120,
                  width: 120,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: white,
                      width: 3,
                    ),
                    image: DecorationImage(
                      image: AssetImage("images/su1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    "MUHAMMAD USMAN SIDDIQUI",
                    style: TextStyle(
                      color: white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: padding,
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.orange,
                  ),
                  title: Text(
                    "Home",
                    style: btntxt,
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    });
                  },
                ),
              ),
              Padding(
                padding: padding,
                child: ListTile(
                  leading: Icon(
                    Icons.favorite_rounded,
                    color: Colors.orange,
                  ),
                  title: Text(
                    "Favorite Item",
                    style: btntxt,
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoriteItem(),
                        ),
                      );
                    });
                  },
                ),
              ),
              Padding(
                padding: padding,
                child: ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.orange,
                  ),
                  title: Text(
                    "Cart Item",
                    style: btntxt,
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    });
                  },
                ),
              ),
              Padding(
                padding: padding,
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.orange,
                  ),
                  title: Text(
                    "Setting",
                    style: btntxt,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final btntxt = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
