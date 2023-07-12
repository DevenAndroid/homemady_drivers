import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../routers/routers.dart';
import '../widgets/custome_size.dart';
import '../widgets/dimenestion.dart';
import '../widgets/onborading_list.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return  Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height*.87,
                child: PageView.builder(
                    itemCount: page1.length,
                    controller: controller,
                    onPageChanged: (newValue) {
                      setState(() {
                        currentIndex = newValue;
                      });
                    },
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Image(
                                    image: AssetImage(page1[index].img,),width: AddSize.screenWidth,height: AddSize.screenHeight/2.5,
                                  ),
                                ),
                                const SizedBox(

                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmoothPageIndicator(
                                      axisDirection: Axis.horizontal,
                                      controller: controller,
                                      count: page1.length,
                                      effect: const ExpandingDotsEffect(
                                        activeDotColor: Color(0xFF7ED957),
                                        dotWidth: 10,
                                        dotHeight: 10,
                                        dotColor: Colors.black12,
                                      ),
                                    ),
                                  ],
                                ),
                                addHeight(10),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          page1[index].title,
                                          style:const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 26,
                                            fontFamily: 'alegreyaSans',
                                            color:  Color(0xFF131A38),
                                              fontStyle: FontStyle.italic,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),

                                    ]
                                )
                              ]
                          )
                      );
                    }
                ),
              ),

              Center(
                child: Container(
                  width: 67,
                  height: 67,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7ED957),
                    shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(.1, .1,
                          ),
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        ),
                      ]
                  ),
                  child: InkWell(
                    onTap: (){
                      controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                      if (currentIndex == 5) {
                        Get.toNamed(MyRouters.loginScreen);
                      }
                    },
                    child: const Icon(Icons.arrow_forward,size: 30,color: Colors.white,),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
