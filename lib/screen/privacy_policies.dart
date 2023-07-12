import 'package:flutter/material.dart';

import '../widgets/custome_size.dart';
import '../widgets/custome_textfiled.dart';


class PrivacyPolicies extends StatefulWidget {
  const PrivacyPolicies({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicies> createState() => _PrivacyPoliciesState();
}

class _PrivacyPoliciesState extends State<PrivacyPolicies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(title: 'Privacy Policy', context: context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text( 'This is essentially Legal statement or policy',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF2A3B40)
                ),
              ),
              addHeight(15),
              const Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: 'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xFF363539)
                            )
                        ),  TextSpan(
                            text: ' (essentially)...',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xFF51A8E8)
                            )
                        ),
                      ]
                  )
              ),
              addHeight(10),
              const Text('Thanks for using Dropbox! Our mission is to create a more enlightened way of working, and help you and those you work with stay coordinated. We do so by providing an intuitive, unified platform and suite of apps and services that keep your content safe, accessible and in sync. These terms of service (“Terms”) cover your use and access to our services',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xFF363539)
                ),),
              addHeight(10),
              const Text('When you use our Services, you provide us with things like your files, content, messages, contacts, and so on (“Your Stuff”). Your Stuff is yours.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xFF363539)
                ),),
              addHeight(15),
              const Text('Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book...',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xFF363539)
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
