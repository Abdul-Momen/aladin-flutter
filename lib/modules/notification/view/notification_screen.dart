import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/notification/controller/notification_controller.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "/notification";

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationController notificationController =
      Get.put(NotificationController());
  @override
  void initState() {
   /* if (Get.arguments != null) {
      //pId = int.parse(Get.arguments[0]);
    }*/
    notificationController.getNotifications();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 75.h,
        title: "Notifications",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Today",
                style: TextStyle(
                    color: ConstantColors.grayBlack,
                    fontSize: 20.sp,
                    fontFamily: ConstantStrings.kAppInterBold),
              ),
            ),*/
         /*   Divider(
              color: ConstantColors.grayShade,
              thickness: 0.2,
            ),*/
            Obx(() {
              if (notificationController.pNotifications.value) {
                return const SizedBox();
              } else {
                if (notificationController
                    .notificationsModel!.data.notification.isNotEmpty) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: ListView.builder(
                      itemCount: notificationController
                          .notificationsModel!.data.notification.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Notice(
                            date:    DateFormat('dd/MM/yyyy')
                                .format(
                                notificationController
                                    .notificationsModel!.data.notification[index].receivedAt)


                           ,
                            time: DateFormat('hh:mm a')
                            .format(
                            notificationController
                                .notificationsModel!.data.notification[index].receivedAt),
                            notifications:
                            notificationController
                                .notificationsModel!.data.notification[index].message);
                      },
                    ),
                  );
                } else {
                  return const Text("List Is Empty");
                }
              }
            }),

          ],
        ),
      ),
    );
  }
}

class Notice extends StatelessWidget {
  final String date;
  final String time;
  final String notifications;
  const Notice(
      {Key? key,
      required this.date,
      required this.time,
      required this.notifications})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: ConstantColors.grayBlack,
                        fontFamily: ConstantStrings.kAppInterMedium),
                  ),
                  Container(
                 //   padding: EdgeInsets.only(bottom: 42.h),
                 //   width: 100.w,
                    child: Row(
                      children: [
                        Icon(Icons.restart_alt,
                            size: 20.r, color: ConstantColors.normalTextColor),
                        addW(5.w),
                        Text(
                          time,
                          style: TextStyle(
                              color: ConstantColors.normalTextColor,
                              fontFamily: ConstantStrings.kAppInterMedium),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              addH(10),
            ],
          ),
    /*      trailing: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(bottom: 42.h),
              width: 100.w,
              child: Row(
                children: [
                  Icon(Icons.restart_alt,
                      size: 20.r, color: ConstantColors.normalTextColor),
                  addW(5.w),
                  Text(
                    time,
                    style: TextStyle(
                        color: ConstantColors.normalTextColor,
                        fontFamily: ConstantStrings.kAppInterMedium),
                  )
                ],
              ),
            ),
          ),*/
          subtitle: Text(
            notifications,
            style: TextStyle(
                height: 1.4.h,
                color: ConstantColors.normalTextColor,
                fontFamily: ConstantStrings.kAppInterMedium),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Divider(
            color: ConstantColors.grayShade,
            thickness: 0.2,
          ),
        ),
      ],
    );
  }
}