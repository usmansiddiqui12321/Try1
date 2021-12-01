import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Components/list.dart';
import 'package:dsaproject/Screens/Drawer/drawer.dart';
import 'package:dsaproject/Screens/Favorite/favorite.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;
  int indexselected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text("Your Cart"),
        foregroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteItem()),);
                
              });
            },
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
            onPressed: () {},
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
                  itemCount: cartlist.length,
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
              cartlist[index].img,
            ),
          ),
          Align(
            alignment: Alignment(-1, 1),
            child: Text(
              cartlist[index].name,
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
                    cartlist.removeAt(index);
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
                  "${cartlist[index].discount}% off",
                  style: TextStyle(color: white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(1, 0.6),
            child: Text(
              "Price: \$${cartlist[index].price}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment(1, 0.8),
            child: Text(
              "Discount: \$${cartlist[index].price * 30 / 100}",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          Align(
            alignment: Alignment(1, 1),
            child: Text(
              "Total Price: \$${cartlist[index].price * 100 ~/ 30*quantity}",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          Align(
            alignment: Alignment(-1, 0.6),
            child: Container(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity < 1) {
                          quantity = quantity;
                        } else {
                          quantity = quantity - 1;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove,
                      color: black,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity = quantity + 1;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
