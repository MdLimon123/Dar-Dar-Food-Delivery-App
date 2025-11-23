import 'dart:async';

import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {


  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.8041, 90.4152),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppbar(
        title: "Map",
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 400,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pick up Location :",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/image/restaurant.jpg'),
                              fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(width: 12,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kacchi Bhai",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),),
                        SizedBox(height: 10,),
                        Text("2464 Royal Ln. Mesa",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF767676)
                          ),)
                      ],
                    ),

                  ],
                ),
                // SizedBox(height: 10,),
                // Divider(
                //   thickness: 1,
                //   color: Color(0xFFE1E1E1),
                //
                // ),
                // SizedBox(height: 10,),
                // Text("Delivery Location :",
                //   style: TextStyle(
                //       fontSize: 12,
                //       fontWeight: FontWeight.w400,
                //       color: AppColors.textColor
                //
                //   ),),
                // SizedBox(height: 20,),
                // Row(
                //   children: [
                //     Container(
                //       height: 25,
                //       width: 25,
                //       padding: EdgeInsets.all(2),
                //       decoration: BoxDecoration(
                //           color: Color(0xFFE9E9E9),
                //           shape: BoxShape.circle
                //       ),
                //       child: Image.asset('assets/image/location.png',
                //         color: AppColors.textColor,),
                //     ),
                //     SizedBox(width: 10,),
                //     Text("2464 Royal Ln. Mesa",
                //       style: TextStyle(
                //           fontSize: 12,
                //           fontWeight: FontWeight.w300,
                //           color: Color(0xFF767676)
                //       ),),
                //
                //   ],
                // ),
                SizedBox(height: 24,),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(image: AssetImage('assets/image/pizza2.jpg'),
                              fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chicken Chow Mein",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quantity: 01",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF5C5C5C)
                              ),),
                            SizedBox(width: 10,),
                            Text("Price: \$400",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF96C330)
                              ),)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Divider(
                  thickness: 1,
                  color: Color(0xFFE1E1E1),

                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(image: AssetImage('assets/image/pizza2.jpg'),
                              fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chicken Chow Mein",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quantity: 01",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF5C5C5C)
                              ),),
                            SizedBox(width: 10,),
                            Text("Price: \$400",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF96C330)
                              ),)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Divider(
                  thickness: 1,
                  color: Color(0xFFE1E1E1),

                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(image: AssetImage('assets/image/pizza2.jpg'),
                              fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chicken Chow Mein",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quantity: 01",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF5C5C5C)
                              ),),
                            SizedBox(width: 10,),
                            Text("Price: \$400",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF96C330)
                              ),)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Divider(
                  color: Color(0xFFAFAFAF),
                  height: 1,
                ),
                SizedBox(height: 24,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sub Total:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor
                      ),),
                    Text("\$715.00",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor
                      ),)
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Fee:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor
                      ),),
                    Text("\$56.00",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor
                      ),)
                  ],
                ),
                SizedBox(height: 10,),
                Divider(
                  color: Color(0xFFAFAFAF),
                  height: 1,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5B52A3)
                      ),),
                    Text("\$771.00",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5B52A3)
                      ),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
