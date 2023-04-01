
import 'package:eye_light/navigator/router_class.dart';
import 'package:eye_light/resources/color_manager.dart';
import 'package:eye_light/resources/font_manager.dart';
import 'package:eye_light/resources/styles_manager.dart';
import 'package:eye_light/ui/screen/label_detector_view.dart';
import 'package:eye_light/ui/screen/record_query_by_voice.dart';
import 'package:eye_light/ui/screen/record_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraOrInquiry extends StatelessWidget {
  const CameraOrInquiry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        leading: IconButton(onPressed:(){
          RouterClass.routerClass.popFunction();
        },icon: Icon(
          Icons.arrow_back_ios,color: ColorManager.white,size: 32.w,),
        ),
        actions:   [
          IconButton(onPressed:(){},icon: Icon(
            Icons.volume_up,color: ColorManager.white,size: 32.w,),
          )
        ],),
      body: Center(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           GestureDetector(
             onTap: ()=>RouterClass.routerClass.pushWidget(  ImageLabelView()),
             child: Container(
               width: 145.w,
               height: 145.h,
               decoration: BoxDecoration(
                   color: ColorManager.white,
                   shape: BoxShape.circle,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black.withOpacity(.4),
                     spreadRadius:1,
                     blurRadius: 4,
                     offset:const Offset(0, 2,),
                   ),
                 ],
               ),
               child: Icon(Icons.camera_alt,color: ColorManager.black,size: 45.w,) ,
             ),
           ),
           GestureDetector(
             onTap: ()=>RouterClass.routerClass.pushWidget( RecordSecreen()),
             child: Container(
               width: 145.w,
               height: 145.h,
               decoration: BoxDecoration(
                   color: ColorManager.white,
                   shape: BoxShape.circle,
                 boxShadow: [
                   BoxShadow(
                       color: Colors.black.withOpacity(.4),
                       spreadRadius:1,
                       blurRadius: 4,
                       offset:const Offset(0, 2,),
                   ),
                 ],
               ),
               child:Center(child: Text('?',style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s40) ,)),
             ),
           ),
         ],
       ),
      ),
    );
  }
}
