import 'package:fitnessapp/app_colors.dart';
import 'package:fitnessapp/custom_widget/wave_container.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int selectedIndex = 0; // default selected index

  List<DateTime> monthDates = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    monthDates = _getDaysInMonth(DateTime.now());
    // default selected = today
    // default selected = today
    selectedIndex = monthDates.indexWhere((d) =>
    d.day == DateTime.now().day &&
        d.month == DateTime.now().month &&
        d.year == DateTime.now().year);

    // jump to today’s position when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelected();
    });

  }



  void _scrollToSelected() {
    const cardWidth = 67.0; // 55 width + 12 margin approx
    _scrollController.animateTo(
      (selectedIndex - 2) * cardWidth, // keep today around center
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  List<DateTime> _getDaysInMonth(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    final lastDay = DateTime(date.year, date.month + 1, 0);
    return List.generate(
        lastDay.day, (index) => DateTime(date.year, date.month, index + 1));
  }

  SizedBox CustomDatePicker() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: monthDates.length,
        itemBuilder: (context, index) {
          final date = monthDates[index];
          final isSelected = selectedIndex == index;

          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    _scrollToSelected();
                  });
                },
                child: Container(
                  width: 55,
                  height: 70,

                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color(AppColors.colorPrimaryBlack)
                        : Color(AppColors.colorPrimaryGreen),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        DateFormat('E').format(date)[0], // Day letter
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        DateFormat('d').format(date), // Date number
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              if (isSelected)
                Container(
                  width: 6,
                  height: 6,
                  decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(AppColors.colorPrimaryBlack)
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              DateFormat('MMMM yyyy').format(DateTime.now()),
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(AppColors.colorPrimaryBlack),
              ),
            ),
            const SizedBox(height: 16),

            // Horizontal Date Picker
            CustomDatePicker(),

            const SizedBox(height: 16),
            Text("Today Report",
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(AppColors.colorPrimaryBlack),
              ),
            ),

            SizedBox(height: 16,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    //Active Calories
                    Container(
                      width: 112,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFBF9),
                        border: Border.all(color: Color(AppColors.colorPrimaryBlack).withOpacity(0.1),width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Active calories",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(AppColors.colorPrimaryBlack).withOpacity(0.5),
                            ),
                          ),
                          Text("645 Cal",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(AppColors.colorPrimaryBlack),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 18,),
                    //Training time
                    Container(
                      width: 112,
                      height: 132,
                      decoration: BoxDecoration(
                        color: Color(0xffEAECFF),

                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Training time",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(AppColors.colorPrimaryBlack),
                            ),
                          ),
                          CircularPercentIndicator(
                            radius: 36.0,
                            lineWidth: 10.0,
                            animation: true,
                            percent: 0.8,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Color(0xffA48AED),
                            reverse: true,
                            backgroundColor: Colors.white,
                            center: Text("80%",style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(AppColors.colorPrimaryBlack)
                            ),),

                          )

                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 222,
                      height: 218,
                      decoration: BoxDecoration(
                        color: Color(AppColors.colorPrimaryBlack),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 13.0,top: 13.0,bottom: 13),
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFAFBF9),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Icon(Icons.directions_bike_outlined,color: Color(AppColors.colorPrimaryBlack),size: 18,),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("Cycling",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFAFBF9),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 197,
                            height: 146,

                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Image.asset("images/map_image.png",fit: BoxFit.cover,),
                          )


                        ],
                      ),
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 16,),

            //TODO:Health RATE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 199,
                      height: 167,
                      decoration: BoxDecoration(
                        color: Color(0xffFFEBEB),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 13.0,top: 13.0,bottom: 13),
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF9B9B9),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Icon(Icons.monitor_heart_outlined,color: Color(0xffA80000),size: 18,),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("Hearth Rate",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(AppColors.colorPrimaryBlack),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 175,
                            height: 91,
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Image.asset("images/graph.png",fit: BoxFit.cover,),
                          )


                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    //Steps
                    Container(
                      width: 135,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffFFE8C6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 13.0,top: 13.0,bottom: 13),
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF8D39D),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Icon(Icons.snowshoeing_outlined,color: Color(0xff865A19),size: 18,),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("Steps",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(AppColors.colorPrimaryBlack),
                                ),
                              ),
                            ],
                          ),
                          Text("999/2000",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(AppColors.colorPrimaryBlack),
                            ),
                          ),
                          SizedBox(height: 4,),
                          LinearPercentIndicator(
                            width: 112.0,
                            lineHeight: 12.0,
                            percent: 0.5,
                            barRadius: Radius.circular(25),
                            backgroundColor: Color(0xffFFEDD1),
                            progressColor: Color(0xffFCC46F),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    //Training time
                    Container(
                      width: 135,
                      height: 51,
                      decoration: BoxDecoration(
                        color: Color(0xffF6CFCF),

                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Keep it Up!',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(AppColors.colorPrimaryBlack),
                                ),
                              ),
                              TextSpan(
                                text: '💪',
                                style:  TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(AppColors.colorPrimaryBlack),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),

            SizedBox(height: 16,),
            //TODO:SLeep
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 178,
                    height: 128,
                    decoration: BoxDecoration(
                      color: Color(0xffEFE2FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0,top: 13.0,bottom: 13),
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0xffD6BBF8),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Icon(Icons.nightlight_outlined,color: Color(0xff3D275A),size: 18,),
                              ),
                            ),
                            SizedBox(width: 8,),
                            Text("Sleep",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(AppColors.colorPrimaryBlack),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 138,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xffEFE2FF),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Image.asset("images/bar_chart.png",fit: BoxFit.cover,),
                        )


                      ],
                    ),
                  ),
                  Container(
                    width: 156,
                    height: 128,
                    decoration: BoxDecoration(
                      color: Color(0xffD8E6EC),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0,top: 13.0,bottom: 13),
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0xffAED1E0),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Icon(Icons.water_drop_outlined,color: Color(0xff2B4855),size: 18,),
                              ),
                            ),
                            SizedBox(width: 8,),
                            Text("Water",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(AppColors.colorPrimaryBlack),
                              ),
                            ),
                          ],
                        ),

                        Stack(
                          children: [
                            Container(
                              width: 132,
                              height: 58,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(19),bottomLeft: Radius.circular(19))
                              ),
                              child: WaveContainer(),
                            ),
                            Text(
                              "6/8 Cups",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(AppColors.colorPrimaryBlack),
                              ),
                              textAlign: TextAlign.center,
                            ),

                          ],
                        )



                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
