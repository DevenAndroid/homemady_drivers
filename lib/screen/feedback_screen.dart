import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homemady_drivers/widgets/app_theme.dart';
import 'package:homemady_drivers/widgets/custome_size.dart';
import 'package:homemady_drivers/widgets/custome_textfiled.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homemady_drivers/widgets/dimenestion.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../controller/get_feedback_controller.dart';
import '../controller/order_details_controller.dart';


class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  double fullRating = 0;
  final feedbackController = Get.put(GetFeedbackController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      feedbackController.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: backAppBar(title: 'Feedback', context: context),
        body: feedbackController.isDataLoading.value ?
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Column(
              children: [
               feedbackController.model.value.data!.reviews!.isNotEmpty ?
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(feedbackController.model.value.data!.avgRating.toString(),
                          style: const TextStyle(
                            color: Color(0xFF1B233A),
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                          ),),
                        addWidth(26),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: List.generate(7, (indexS) {
                                return double.parse((
                                    feedbackController.model.value.data!.avgRating.toString()??
                                        "0.0")
                                    .toString()) <
                                    indexS + 1.0
                                    ? Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset('assets/images/star_empty.png',
                                    height: 16,
                                  ),
                                )
                                    :  Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset('assets/images/star.png',
                                    height: 16,
                                    color: Colors.amber,
                                  ),
                                );
                              }),
                            ),
                            addHeight(3),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text('basad on 23 reviews', style: TextStyle(
                                color: Color(0xFF969AA3),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    addHeight(15),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Delivery             ', style: TextStyle(
                              color: Color(0xFF969AA3),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),),
                            Expanded(
                              child: LinearPercentIndicator(
                                lineHeight: 6.0,
                                barRadius: const Radius.circular(16),
                                backgroundColor: const Color(0xFFFAE9E4),
                                animation: true,
                                progressColor: const Color(0xFFEE3D1C),
                                percent: double.parse(feedbackController.model.value.data!.delivery.toString()) / 100.0,
                                animationDuration: 1200,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    addHeight(20),
                    const Divider(
                      height: 1,
                      thickness: 1.5,
                      color: Color(0xFFE8F2EC),
                    ),
                    addHeight(20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: feedbackController.model.value.data!.reviews!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                 borderRadius: BorderRadius.circular(100),
                                  child: CachedNetworkImage(
                                    imageUrl: feedbackController.model.value.data!.reviews![index].profileImage.toString(),
                                    height: 50,
                                    fit: BoxFit.cover,
                                    width: 50,
                                    errorWidget: (context, url, error) => Image.asset('assets/images/Ellipse 1563.png'),
                                  ),
                                ),
                                addWidth(20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Text(feedbackController.model.value.data!.reviews![index].userName.toString(),
                                          style: const TextStyle(
                                            color: Color(0xFF1B233A),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),),
                                      ),
                                      addHeight(2),
                                      Row(
                                        children: List.generate(7, (indexS) {
                                          return double.parse((
                                              feedbackController.model.value.data!.reviews![index].rating.toString() ??
                                                  "0.0")
                                              .toString()) <
                                              indexS + 1.0
                                              ? Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Image.asset('assets/images/star_empty.png',
                                              height: 16,
                                            ),
                                          )
                                              :  Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Image.asset('assets/images/star.png',
                                              height: 16,
                                              color: Colors.amber,
                                            ),
                                          );
                                        }),
                                      ),
                                      addHeight(7),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: RichText(
                                          text:  TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: feedbackController.model.value.data!.reviews![index].review.toString(),
                                                    style: const TextStyle(
                                                      color: Color(0xFF969AA3),
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w300,

                                                    )),
                                                // TextSpan(
                                                //     text: 'read more',
                                                //     style: TextStyle(
                                                //         fontSize: 13,
                                                //         fontWeight: FontWeight.w400,
                                                //         color: Color(0xFF567DF4)))
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const Spacer(),
                                 Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3.0),
                                  child: Text(feedbackController.model.value.data!.reviews![index].date.toString(),
                                    style: const TextStyle(
                                    color: Color(0xFF969AA3),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AddSize.size5,
                            ),
                            index !=  feedbackController.model.value.data!.reviews!.length -1
                                ? const Divider()
                                : const SizedBox(),
                            SizedBox(
                              height: AddSize.size5,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ) : SizedBox(
                 height: MediaQuery.of(context).size.height*.60,
                  child: Align(
                   alignment: Alignment.topCenter,
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Image.asset('assets/images/nofeedback.png',height: MediaQuery.of(context).size.height*.25,),
                       SizedBox(
                         height: MediaQuery.of(context).size.height * .030,
                       ),
                       Text("No Feedback Yet",
                           textAlign: TextAlign.center,
                           style: Theme.of(context).textTheme.headline5!.copyWith(
                               height: 1.5,
                               fontWeight: FontWeight.w700,
                               fontSize: AddSize.font20,
                               color: AppTheme.blackcolor)),
                       addHeight(
                         MediaQuery.of(context).size.height * .010,
                       ),
                       // Text("Bong, it seems that you do not have any notifications at the moment",
                       //     textAlign: TextAlign.center,
                       //     style: Theme.of(context).textTheme.headline5!.copyWith(
                       //         height: 1.5,
                       //         fontWeight: FontWeight.w500,
                       //         fontSize: AddSize.font16,
                       //         color: const Color(0xFF9E9E9E))),
                     ],
               ),
                  ),
                )
              ],
            ),
          ),
        ) : const Center(child: CircularProgressIndicator(),),
      );
    });
  }
}
