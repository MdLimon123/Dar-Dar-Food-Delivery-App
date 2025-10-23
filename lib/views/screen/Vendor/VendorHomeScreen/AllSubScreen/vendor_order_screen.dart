import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorOrderScreen extends StatefulWidget {
  const VendorOrderScreen({super.key});

  @override
  State<VendorOrderScreen> createState() => _VendorOrderScreenState();
}

class _VendorOrderScreenState extends State<VendorOrderScreen> with TickerProviderStateMixin{
  late TabController _tabController;

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
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Orders",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
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
                    child: Text('Active Orders (2)',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                          fontSize: 14
                      ),),
                  ),
                  Tab(
                    child: Text('Past Orders (97)',
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _ordersList(),
                 _pickOrder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _ordersList() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,

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

                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF35E24),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  Text('Track',
                      style: TextStyle(
                        fontSize: 12,
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
