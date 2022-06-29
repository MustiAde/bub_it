import 'package:bub_it/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data.dart';
import '../screens/recent_links.dart';

class RecentUrlComponent extends StatefulWidget {
  const RecentUrlComponent({Key? key}) : super(key: key);

  @override
  State<RecentUrlComponent> createState() => _RecentUrlComponentState();
}

class _RecentUrlComponentState extends State<RecentUrlComponent> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
    builder: ((context, child) {
      return Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Column(
          children: [
            ListView.separated(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: recentUrls.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.web),
                      SizedBox(width: 30.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(recentUrls[index].site, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 15),),
                          SizedBox(height: 5.h, ),
                          Text(recentUrls[index].url,style: GoogleFonts.poppins( fontSize: 13),),
                          SizedBox(height: 5.h,),
                          Text(recentUrls[index].shortenedUrl,style: GoogleFonts.poppins(fontSize: 12,color: const Color(0xFFA1887F))),
                          SizedBox(height: 5.h,),
                          Text(recentUrls[index].time,style: GoogleFonts.poppins(fontSize: 12)),
                          Row(
                            children:  [
                              const DetailedBoxWidget(),
                              SizedBox(width: 20.w,),
                              const CopyButton(),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );

              }, separatorBuilder: (BuildContext context, int index) {
              return const Divider(thickness: 1,);
            },),
          ],
        ),

    );
    }));
  }
}