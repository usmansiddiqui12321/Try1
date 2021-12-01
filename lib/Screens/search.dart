import 'dart:math';

import 'package:dsaproject/Screens/Components/list.dart';
import 'package:flutter/material.dart';
class search extends StatefulWidget {

    search({ Key? key }) : super(key: key);

  @override
  _searchState createState() => _searchState();
}
class _searchState extends State<search> {
  List<Products>?emptylist;
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search here',
                    contentPadding: EdgeInsets.all(8)),
                onChanged: (value) {
                  setState(() {
                  emptylist = productlist
                        .where(
                            (e) => e.name.toLowerCase().contains(value.toLowerCase()
                            ))
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                    emptylist!.length == 0) {
                      print('emptylist length ${emptylist!.length}');
                    }
                  });
                },
              ),
            )),
        body: _textEditingController!.text.isNotEmpty &&
              emptylist!.length == 0
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search_off,
                          size: 160,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No results found,\nPlease try different keyword',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 12,
                ),
                itemCount: _textEditingController!.text.isNotEmpty
                    ?emptylist!.length
                    :productlist.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.food_bank,color: Colors.white,),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(_textEditingController!.text.isNotEmpty
                            ?emptylist![index]
                            :productlist[index].name),
                      ],
                    ),
                  );
                }));
  }
}

//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.blue.shade300,
//             title: Container(
//               decoration: BoxDecoration(
//                   color: Colors.blue.shade200,
//                   borderRadius: BorderRadius.circular(20)),
//               child: TextField(
//                 controller: _textEditingController,
//                 focusNode: _textFocusNode,
//                 cursorColor: Colors.black,
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     disabledBorder: InputBorder.none,
//                     hintText: 'Search here',
//                     contentPadding: EdgeInsets.all(8)),
//                 onChanged: (value) {
//                   setState(() {
//                     productlist = productlist
//                         .where(
//                             (element) => element.name(value.toLowerCase()))
//                         .toList();
//                     if (_textEditingController!.text.isNotEmpty &&
//                         emptysearch!.length == 0) {
//                       print('emptysearch length ${emptysearch!.length}');
//                     }
//                   });
//                 },
//               ),
//             )),
//         body: _textEditingController!.text.isNotEmpty &&
//                 emptysearch!.length == 0
//             ? Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.search_off,
//                           size: 160,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'No results found,\nPlease try different keyword',
//                           style: TextStyle(
//                               fontSize: 30, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: _textEditingController!.text.isNotEmpty
//                     ? emptysearch!.length
//                     : productlist.length,
//                 itemBuilder: (ctx, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         // CircleAvatar(
//                         //   child: Icon(Icons.food_bank),
//                         // ),

//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(_textEditingController!.text.isNotEmpty
//                             ? emptysearch![index]
//                             : productlist[index].name),
//               ],
//             ),
//           );
//         }
//       )
//     );
//   }
// }
