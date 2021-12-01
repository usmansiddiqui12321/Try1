import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Cart%20screen/cartscreen.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Components/list.dart';

class DetailScreen extends StatefulWidget {
  final Products product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
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
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              });
            },
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.asset(widget.product.img),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    textAlign: TextAlign.justify,
                  ),
                ),
                Row(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                      primary: Colors.orange,
                      onPrimary: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      )),
                  onPressed: () {
                    setState(() {
                      cartlist.add(widget.product);
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.orange,
                  ),
                  label: Text("Add to Cart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
