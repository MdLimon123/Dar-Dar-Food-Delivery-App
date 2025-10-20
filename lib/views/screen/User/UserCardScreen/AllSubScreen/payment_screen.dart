import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final nameTextController = TextEditingController();
  final cardTextController = TextEditingController();
  final expiryTextController = TextEditingController();
  final cvvTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F5),
      appBar: CustomAppbar(title: "Payment",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 36,),
          Center(
            child:  Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1F2E45),
                    Color(0xFF2D405A),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -40,
                    top: -40,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Top Row: world + NFC
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "world",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.wifi,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        /// Chip
                        Container(
                          height: 32,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// Card number
                        const Text(
                          "5412 7512 3412 3456",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 8),

                        /// Expiry + Label
                         Text(
                          "VALID THRU  12/23",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                        ),

                        const Spacer(),

                        /// Name + Mastercard
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Lee M. Cardholder",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFFF5F00),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(-10, 0),
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFFFB700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16,),
          _headingText(
            title: "Name"
          ),
          SizedBox(height: 12,),
          CustomTextField(controller: nameTextController,
          hintText: "Tom Holland",),
          SizedBox(height: 24,),
          _headingText(title: "Card Number"),
          SizedBox(height: 12,),
          CustomTextField(controller: cardTextController,
          hintText: "1234 5678 9012 3456",),
          SizedBox(height: 24,),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _headingText(title: "Expiry"),
                    SizedBox(height: 12,),
                    CustomTextField(controller: expiryTextController,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/calender.svg'),
                    ),
                    hintText: "25/12/2025",),

                  ],
                ),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  children: [
                    _headingText(title: "CVV"),
                    SizedBox(height: 12,),
                    CustomTextField(controller: expiryTextController,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/calender.svg'),
                      ),
                    hintText: "25/12/2025",),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF555656)
              ),),
              Text("\$771,00",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF555656)
              ),)
            ],
          ),
          SizedBox(height: 56,),
          CustomButton(onTap: (){},
              text: "Payment")

        ],
      ),
    );
  }

  Text _headingText({required String title}) {
    return Text(title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF555656)
        ),);
  }
}
