import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:veflat/general/general_controllers/home_controller_page.dart';
import 'package:veflat/configuration.dart' as config;
import 'package:veflat/widgets/progress_indicator.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeController = Provider.of<HomeController>(context, listen:false);
      homeController.isLoadingSet =true;
      await homeController.getImage();
      homeController.isLoadingSet =false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    homeController.size= MediaQuery.of(context).size;
    return Scaffold(
      body: homeController.isLoadingGet
          ?const ProgressWD()
          :SafeArea(
        child: SizedBox(
          height: homeController.size.height,
          width: homeController.size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.grid_view_outlined,
                        color: Colors.black,
                        size: 40,
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                Navigator.pushNamed(context, 'cart',);
                              },
                              icon: const Icon(Icons.shopping_bag_outlined,
                                  color: Colors.black,
                                  size: 40,)
                            ),
                            if(config.cardCharacters.isNotEmpty)
                              const Text('•',style: TextStyle(fontSize: 50,color: Color(0XFFf4c4cc)),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color:const Color(0XFF5fc6db),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20,top: 20),
                            child: Text(
                              'TRENDING \nPRODUCTS',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          const Padding(
                            padding: EdgeInsets.only(left: 60),
                            child: FaIcon(FontAwesomeIcons.arrowRight,size: 40,color: Colors.white,),
                          )

                        ],
                      ),
                    ),

                    const SizedBox(width: 10,),


                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color:const Color(0XFF8366ce),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 20,top: 20),
                              child: Text(
                                'SALE \nPRODUCTS',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18
                                ),
                              )
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: FaIcon(FontAwesomeIcons.arrowRight,size: 40,color: Colors.white.withOpacity(0.6),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                const Text('POPULAR PRODUCTS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                const SizedBox(height: 20,),


                PopularProduct(homeController: homeController,positionImage:0),
                const SizedBox(height: 20,),
                CartButtonName(homeController: homeController,positionName:0),
                const SizedBox(height: 30,),
                PopularProduct(homeController: homeController,positionImage:1),
                const SizedBox(height: 20,),
                CartButtonName(homeController: homeController,positionName:1),
                const SizedBox(height: 20,),
                PopularProduct(homeController: homeController,positionImage:2),
                CartButtonName(homeController: homeController,positionName:2),
                const SizedBox(height: 20,),


                const SizedBox(height: 30,),
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
    required this.positionName, required this.homeController,
  });
  final HomeController homeController;
  final int positionName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeController.charactersImage.isNotEmpty
              ?Text(homeController.charactersImage[positionName].name ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),textAlign: TextAlign.left ,)
              :Container(),
              const SizedBox(height: 5),
              const Text('\$140\$',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0XFF8366ce),),textAlign: TextAlign.left ,),
            ],
          ),
        ),
        Container(
              decoration: BoxDecoration(
                  color:Colors.black,
                  borderRadius: BorderRadius.circular(14)
              ),
              child: IconButton(
                  onPressed: (){
                    homeController.addCardCharacters(positionName);
                  }, icon: const Icon(Icons.shopping_bag_outlined,color: Colors.white,size: 30,)
              ),
            ),
      ],
    );
  }
}

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    super.key,
    required this.homeController,
    required this.positionImage,
  });

  final HomeController homeController;
  final int positionImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:200.0),
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(348 / 360),
            child :Container(
              width: homeController.size.width*0.5,
              height: homeController.size.height*0.40,
              decoration: BoxDecoration(
                  color: const Color(0XFFf4c4cc),
                  borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: FittedBox(
                    fit:BoxFit.fill,
                    child:
                    homeController.charactersImage.isNotEmpty
                    ?FadeInImage(
                      image: NetworkImage(homeController.charactersImage[positionImage].image) ,
                      placeholder: const AssetImage('assets/loading.gif'),
                      fadeInDuration: const Duration(milliseconds: 300),
                    )
                        :Image.asset('assets/loading.gif'),
                ),
              ),

            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right:200.0),
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(12 / 360),
            child :Container(
              width: homeController.size.width*0.5,
              height: homeController.size.height*0.40,
              decoration: BoxDecoration(
                  color: const Color(0XFFf4c4cc),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: FittedBox(
                    fit:BoxFit.fill,
                    child:
                    homeController.charactersImage.isNotEmpty
                        ?FadeInImage(
                      image: NetworkImage(homeController.charactersImage[positionImage].image) ,
                      placeholder: const AssetImage('assets/loading.gif'),
                      fadeInDuration: const Duration(milliseconds: 300),
                    )
                        :Image.asset('assets/loading.gif'),
                ),
              ),
            ),
          ),
        ),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: homeController.size.width*0.5,
                      height: 320,
                      decoration: BoxDecoration(
                          color: const Color(0XFF6db7c8),
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(
                            width: 4,
                          color: Colors.white
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FittedBox(
                            fit:BoxFit.fill,
                            child:
                            homeController.charactersImage.isNotEmpty
                                ?FadeInImage(
                              image: NetworkImage(homeController.charactersImage[positionImage].image) ,
                              placeholder: const AssetImage('assets/loading.gif'),
                              fadeInDuration: const Duration(milliseconds: 300),
                            )
                                :Image.asset('assets/loading.gif'),
                        ),
                      ),
                    ),

              ],
            ),
          ],
        ),
      ],
    );
  }
}
