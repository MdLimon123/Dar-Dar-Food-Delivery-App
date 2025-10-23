import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/vendor_bottom_menu..dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorHomeScreen/AllSubScreen/vendor_order_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({super.key});

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> with TickerProviderStateMixin{

  late TabController _tabController;


  bool isApproved = false;

  @override
  void initState() {
    setState(() {
      isApproved = true;

    });
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> orders = List.generate(10, (index) {
    return {
      'title': 'Total 05 Items',
      'quantity': '05',
      'price': '\$400',
      'address': '2464 Royal Ln. Mesa',
      'fee': '\$30',
      'image':
      'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=400&q=60',
    };
  });
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: _customAppbar(),
      endDrawer: _customDrawer(),
      body: isApproved ?
      SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),

          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  /// Top summary cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    child: Row(
                      children: [
                        _summaryCard('Total Order', '120', widthFactor: 0.45),
                        const SizedBox(width: 8),
                        _summaryCard('Pending Order', '04', widthFactor: 0.35),
                        const SizedBox(width: 8),
                        _allButton(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Card with graph and tabs
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      children: [
                        /// White card container
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFFEFEFE),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                /// Heading row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(
                                      'EARNING',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: AppColors.textColor,
                                      ),
                                    ),

                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 28,
                                              padding: const EdgeInsets.symmetric(horizontal: 8),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value: "Last Week",
                                                  icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF8526F2)),
                                                  style: const TextStyle(
                                                    color: Color(0xFF8526F2),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  dropdownColor: Colors.white,
                                                  items: const [
                                                    DropdownMenuItem(value: "Last Week", child: Text("Last Week",
                                                       style: TextStyle( color: Color(0xFF8526F2),
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400))),
                                                    DropdownMenuItem(value: "Last Month", child: Text("Last Month",
                                                        style: TextStyle( color: Color(0xFF8526F2),
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w400))),
                                                    DropdownMenuItem(value: "Last Year", child: Text("Last Year",
                                                        style: TextStyle( color: Color(0xFF8526F2),
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w400))),
                                                  ],
                                                  onChanged: (value) {
                                                    // Handle dropdown change
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),




                                  ],
                                ),
                                const SizedBox(height: 6),
                                /// Chart area
                                SizedBox(
                                  height: 160,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                    child: LineChart(sampleLineChartData()),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                /// dates row (small)
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children:  [
                                      Text('16\nMAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: AppColors.textColor,
                                          ), textAlign: TextAlign.center),
                                      Text('17\nMAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: AppColors.textColor,
                                          ), textAlign: TextAlign.center),
                                      Text('18\nMAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: AppColors.textColor,
                                          ), textAlign: TextAlign.center),
                                      Text('19\nMAR',
                                          style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: AppColors.textColor,
                                      ), textAlign: TextAlign.center),
                                      Text('20\nMAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: AppColors.textColor,
                                          ), textAlign: TextAlign.center),
                                      Text('21\nMAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: AppColors.textColor,
                                          ), textAlign: TextAlign.center),
                                      Text('22\nMAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: AppColors.textColor,
                                          ), textAlign: TextAlign.center),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// Tabs for New Orders / Picked Order
                        Column(
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
                                  insets: EdgeInsets.symmetric(horizontal: 60.0),
                                ),
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                tabs:  [
                                  Tab(
                                    child: Text('New Orders (2)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor,
                                      fontSize: 14
                                    ),),
                                  ),
                                  Tab(
                                    child: Text('Picked Order (97)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColor,
                                        fontSize: 14
                                    ),),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 10),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  _ordersList(),
                                  _pickOrder(),
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
            ),
          ),
        ),
      )
          :
      _customNotApprovedBody(),
      bottomNavigationBar: VendorBottomMenu(0),
    );
  }

  Widget _customNotApprovedBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
         Center(
           child: Image.asset("assets/image/stopwatch.png",
             height: 58,
             width: 58,),),
      SizedBox(height: 24,),

      Center(
        child: Text("Your documents have been correctly submitted to the admin.Wait for admin approval. Admin will send you a notification if any documents are required.",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF686868)
        ),
        textAlign: TextAlign.center,),
      )
      ],
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
            height: 24,
            width: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle),
            child: SvgPicture.asset('assets/icons/location_fill.svg'),
          ),
          const SizedBox(width: 8),

          /// Name + Location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Restaurant Location",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3A3A35),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),


                    Text(
                      "San Fernando Warehouse",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF3A3A35),
                      ),
                      overflow: TextOverflow.ellipsis,
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
              onTap: (){},
              title: "Language",
              icon: "assets/icons/language.svg",
              trailingIcon:  "assets/icons/arrow_right.svg"
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){

            },
            title: "FAQ",
            icon: "assets/icons/faq.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){

            },
            title: "Privacy Policy",
            icon: "assets/icons/privacy.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){

            },
            title: "Terms & Conditions",
            icon: "assets/icons/terms.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){

            },
            title: "Feedback",
            icon: "assets/icons/feedback.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(() => VendorOrderScreen());
            },
            title: "Orders",
            icon: "assets/icons/order_fill.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){

            },
            title: "History",
            icon: "assets/icons/history.svg",
          ),


          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){

            },
            title: "All Products",
            icon: "assets/icons/product.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){

            },
            title: "Settings",
            icon: "assets/icons/setting.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          SizedBox(height: 100,),
          InkWell(
            onTap: (){

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


  Widget _summaryCard(String title, String value, {double widthFactor = 0.4}) {
    return Expanded(
      flex: (widthFactor * 100).toInt(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(title,
                  style:  TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5C5C5C))),
              const SizedBox(height: 6),
              Text(value,
                  style:  TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500,
                  color: AppColors.textColor)),
            ]),
            const Spacer(),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.insert_chart, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _allButton() {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        color: const Color(0xFFF57E50),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'All',
          style: TextStyle(color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _ordersList() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final item = orders[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _orderCard(item),
        );
      },
    );
  }

  Widget _orderCard(Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFEFEFE),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 5)
        ],
      ),
      child: Column(
        children: [
          /// top row: image + texts
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item['image']!,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'] ?? '',
                        style:  TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                            fontSize: 14),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                           Text('Quantity: ',
                              style: TextStyle(color: Color(0xFF5C5C5C),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                          Text(item['quantity'] ?? '',
                              style: TextStyle(color: Color(0xFF5C5C5C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Text('Price: ',
                              style: TextStyle(
                                color: Color(0xFF96C330),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                          Text(item['price'] ?? '',
                              style: const TextStyle(
                                color: Color(0xFF96C330),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),



          /// address row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE7FFFB),
                      borderRadius: BorderRadius.circular(5),),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/location.svg"),
                        const SizedBox(width: 6),
                        Expanded(
                            child: Text(item['address'] ?? '',
                                style: const TextStyle(
                                  color: Color(0xFF70B9B7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ))),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 6),
             Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFEEFE9),
                    borderRadius: BorderRadius.circular(5),),
               child: Row(
                 children: [
                   SvgPicture.asset("assets/icons/bike.svg"),
                   const SizedBox(width: 6),
                   Text('Delivery Fee: ${item['fee']}',
                       style:  TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w500,
                         color: Color(0xFFF35E24)
                       )),
                 ],
               ),
             )
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// Accept / Cancel buttons
          Padding(
            padding: const EdgeInsets.only(
                left: 12, right: 12, bottom: 12, top: 4),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF96C330),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  Text('Accept',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFAFAFA),
                    ),),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD2290B),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  Text('Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFAFAFA),
                    ),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _pickOrder() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final item = orders[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child:  _pickCardOrder(item),
        );
      },
    );
  }
  Widget _pickCardOrder(Map<String, String> item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFEFEFE),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 5)
          ],
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  item['image']!,
                  width: 28,
                  height: 28,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 14,),
              Text("Total 05 Items",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor
              ),)
            ],
          ),
          SizedBox(height: 10,),
         Row(
           children: [
             Text("Quantity: 01",
               style: TextStyle(
                   fontSize: 12,
                   fontWeight: FontWeight.w400,
                   color: Color(0xFF5C5C5C)
               ),),
             SizedBox(width: 8,),
             Text("Price: \$400",
             style: TextStyle(
               fontSize: 14,
               fontWeight: FontWeight.w400,
               color: Color(0xFF96C330)
             ),),
             SizedBox(width: 8,),
             Text("Time: 2 hr",
             style: TextStyle(
               fontSize: 12,
               fontWeight: FontWeight.w400,
               color: Color(0xFF5C5C5C)
             ),)
           ],
         ),
          SizedBox(height: 10,),
          Text("Pick Up Location : 2464 Royal Ln. Mesa ",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
          ),),
          SizedBox(height: 10,),
          Text("Delivery Location : : 2464 Royal Ln. Mesa ",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor
            ),),
          SizedBox(height: 10,),
          Text("Pick Up Time : 07:13 pm",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
          ),),
          SizedBox(height: 10,),
          Text("Delivery Time : 07:13 pm",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor
            ),),
          SizedBox(height: 24,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFFFEEFE9),
              borderRadius: BorderRadius.circular(8),),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/image/dummy.jpg'))
                  ),
                ),
                SizedBox(width: 12,),
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
                    SizedBox(height: 10,),
                    Text("+1 (470) 918 8577",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                    ),)
                  ],
                ),
                Spacer(),
                Container(
                  width: 98,
                  height: 34,
                  decoration: BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(
                    child: Text("Complete",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFAFAFA),
                    ),),
                  ),
                )

              ],
            ),
          )

        ],
      ),
    );
  }

}

/// Chart data function (fl_chart)
LineChartData sampleLineChartData() {
  final spots = <FlSpot>[
    FlSpot(0, 2),
    FlSpot(1, 2.6),
    FlSpot(2, 1.8),
    FlSpot(3, 3.2),
    FlSpot(4, 2.8),
    FlSpot(5, 3.6),
    FlSpot(6, 4.0),
  ];

  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) {
        return FlLine(color: Colors.grey.withValues(alpha: 0.12),
            strokeWidth: 1);
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles: AxisTitles(
        sideTitles:
        SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    ),
    borderData: FlBorderData(show: false),
    lineTouchData: LineTouchData(enabled: false),
    minY: 0,
    maxY: 5,
    lineBarsData: [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        gradient: const LinearGradient(
          colors: [Color(0xFFCAB5E7), Color(0xFFEDE0FE)],
        ),
        barWidth: 3,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
              colors: [
                const Color(0xFF7B61FF).withValues(alpha: 0.16),
                const Color(0xFFB28DFF).withValues(alpha: 0.06)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      ),
    ],
  );
}
