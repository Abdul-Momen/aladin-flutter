import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/winer/model/winners_list_model.dart';
import 'package:aladin/modules/winer/view/winners_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WinnerItems extends StatelessWidget {
  final double? winH;
  final double? carH;
  final Winner winner;

  const WinnerItems({
    Key? key,
    this.winH,
    this.carH,
    required this.winner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(WinnerScreen.routeName);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 5),
        height:470.h,
        width: 255.w,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Container(
              height: winH ?? 180.h,
              width: 255.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/winner_background.png"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(60),
                      image: DecorationImage(
                          image: NetworkImage(winner.productImage),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Text(
                    "Congratulations",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: ConstantStrings.kAppInterRegular,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  addH(10),
                  Text(
                    winner.aladinTicket.member.fullName,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: ConstantStrings.kAppInterBold,
                        color: Colors.white),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'on winning ${winner.prizeName}',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kAppInterMedium,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: carH ?? 120.h,
                    width: double.infinity,
                    child: Image.network(
                      winner.prizeImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Divider(
                    color: Colors.black45,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 255.w,
                          child: Row(
                            children: [
                              Text("Ticket No. #",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontFamily: ConstantStrings.kAppInterRegular,
                                  )),
                              Expanded(
                                child: Text(winner.aladinTicket.aladinTicketSerial ?? '',
                                    softWrap: false,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily:
                                          ConstantStrings.kAppInterRegular,
                                      color: Colors.black,
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 255.w,
                          child: Row(
                            children: [
                              SizedBox(
                               // width: Get.width,
                                child: Text(
                                    "Announced on: \n${DateFormat('dd/MM/yyyy hh:mm a').format(winner.announcedDate)}",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontFamily:
                                            ConstantStrings.kAppInterRegular)),
                              ),
                              /*    Text(winner.announcedTime.toString(),
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: ConstantStrings.kAppInterRegular,
                                    color: Colors.black45,
                                  ))*/
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
