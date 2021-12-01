import 'package:flutter/material.dart';
class CategoryDetail {
  final name;
  final img;
  final pieces;
  CategoryDetail({
    required this.name,
    required this.img,
    required this.pieces,
  });
}

List<CategoryDetail> catlist = [
  CategoryDetail(
      name: "Shoes", img: "images/shoes.png", pieces: "10 Pieces left"),
  CategoryDetail(
      name: "Suit", img: "images/suit.png", pieces: "15 Pieces left"),
  CategoryDetail(
      name: "Shirt", img: "images/shirt.png", pieces: "8 Pieces left"),
  CategoryDetail(
      name: "Watches", img: "images/watch.png", pieces: "5 Pieces left"),
  CategoryDetail(
      name: "Pant", img: "images/trouser.png", pieces: "3 Pieces left"),
  CategoryDetail(name: "Tie", img: "images/tie.png", pieces: "6 Pieces left"),
];

class Products {
  final name;
  final img;
  final discount;
  final int price;
  bool isselected;
  Products({
    required this.name,
    required this.img,
    required this.discount,
    required this.price,
    required this.isselected,
  });
}

List<Products> productlist = [
  Products(
    name: "Nike Shoes",
    img: "images/s1.jpg",
    discount: 30,
    price: 119,
    isselected: false,
  ),
  Products(
    name: "Adidas Shoes",
    img: "images/s2.jpg",
    discount: 10,
    price: 99,
    isselected: false,
  ),
  Products(
    name: "Men Suit",
    img: "images/su1.png",
    discount: 20,
    price: 399,
    isselected: false,
  ),
  Products(
    name: "Blue Jeans",
    img: "images/trouser1.png",
    discount: 15,
    price: 259,
    isselected: false,
  ),
  Products(
    name: "Men's Watch",
    img: "images/w1.jpg",
    discount: 35,
    price: 189,
    isselected: false,
  ),
  Products(
    name: "Rado Watch",
    img: "images/w2.jpg",
    discount: 16,
    price: 299,
    isselected: false,
  ),
  Products(
    name: "T-Shirt",
    img: "images/tshir.jpg",
    discount: 22,
    price: 59,
    isselected: false,
  ),
  Products(
    name: "Men's Shuit",
    img: "images/su.png",
    discount: 11,
    price: 159,
    isselected: false,
  ),
];
List<Products> cartlist = [];
List<Products> favoritelist = [];
List <Products> prices = [];






//   int high = productlist.length - 1;
//   int low = 0;
//   List<int> result = quickSort(productlist, low, high);
//   print(result);


// List<int> quickSort(List productlist, int low, int high) {
//   if (low < high) {
//     int pi = partition(productlist, low, high);
//     print("pivot: ${productlist[pi]} now at index $pi");

//     quickSort(productlist, low, pi - 1);
//     quickSort(productlist, pi + 1, high);
//   }
//   return productlist;
// }

// int partition(List<int> productlist, low, high) {
//   // Base check
//   if (productlist.isEmpty) {
//     return 0;
//   }
//   // Take our last element as pivot and counter i one less than low
//   int pivot = productlist[high];

//   int i = low - 1;
//   for (int j = low; j < high; j++) {
//     // When j is < than pivot element we increment i and swap arr[i] and arr[j]
//     if (productlist[j] < pivot) {
//       i++;
//       swap(productlist, i, j);
//     }
//   }
//   // Swap the last element and place in front of the i'th element
//   swap(productlist, i + 1, high);
//   return i + 1;
// }

// // Swapping using a temp variable
// void swap(List productlist, int i, int j) {
//   int temp = productlist[i];
//   productlist[i] = productlist[j];
//   productlist[j] = temp;
// }
// List<Products> pricesList= [Products(name: name, img: img, discount: discount, price: price, isselected: isselected)];