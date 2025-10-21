import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> with TickerProviderStateMixin{

  List<bool> _expanded = [false, false, false,false,false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "FAQ",
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return  Container(
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
                        setState(() => _expanded[index] = !_expanded[index]);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Question no 1",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF6E6E6F)
                            ),
                          ),
                          AnimatedRotation(
                            turns: _expanded[index] ? 0.5 : 0.0,
                            duration: const Duration(milliseconds: 200),
                            child: const Icon(Icons.navigate_next,
                              color: Color(0xFF6E6E6F),),
                          )
                        ],
                      ),
                    ),

                    /// Animated Expand Section
                    AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      child: _expanded[index]
                          ? Column(
                        children: [
                          Text("What can I do",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6E6E6F)
                          ),)
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
            );
          },
          separatorBuilder: (context, index)=> SizedBox(height: 10,),
          itemCount: 5),
    );
  }
}
