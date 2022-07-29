import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import 'package:get_hay/constants/enum.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => profileController.state == ViewState.Busy
            ? _buildLoadingWidget()
            : _buildSuccessWidget()),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(child: SpinKitCircle(color: Colors.red));
  }

  Widget _buildSuccessWidget() {
    return SingleChildScrollView(
      child: Stack(children: [
        Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.30,
              decoration: BoxDecoration(
                color: Colors.red[400],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 4, child: SizedBox()),
                      Expanded(
                        flex: 2,
                        child: Text(
                          profileController.profile.firstName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(profileController.profile.lastName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1.2)))
                    ]),
              ),
            ),
            Container(
              // height: Get.height * 0.65 - 24,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  top: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Username',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      profileController.profile.userName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      profileController.profile.email == ''
                          ? 'Not Provided'
                          : profileController.profile.email,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      profileController.profile.phone,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.1),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        // Positioned(
        //   child: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.white,
        //     ),
        //     onPressed: () => Get.back(),
        //   ),
        //   top: 20,
        //   left: 15,
        // ),
        // CustomPaint(
        //   painter: OpenPainter1(),
        // ),
        // CustomPaint(
        //   painter: OpenPainter2(),
        // ),
        Positioned(
          left: Get.width * 0.72,
          top: Get.height * 0.25,
          child: SizedBox(
            height: 60,
            width: 60,
            child: FloatingActionButton(
              tooltip: "Edit",
              backgroundColor: Colors.white,
              onPressed: () {
                Get.toNamed(Routes.PROFILE_EDIT);
              },
              child: Icon(
                Icons.edit,
                size: 30,
                color: Colors.red[400],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class OpenPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    //draw arc
    canvas.drawArc(
        Offset(Get.width * 0.73, Get.height * 0.3) & Size(75, 75),
        3.1415, //radians
        3.1415, //radians
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    //draw arc
    canvas.drawArc(
        Offset(Get.width * 0.71, Get.height * 0.29) & Size(90, 90),
        3.1415, //radians
        3.1415, //radians
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
