import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/color.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        actions: [
          InkWell(
            onTap: () {
              print('mark all as read is clicked');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.white)),
                child: const Center(
                  child: Text(
                    'MARK ALL AS READ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: ListView.separated(
            itemCount: 12,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(0.12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'GREAT OFFER!',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '1 hour ago',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '11:11 OFFER! starts from today ends after 12:00 A.M. Grab the offer.',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 12,
              );
            },
          ),
        ),
      ),
    );
  }
}
