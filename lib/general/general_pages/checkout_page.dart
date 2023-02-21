import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:veflat/general/general_controllers/cart_page_controller.dart';
import 'package:veflat/general/general_controllers/checkout_page_controller.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final checkoutController = Provider.of<CheckoutController>(context);
    checkoutController.size= MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: checkoutController.size.height,
          width: checkoutController.size.width,
          child: SingleChildScrollView(
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

                      const Text('CHECKOUT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      GestureDetector(
                        onTap: () {
                        },
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Master Card',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Icon(Icons.more_horiz,size: 50,)
                    ],
                  ),
                ),
                CreditCardWidget(
                  cardType: CardType.mastercard,
                  bankName: 'CREDIT CARD',
                  cardNumber: '3742 4545 5400 1126',
                  obscureCardNumber: false,
                  expiryDate: '02/2023',
                  cardHolderName: 'JOHNS',
                  cvvCode: '123',
                  showBackView: false,
                  isSwipeGestureEnabled: false,
                  height: checkoutController.kCardHeight,
                  isChipVisible: false,
                  isHolderNameVisible: true,
                  width:checkoutController.kCardWidth,
                  cardBgColor: const Color(0XFF8366ce),
                  onCreditCardWidgetChange: (_) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Choose Payment',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Icon(Icons.more_horiz,size: 50,),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2,
                                color: Colors.black
                            )
                        ),
                        child: const Icon(Icons.apple,size: 45,)
                    ),
                    const SizedBox(width: 45,),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2,
                                color: Colors.black
                            )
                        ),
                        child: const FaIcon(FontAwesomeIcons.ccMastercard,size: 45,color: Colors.white,)),
                    const SizedBox(width: 45,),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2,
                                color: Colors.black
                            )
                        ),
                        child: const FaIcon(FontAwesomeIcons.ccVisa,size: 45,color: Colors.white,)),
                    const SizedBox(width: 45,),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2,
                                color: Colors.black
                            )
                        ),
                        child: const Icon(Icons.paypal,size: 45,)),
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Promo Or Vaucher',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Icon(Icons.more_horiz,size: 50,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: checkoutController.size.height*0.11,
                        decoration: BoxDecoration(
                          color: const Color(0XFFf6eaec),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom:20 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Padding(
                                padding: const EdgeInsets.only(left:50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Add Your Code' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),textAlign: TextAlign.left ,),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color:Colors.white,
                              ),
                              child: TextButton(
                                  child: const Text('  Fun10  ' ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                                  onPressed: (){
                                    Navigator.pushNamed(context, 'checkout');
                                  }
                              ),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text('\$645.00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),

                Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color:Colors.black,
                      borderRadius: BorderRadius.circular(14)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Make Payment          ',style: TextStyle(color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.w600,fontSize: 20),),
                      const Icon(Icons.arrow_right_alt,color: Colors.white,)
                    ],
                  ),
                ),
                const SizedBox(height: 40,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartButtonName extends StatelessWidget {
  const CartButtonName({
    super.key,
    required this.positionName, required this.cartController,
  });
  final CartController cartController;
  final int positionName;

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
              children: const [
                Text('Total' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),textAlign: TextAlign.left ,),
                SizedBox(height: 5),
                Text('\$140.00',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,),textAlign: TextAlign.left ,),
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