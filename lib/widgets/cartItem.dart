import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/CartProvider.dart';
import '../shared/colors.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String image;

  CartItem(this.id, this.productId, this.price, this.quantity, this.title,
      this.image);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Etes vous sûr"),
                  content: Text("Voulez vous vraiment supprimer cet article"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Non"),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text("Oui"),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                ));
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, color: Colors.white, size: 40),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 120,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 0.2, color: Colors.grey),
              bottom: BorderSide(width: 0.2, color: Colors.grey),
            )),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage("images/$image"), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(color: CustomColors.grey, fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Quantité: $quantity",
                  style: TextStyle(color: CustomColors.grey, fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${price * quantity} FCFA",
                  style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Spacer(),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  Provider.of<Cart>(context, listen: false).removeItem(productId);
                })
          ],
        ),
      ),
    );
  }
}
