import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';

class HistoryDetailsScreen extends StatefulWidget {
  const HistoryDetailsScreen({super.key});

  @override
  State<HistoryDetailsScreen> createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> with TickerProviderStateMixin{

  bool _expanded = false;
  bool _isExpanded = false;


  final List<Map<String, dynamic>> products = [
    {
      'name': 'Orange',
      'details': '500gm / 2pcs',
      'price': '\$20',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg',
    },
    {
      'name': 'Papaya',
      'details': '1kg / 4pcs',
      'price': '\$20',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/6/6b/Papaya_cross_section_BNC.jpg',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.backgroundColor,
      appBar: CustomAppbar(title: "History Details",),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFFCFCFD),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000).withValues(alpha: 0.15),
                    blurRadius: 4
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Products: 3",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF555656)
                      ),),
                      Container(
                        width: 98,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEEF6),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Center(
                          child: Text("Pending",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5B52A3)
                          ),),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  Text("Delivery Fee : \$25",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF555656)
                  ),),
                  SizedBox(height: 8,),
                  Text("Date:  20-Dec-2024, 3:00 PM",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF555656)
                  ),),
                  SizedBox(height: 8,),
                  Text("Price: \$75",
                  style: TextStyle(
                      fontSize: 14,
                    color: Color(0xFF555656),
                      fontWeight: FontWeight.w500,
                  ),)

                ],
              ),
            ),
          ),
          SizedBox(height: 12,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFEFEFE),

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  InkWell(
                    onTap: () {
                      setState(() => _expanded = !_expanded);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "Products",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6E6E6F)
                          ),
                        ),
                        AnimatedRotation(
                          turns: _expanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF6E6E6F),),
                        )
                      ],
                    ),
                  ),

                  /// Animated Expand Section
                  AnimatedSize(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    child: _expanded
                        ? Column(
                      children: products
                          .map((item) => Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 6.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(8),
                                child: Image.network(
                                  item['image'],
                                  height: 61,
                                  width: 61,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF6E6E6F)
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      item['details'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF929394),
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                item['price'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF6E6E6F)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                          .toList(),
                    )
                        :const SizedBox(
                      width: double.infinity,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 12,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFEFEFE),

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  InkWell(
                    onTap: () {
                      setState(() => _isExpanded = !_isExpanded);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6E6E6F)
                          ),
                        ),
                        AnimatedRotation(
                          turns: _isExpanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF6E6E6F),),
                        )
                      ],
                    ),
                  ),

                  /// Animated Expand Section
                  AnimatedSize(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    child: _isExpanded
                        ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _customText(
                              title: "Payment Option"
                            ),
                           _customText(title: "Cash on Delivery")
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _customText(
                                title: "Sub Total"
                            ),
                            _customText(title: "\$70")
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _customText(
                                title: "Delivery Fee"
                            ),
                            _customText(title: "\$5")
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Text("Total",
                           style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             color: Color(0xFF5B52A3)
                           ),),
                            Text("\$75",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF5B52A3)
                              ),)
                          ],
                        ),
                      ],
                    )
                        :const SizedBox(
                      width: double.infinity,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _customText({required String title}) {
    return Text(title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF929394)

                          ),);
  }
}
