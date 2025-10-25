import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RiderCompleteOrderScreen extends StatefulWidget {
  const RiderCompleteOrderScreen({super.key});

  @override
  State<RiderCompleteOrderScreen> createState() => _RiderCompleteOrderScreenState();
}

class _RiderCompleteOrderScreenState extends State<RiderCompleteOrderScreen> {


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
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final item = orders[index];
        return InkWell(
          onTap: (){
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _pickCardOrder(item),
          ),
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
