import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Image.network(
            'http://192.168.1.7:8000/images/IMG_7930.PNG',
            width: 160,
            height: 125,
            fit: BoxFit.cover,
            // color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 150,
            width: 225,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sudut Kota",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Oil on Canvas | 60 x 70cm | 2020",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rp. 5,000,000",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Checkout"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          primary: Colors.black,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                      ),
                      IconButton(
                        icon: Icon(EvaIcons.trashOutline),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
