import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.size,
    required this.icon,
    required this.urlImage,
    Key? key, required this.number, required this.name,
  }) : super(key: key);

  final Size size;
  final String icon;
  final String urlImage;
  final int number;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(color: Colors.transparent,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 7.5,
                      offset: Offset(5,7.5),
                      color: Colors.black45
                  )
                ],
                // color: Colors.red,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color:const Color(0XFF8366ce)
                )
            ),
            child: Row(
              children: [
                SizedBox(
                    width: size.width*0.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child: Image.network(urlImage,))),
                const SizedBox(width: 20,),
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.3,
                      child: Text(
                        name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,fontSize:20
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    SizedBox(
                      width: size.width*0.3,
                      child: const Text(
                        '\$140.00',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,fontSize:20
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: size.width*0.08,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 2,
                                    color: Colors.black
                                )
                            ),
                            child:const Icon(Icons.favorite_border,color: Colors.black,)
                        ),
                        const SizedBox(width: 5,),

                      ],
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                      width: size.width*0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         const FaIcon(FontAwesomeIcons.minus,size: 18,),
                          Text('  $number  ',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          const FaIcon(FontAwesomeIcons.plus,size: 18,),
                        ],
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}