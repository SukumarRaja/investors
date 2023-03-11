import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/colors.dart';
import '../widgets/transaction_history_card.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Stack(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                height: 50,
                                padding:
                                    const EdgeInsets.only(left: 25, top: 8),
                                margin: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.white.withOpacity(.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(0.2, 0.6)),
                                  ],
                                  gradient: const LinearGradient(
                                      colors: [
                                        AppColors.primary,
                                        AppColors.secondary
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.topLeft),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(
                                      fontFamily: "Oswald",
                                      color: AppColors.white),
                                  cursorColor: AppColors.white,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: "search transactions",
                                    hintStyle: TextStyle(
                                        fontFamily: "Oswald",
                                        color: AppColors.white.withOpacity(.5),
                                        fontSize: 16),
                                  ),
                                )),
                            Positioned(
                                top: 2,
                                bottom: 2,
                                left: 25,
                                child: Icon(
                                  Icons.search,
                                  color: AppColors.white.withOpacity(.5),
                                  size: 18,
                                ))
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.white.withOpacity(.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0.2, 0.6)),
                          ],
                          gradient: const LinearGradient(
                              colors: [AppColors.primary, AppColors.secondary],
                              begin: Alignment.topRight,
                              end: Alignment.topLeft),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: media.height / 11),
                  child: ListView.builder(
                      itemCount: 15,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return const TransactionHistoryCard();
                      }),
                )
              ],
            )),
      ),
    );
  }
}
