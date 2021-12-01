import 'package:dsaproject/Screens/search.dart';
import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Cart%20screen/cartscreen.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Components/list.dart';
import 'package:dsaproject/Screens/Detail%20Screen/detailscreen.dart';
import 'package:dsaproject/Screens/Drawer/drawer.dart';
import 'package:dsaproject/Screens/Favorite/favorite.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexselected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text("Home Page"),
        foregroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoriteItem()),
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
      drawer: DrawerB(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 120,
            child: ListView.builder(
              itemCount: catlist.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return catergorycontainer(index);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: ListView.builder(
                  itemCount: productlist.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return productcard(
                      index,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            product: productlist[index],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white70,
child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          
          IconButton(icon: Icon(Icons.home,color: Colors.orange ), onPressed: () {
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );          },),
          IconButton(icon: Icon(Icons.search,color: Colors.orange ), onPressed: () {
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => search()),
  );         
},),
  IconButton(onPressed: (){
    // setState(() {
    //   prices.add(
        
    //   );
    //                       prices.sort();
    // });
    // productlist.simplesort();
    // productlist.quicksort(sortBy: 'price');
    // productlist.sort();
  }, icon: Icon(Icons.more_vert,color: Colors.orange))
        
        ],
      )
    )
  );
}
//   BottomAppBar(
        

//         color: Colors.white70,
//           child: new Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
          
//           IconButton(icon: Icon(Icons.home,color: Colors.orange ), onPressed: () {
// Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => home()),
//   );          },),
//           IconButton(icon: Icon(Icons.search,color: Colors.orange ), onPressed: () {
// Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => search()),
//   );          },),
//           IconButton(icon: Icon(Icons.person,color: Colors.orange ), onPressed: () {
// Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => profile()),

  Widget catergorycontainer(int index) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
        boxShadow: boxshadow,
      ),
      height: 100,
      width: 200,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(catlist[index].img),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  catlist[index].name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  catlist[index].pieces,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productcard(int index, dynamic press ) {
    return GestureDetector(
      onTap: press,
      child: Container(
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
                productlist[index].img,
              ),
            ),
            Align(
              alignment: Alignment(-1, 1),
              child: Text(
                productlist[index].name,
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
                    setState(
                      () {
                        if (productlist[index].isselected) {
                          productlist[index].isselected = false;
                        } else {
                          productlist[index].isselected = true;
                        }
                        favoritelist.add(
                          productlist[index],
                        );
                      },
                    );
                  },
                  icon: productlist[index].isselected
                      ? Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
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
                    "${productlist[index].discount}% off",
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(1, 0.6),
              child: Text(
                "\$${productlist[index].price}",
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
                      productlist[index],
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
      ),
    );
  }
}
