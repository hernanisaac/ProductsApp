import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:veflat/general/general_controllers/cart_page_controller.dart';
import 'package:veflat/widgets/card_products.dart';
import 'package:veflat/configuration.dart' as config;



class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    cartController.size= MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: cartController.size.height,
          width: cartController.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:const Color(0XFF8366ce),
                            borderRadius: BorderRadius.circular(14)
                        ),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const FaIcon(FontAwesomeIcons.arrowLeft,size: 30,color: Colors.white,))

                    ),

                    const Text('MY CART',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    GestureDetector(
                      onTap: () {
                      },
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 50,),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:  config.cardCharacters.length,
                  itemBuilder: (BuildContext context,int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ProductCard(
                          size: cartController.size,
                          icon: '',
                          urlImage: config.cardCharacters[index].image,
                          name: config.cardCharacters[index].name,
                          number: cartController.counter,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:20),
                          child: IconButton(icon: const Icon(Icons.delete),color: Colors.red, onPressed: () {
                            cartController.deleteCardCharacter(index);
                          },),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: cartController.size.height*0.2,
                      color: const Color(0XFFf6eaec),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:50 ),
                    child: CartButtonName(cartController: cartController,positionName: 0,totalMoney: cartController.counter*140*config.cardCharacters.length ,),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartButtonName extends StatelessWidget {
  const CartButtonName({
    super.key,
    required this.positionName, required this.cartController, required this.totalMoney,
  });
  final CartController cartController;
  final int positionName;
  final int totalMoney;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Padding(
            padding: const EdgeInsets.only(left:50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),textAlign: TextAlign.left ,),
                const SizedBox(height: 5),
                Text('\$$totalMoney.00',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,),textAlign: TextAlign.left ,),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color:Colors.black,
              borderRadius: BorderRadius.circular(14)
          ),
          child: TextButton(
           child: Text('     Check Out    ',style: TextStyle(color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.w600,fontSize: 20),),
              onPressed: (){
             Navigator.pushNamed(context, 'checkout');
              }
          ),
        ),
      ],
    );
  }
}