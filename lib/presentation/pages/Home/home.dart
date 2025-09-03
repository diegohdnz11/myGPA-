import 'package:classic_gpa/presentation/pages/GPA/gpa_page.dart';
import 'package:classic_gpa/presentation/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:classic_gpa/presentation/pages/Home/home_plus.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  List<String> courses = [];

  void addCourse() async {
    final newCourse = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePlus()),
    );

    if (newCourse != null && newCourse.toString().isNotEmpty) {
      setState(() {
        courses.add(newCourse.toString());
      });
    }
  }

  void deleteCourse(String course) {
    setState(() {
      courses.remove(course);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return _selectedIndex == 0
                ? <Widget>[
                    SliverAppBar(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          iconSize: 36,
                        ),
                      ),
                      titleSpacing: 0.0,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Calculadora de Notas',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            onPressed: addCourse,
                            icon: const Icon(Icons.add),
                            iconSize: 40,
                          ),
                        )
                      ],
                      floating: true, 
                      snap: true, 
                      pinned: false, 
                    ),
                  ]
                : <Widget>[];
          },
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: <Widget>[
              courses.isEmpty
                  ? const Center(
                      child: Text(
                        "vacio",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w200),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: courses.length,
                      itemBuilder: (context, i) {
                        final course = courses[i];
                        return Center(
                          child: HomeCard(
                            courseName: course,
                            onDelete: () => deleteCourse(course),
                          ),
                        );
                      },
                    ),
              const GpaPage(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: BorderRadius.circular(40),
            ),
            child: GNav(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                haptic: true,
                tabBorderRadius: 30,
                curve: Curves.easeOutExpo,
                duration: const Duration(
                    milliseconds: 100),
                gap: 1,
                color: Colors.white,
                activeColor: Colors.white,
                iconSize: 24,
                tabBackgroundColor:
                    Colors.green.shade800,
                selectedIndex: _selectedIndex,
                onTabChange: _onTabChange,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 5),
                tabs: const [
                  GButton(
                    icon: LineIcons.divide,
                    text: 'Calificacion',
                  ),
                  GButton(
                    icon: LineIcons.book,
                    text: 'GPA',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
