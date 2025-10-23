import 'dart:async';

import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/vendor_order_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VendorOrderDetailsScreen extends StatefulWidget {
  const VendorOrderDetailsScreen({super.key});

  @override
  State<VendorOrderDetailsScreen> createState() => _VendorOrderDetailsScreenState();
}

class _VendorOrderDetailsScreenState extends State<VendorOrderDetailsScreen> {

  final _vendorOrderController = Get.put(VendorOrderController());

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.8041, 90.4152),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: CustomAppbar(
        title: "Order Details",
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          Obx(
            ()=> Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 215,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: AssetImage(_vendorOrderController.images[_vendorOrderController.currentIndex.value]),
                    fit: BoxFit.cover)
                  ),

                ),
                Positioned(
                  top: 90,
                  left: 10,
                  child: InkWell(
                    onTap: _vendorOrderController.nextImage,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFDFDFD).withValues(alpha: 0.41)
                      ),
                      child: Icon(Icons.arrow_back_ios,
                      color: Color(0xFFEBEBEB).withValues(alpha: 0.46),),
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  right: 10,
                  child: InkWell(
                    onTap: _vendorOrderController.nextImage,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFDFDFD).withValues(alpha: 0.41)
                      ),
                      child: Icon(Icons.navigate_next,
                        color: Color(0xFF2E2E2E)),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 26,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Supreme Pizza",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF686868)
              ),),
              SizedBox(width: 10,),
              Text("\$98",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xFF96C330)
              ),),
              Spacer(),
              Container(
                width: 94,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text("Quantity 2",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor
                  ),),
                ),
              )
            ],
          ),
          SizedBox(height: 8,),
          Text("Products Details ",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF5C5C5C)
          ),),
          SizedBox(height: 4,),
          Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout See more...",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
          ),),
          SizedBox(height: 10,),
          Row(
            children: [
              SvgPicture.asset('assets/icons/location.svg',
              color: Color(0xFF5C5C5C),),
              SizedBox(width: 8,),
              Expanded(
                child: Text("2464 Royal Ln. Mesa",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF5C5C5C)
                ),),
              ),
              SizedBox(width: 20,),
              SvgPicture.asset('assets/icons/bike.svg',),
              SizedBox(width: 8,),
              Text("Delivery Fee: \$30",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFF35E24)
              ),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Received By : ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5C5C5C)
              ),),
              Text("Start Time :",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5C5C5C)
                ),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/image/dummy.jpg"))
                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cameron Williamson",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor
                  ),),
                  SizedBox(height: 8,),
                  Text("+1 (470) 918 8577",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor
                  ),)
                ],
              ),
              Spacer(),
              SvgPicture.asset('assets/icons/clock.svg'),
              SizedBox(width: 10,),
              Text("00:00:00",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF5C5C5C)
              ),)
            ],
          ),
          SizedBox(height: 24,),
          SizedBox(
            height: 262,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),

        ],
      ),
    );
  }
}
