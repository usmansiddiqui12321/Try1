import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Cart%20screen/cartscreen.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Components/list.dart';
import 'package:dsaproject/Screens/Drawer/drawer.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({Key? key}) : super(key: key);

  @override
  _FavoriteItemState createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  int indexselected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text("Favorite"),
        foregroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
            ),
          ),
          Center(
            child: cartlist.length == 0
                ? Container(
                    width: 0,
                  )
                : Text(
                    cartlist.length.toString(),
                    style: TextStyle(color: Colors.orange),
                  ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      drawer: DrawerB(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: ListView.builder(
                  itemCount: favoritelist.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return productcard(index);
                  }),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              indexselected = index;
            });
          },
          currentIndex: indexselected,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Person",
            ),
          ]),
    );
  }

  Widget productcard(int index) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
        boxShadow: boxshadow,
      ),
      height: 300,
      width: 400,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: Image.asset(
              favoritelist[index].img,
            ),
          ),
          Align(
            alignment: Alignment(-1, 1),
            child: Text(
              favoritelist[index].name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1, -1),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    favoritelist.removeAt(index);
                  });
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                )),
          ),
          Align(
            alignment: Alignment(1, -1),
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  "${favoritelist[index].discount}% off",
                  style: TextStyle(color: white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(1, 0.6),
            child: Text(
              "\$${favoritelist[index].price}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment(1, 1),
            child: IconButton(
              onPressed: () {
                setState(() {
                  cartlist.add(
                    favoritelist[index],
                  );
                });
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.orange,
              ),
            ),
          )
        ],
      ),
    );
  }
}
