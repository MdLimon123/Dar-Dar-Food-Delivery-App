import 'package:dar_dar_foodd_delivery_app/controllers/userController/card_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/bottom_menu..dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_network_image.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserCardScreen/AllSubScreen/check_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final _cardController = Get.put(CardController());

  @override
  void initState() {
    _cardController.loadCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Add to Cart",
          style: TextStyle(
            color: Color(0xFF3A3A35),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: Obx(
        () => _cardController.cartItems.isEmpty
            ? Center(child: Text("Cart is empty"))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 42,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    color: Color(0xFFDEECBF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shop Name: Drop Five Digital Outlet",
                          style: TextStyle(
                            color: Color(0xFF3A3A35),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.close, color: AppColors.textColor),
                      ],
                    ),
                  ),
                  SizedBox(height: 14),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        final data = _cardController.cartItems[index];

                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEFEFE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                right: 0,
                                top: 0,
                                child: InkWell(
                                  onTap: () {
                                    _cardController.removeItem(index);
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/delete.svg",
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),

                              /// Main Row
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Product Image
                                  CustomNetworkImage(
                                    imageUrl: data.image,
                                    height: 80,
                                    borderRadius: BorderRadius.circular(8),
                                    width: 80,
                                  ),

                                  const SizedBox(width: 10),

                                  /// Details Column
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          data.name,
                                          style: const TextStyle(
                                            color: Color(0xFF555656),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          "${data.gm} gm",
                                          style: TextStyle(
                                            color: Color(0xFF929394),
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 12),

                                        Obx(
                                          () => Row(
                                            children: [
                                              Text(
                                                "\$${(data.price * data.quantity.value).toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF555656),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                height: 46,
                                                width: 84,
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xFFE6E5F1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        _cardController
                                                            .decrease(index);
                                                      },
                                                      child: Text(
                                                        "-",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                            0xFF555656,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "${data.quantity}",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color(
                                                          0xFF555656,
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        _cardController
                                                            .increase(index);
                                                      },
                                                      child: Text(
                                                        "+",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                            0xFF555656,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemCount: _cardController.cartItems.length,
                    ),
                  ),
                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6E6E6F),
                          ),
                        ),
                        Obx(
                          () => Text(
                            "\$${_cardController.totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6E6E6F),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6E6E6F),
                          ),
                        ),
                        Text(
                          "\$120",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6E6E6F),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Color(0xFFC3C4C6)),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5B52A3),
                          ),
                        ),
                        Obx(
                          () => Text(
                            "\$${(_cardController.totalPrice + 120).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF5B52A3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: CustomButton(
                      onTap: () {
                        Get.to(
                          () => CheckOutScreen(
                            subTotal: _cardController.totalPrice
                                .toStringAsFixed(2),
                            deliveryFee: "120",
                            total: (_cardController.totalPrice + 120)
                            
                                .toStringAsFixed(2),
                          ),
                        );
                      },
                      text: "Check Out",
                    ),
                  ),
                ],
              ),
      ),

      bottomNavigationBar: UserBottomMenu(3),
    );
  }
}
