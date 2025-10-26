import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/rider_bottom_menu..dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/LanguageScreen/language_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Rider/RiderHomeScreen/AllSubScreen/rider_complete_order_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Rider/RiderHomeScreen/AllSubScreen/rider_current_order_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Rider/RiderHomeScreen/AllSubScreen/rider_new_order_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Splash/select_role_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserOrdersScreen/AllSubScreen/complete_order_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/faq_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/feedback_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/privacy_policy_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/settings_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/terms_and_conditon_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RiderHomeScreen extends StatefulWidget {
  const RiderHomeScreen({super.key});

  @override
  State<RiderHomeScreen> createState() => _RiderHomeScreenState();
}

class _RiderHomeScreenState extends State<RiderHomeScreen> with TickerProviderStateMixin{

  late TabController _tabController;
  
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: _customAppbar(),
      endDrawer: _customDrawer(),
      body: Column(
        children: [
          Container(
            color: const Color(0xFFF5F5F5),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black87,
              dividerColor: Color(0xFFFF9B6A),
              unselectedLabelColor: Colors.black54,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Color(0xFFFF9B6A),
                  width: 4,
                ),

              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              tabs:  [
                Tab(
                  child: Text('New Orders',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                        fontSize: 14
                    ),),
                ),
                Tab(
                  child: Text('Current Order',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                        fontSize: 14
                    ),),
                ),
                Tab(
                  child: Text('Complete Order',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                        fontSize: 14
                    ),),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
     Expanded(
       child: TabBarView(
         controller: _tabController,
         children: [
           RiderNewOrderScreen(),
           RiderCurrentOrderScreen(),
           RiderCompleteOrderScreen(),
         ],
       ),
     ),


        ],
      ),
      bottomNavigationBar: RiderBottomMenu(0),
    );
  }

  AppBar _customAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          /// Profile photo
          Container(
            height: 38,
            width: 38,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/image/dummy.jpg')),
                shape: BoxShape.circle),

          ),
          const SizedBox(width: 8),

          /// Name + Location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Ashiqur Rahman",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3A3A35),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),


                Row(
                  children: [
                    SvgPicture.asset('assets/icons/location.svg',
                    color: Color(0xFF5C5C5C),),
                    SizedBox(width: 8,),
                    Text(
                      "San Fernando Warehouse",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF3A3A35),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),

      actions: [

        const SizedBox(width: 8),

        Builder(
          builder: (context) => InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Container(
              height: 36,
              width: 36,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEDEDED),
              ),
              child: const Icon(
                Icons.menu,
                color: Colors.black87,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Drawer _customDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.textColor),
            child: Image.asset("assets/image/app_logo.png",width: 91,
              height: 70,),
          ),
          _customListTile(
              onTap: (){
                Get.to(()=> LanguageScreen());
              },
              title: "Language",
              icon: "assets/icons/language.svg",
              trailingIcon:  "assets/icons/arrow_right.svg"
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> FaqScreen());
            },
            title: "FAQ",
            icon: "assets/icons/faq.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> PrivacyPolicyScreen());
            },
            title: "Privacy Policy",
            icon: "assets/icons/privacy.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> TermsAndConditionScreen());
            },
            title: "Terms & Conditions",
            icon: "assets/icons/terms.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> FeedbackScreen());
            },
            title: "Feedback",
            icon: "assets/icons/feedback.svg",
          ),


          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> SettingsScreen());
            },
            title: "Settings",
            icon: "assets/icons/setting.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          SizedBox(height: 100,),
          InkWell(
            onTap: (){
              Get.to(()=> SelectRoleScreen());
            },
            child: Container(
              width: 168,
              padding: EdgeInsets.symmetric(horizontal: 28),
              margin: EdgeInsets.only(left: 28, right: 50, bottom: 50),
              height: 54,
              decoration: BoxDecoration(
                  color: Color(0xFF89B12C),
                  borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/logout.svg'),
                  SizedBox(width: 8,),
                  Text('Logout',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),)
                ],
              ),
            ),
          )


        ],
      ),
    );
  }

  Widget _customListTile({required String title, required String icon, String? trailingIcon, required Function()? onTap,}) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
      ),
      trailing: trailingIcon != null ? SvgPicture.asset(trailingIcon) : null,
    );}


}
