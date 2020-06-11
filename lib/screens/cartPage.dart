import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../widgets/cartItem.dart';
import '../providers/CartProvider.dart' show Cart;
import '../shared/colors.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff7f7f7),
        leading: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: RotatedBox(
            quarterTurns: 4,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black54,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Mon panier',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: CustomColors.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 21.0)),
        ])),
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: RotatedBox(
                quarterTurns: 4,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'homeScreen');
                  },
                  icon: Icon(Icons.home, color: Colors.black54),
                )),
          ),
        ],
      ),
      body: (cart.itemCount == 0)
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Vous n'avez pas d'articles dans le panier",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                Icon(Icons.add_shopping_cart, size: 200, color: Colors.grey),
                SizedBox(
                      height: 10,
                    ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    color: CustomColors.orange,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Continuer vos achats", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            )
          : SlidingUpPanel(
              minHeight: 60,
              color: Color.fromARGB(190, 222, 100, 2),
              maxHeight: MediaQuery.of(context).size.height / 3,
              panel: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  someTotal("total", "16000"),
                  someTotal("taxe 10%", "1600"),
                  someTotal("Livraison", "1000"),
                  checkOutBar(cart)
                ],
              ),
              collapsed: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: checkOutBar(cart)),
              body: Padding(
                padding: const EdgeInsets.only(bottom: 100, left: 7, right: 7),
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 50),
                  itemCount: cart.items.length,
                  itemBuilder: (context, i) {
                    return CartItem(
                      cart.items.values.toList()[i].id,
                      cart.items.keys.toList()[i],
                      cart.items.values.toList()[i].price,
                      cart.items.values.toList()[i].quantity,
                      cart.items.values.toList()[i].title,
                      cart.items.values.toList()[i].image,
                    );
                  },
                ),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
    );
  }

  Widget someTotal(String title, String price) => Container(
        width: 240,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text('$title :',
              style: TextStyle(
                  fontFamily: 'Pacifico', fontSize: 17.0, color: Colors.grey)),
          Text('  $price FCFA',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.w400,
                  fontSize: 20)),
        ]),
      );

  Widget checkOutBar(Cart cart) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.info,
            color: Colors.grey,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Total :',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: CustomColors.black,
                    fontSize: 17.0)),
            TextSpan(
                text: "${cart.totalAmount} Fcfa",
                style: TextStyle(
                    fontFamily: 'CenturyGhotic',
                    letterSpacing: 1.8,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0))
          ])),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 40,
              child: MaterialButton(
                onPressed: () {},
                color: CustomColors.orange,
                child: Text("Commander", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      );
}
