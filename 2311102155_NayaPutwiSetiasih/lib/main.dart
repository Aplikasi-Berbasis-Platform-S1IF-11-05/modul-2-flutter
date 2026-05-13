import 'package:flutter/material.dart';

void main() {
  runApp(const MyCampusApp());
}

class MyCampusApp extends StatelessWidget {
  const MyCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My LMS",
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xffF4F7FB),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> upcoming = [
      {
        "judul": "Big Data Analytics",
        "matkul": "Big Data",
        "jam": "Today • 20:00",
        "progress": 0.8,
        "warna1": const Color(0xff5B67F1),
        "warna2": const Color(0xff8EA2FF),
      },
      {
        "judul": "UI Prototype Figma",
        "matkul": "UI UX Design",
        "jam": "Tomorrow",
        "progress": 0.5,
        "warna1": const Color(0xffFF6B81),
        "warna2": const Color(0xffFFA9B5),
      },
      {
        "judul": "Cloud Computing Quiz",
        "matkul": "Cloud Computing",
        "jam": "Friday",
        "progress": 0.4,
        "warna1": const Color(0xff00B894),
        "warna2": const Color(0xff55EFC4),
      },
    ];

    final List<Map<String, dynamic>> aktivitas = [
      {
        "nama": "Upload Dataset",
        "kelas": "Big Data",
        "status": "Done",
        "icon": Icons.storage_rounded,
        "warna": Colors.green,
      },
      {
        "nama": "Meeting Project UI",
        "kelas": "UI UX Design",
        "status": "Ongoing",
        "icon": Icons.design_services_rounded,
        "warna": Colors.orange,
      },
      {
        "nama": "Resume Cyber Attack",
        "kelas": "Cyber Security",
        "status": "Pending",
        "icon": Icons.security_rounded,
        "warna": Colors.redAccent,
      },
      {
        "nama": "Deploy REST API",
        "kelas": "Backend Programming",
        "status": "Review",
        "icon": Icons.cloud_upload_rounded,
        "warna": Colors.blue,
      },
    ];

    return Scaffold(

      backgroundColor: const Color(0xffF4F7FB),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff5B67F1),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: "Course",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded),
              label: "Schedule",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // HEADER
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  const Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Hello Student 👋",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "My LMS Dashboard",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2D3142),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [

                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withValues(alpha: 0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.search_rounded,
                          color: Color(0xff5B67F1),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withValues(alpha: 0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: Color(0xff5B67F1),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 30),

              // MAIN BANNER
              Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(35),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff5B67F1),
                      Color(0xff8EA2FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue
                          .withValues(alpha: 0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),

                child: Stack(
                  children: [

                    Positioned(
                      top: -30,
                      right: -20,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white
                              .withValues(alpha: 0.08),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -40,
                      left: -10,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white
                              .withValues(alpha: 0.08),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [

                              Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white
                                      .withValues(alpha: 0.18),
                                  borderRadius:
                                      BorderRadius.circular(
                                          20),
                                ),
                                child: const Text(
                                  "Semester 6",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.w600,
                                  ),
                                ),
                              ),

                              const Spacer(),

                              const Icon(
                                Icons.school_rounded,
                                color: Colors.white,
                                size: 35,
                              )
                            ],
                          ),

                          const Text(
                            "Manage Your\nLearning Activity",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              height: 1.2,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Row(
                            children: [

                              Expanded(
                                child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(
                                            18),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "View Schedule",
                                      style: TextStyle(
                                        color:
                                            Color(0xff5B67F1),
                                        fontWeight:
                                            FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white
                                      .withValues(alpha: 0.18),
                                  borderRadius:
                                      BorderRadius.circular(
                                          18),
                                ),
                                child: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 35),

              // MENU
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  featureItem(
                    Icons.storage_rounded,
                    "Big Data",
                    const Color(0xffEEF1FF),
                    const Color(0xff5B67F1),
                  ),

                  featureItem(
                    Icons.design_services_rounded,
                    "UI UX",
                    const Color(0xffFFEAF0),
                    const Color(0xffFF6B81),
                  ),

                  featureItem(
                    Icons.security_rounded,
                    "Security",
                    const Color(0xffE8FFF4),
                    const Color(0xff00B894),
                  ),

                  featureItem(
                    Icons.cloud_rounded,
                    "Cloud",
                    const Color(0xffFFF4E4),
                    const Color(0xffF39C12),
                  ),
                ],
              ),

              const SizedBox(height: 38),

              // TITLE
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    "Upcoming Tasks",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2D3142),
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xff5B67F1),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 18),

              // TASK LIST
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcoming.length,
                  itemBuilder: (context, index) {

                    final data = upcoming[index];

                    return Container(
                      width: 260,
                      margin:
                          const EdgeInsets.only(right: 18),
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            data['warna1'],
                            data['warna2'],
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            children: [

                              Container(
                                padding:
                                    const EdgeInsets.all(
                                        12),
                                decoration: BoxDecoration(
                                  color: Colors.white
                                      .withValues(
                                          alpha: 0.2),
                                  borderRadius:
                                      BorderRadius
                                          .circular(18),
                                ),
                                child: const Icon(
                                  Icons.menu_book_rounded,
                                  color: Colors.white,
                                ),
                              ),

                              const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                              )
                            ],
                          ),

                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Text(
                                data['judul'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                data['matkul'],
                                style: const TextStyle(
                                  color:
                                      Colors.white70,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Row(
                                children: [

                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 18,
                                  ),

                                  const SizedBox(width: 6),

                                  Text(
                                    data['jam'],
                                    style:
                                        const TextStyle(
                                      color:
                                          Colors.white,
                                    ),
                                  )
                                ],
                              ),

                              const SizedBox(height: 15),

                              ClipRRect(
                                borderRadius:
                                    BorderRadius
                                        .circular(20),
                                child:
                                    LinearProgressIndicator(
                                  minHeight: 8,
                                  value:
                                      data['progress'],
                                  backgroundColor:
                                      Colors.white24,
                                  valueColor:
                                      const AlwaysStoppedAnimation(
                                    Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 38),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    "Recent Activity",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2D3142),
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "More",
                      style: TextStyle(
                        color: Color(0xff5B67F1),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 16),

              // ACTIVITY
              Column(
                children: List.generate(
                  aktivitas.length,
                  (index) {

                    final item = aktivitas[index];

                    return Container(
                      margin:
                          const EdgeInsets.only(bottom: 18),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withValues(alpha: 0.04),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          )
                        ],
                      ),

                      child: Row(
                        children: [

                          Container(
                            height: 68,
                            width: 68,
                            decoration: BoxDecoration(
                              color: item['warna']
                                  .withValues(alpha: 0.12),
                              borderRadius:
                                  BorderRadius.circular(
                                      20),
                            ),
                            child: Icon(
                              item['icon'],
                              color: item['warna'],
                              size: 32,
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [

                                Text(
                                  item['nama'],
                                  style:
                                      const TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(
                                        0xff2D3142),
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  item['kelas'],
                                  style:
                                      const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: item['warna']
                                  .withValues(alpha: 0.12),
                              borderRadius:
                                  BorderRadius.circular(
                                      30),
                            ),
                            child: Text(
                              item['status'],
                              style: TextStyle(
                                color: item['warna'],
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget featureItem(
    IconData icon,
    String title,
    Color bgColor,
    Color iconColor,
  ) {

    return Column(
      children: [

        Container(
          height: 78,
          width: 78,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 35,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xff2D3142),
          ),
        )
      ],
    );
  }
}