import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sthedule/components/add_entry_form.dart';
import 'package:sthedule/components/fullwidth_btn.dart';
import 'package:sthedule/components/namebox_round.dart';
import 'package:sthedule/components/searchbar_fullwdh.dart';
import 'package:sthedule/components/slick_slider_item.dart';
import 'package:sthedule/components/slickslider/slick_slider.dart';
import 'package:sthedule/components/task_entry.dart';
import 'package:sthedule/main.dart';
import 'package:sthedule/models/user.dart';
import 'package:sthedule/models/work_entry.dart';
import 'package:sthedule/provider/colorprovider.dart';
import 'package:sthedule/provider/workentry_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _searchfiltercontroller = TextEditingController();
  int _selectedIndex = 0;
  List<WorkEntry> filteredEntries = [];

  @override
  void initState() {
    super.initState();
    filteredEntries = context.read<WorkEntryProvider>().entries;
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _searchfilter(String query) {
  setState(() {
    filteredEntries = context.read<WorkEntryProvider>().entries // Get the full list of entries
        .where((entry) => entry.getProject().toLowerCase().contains(query.toLowerCase()))
        .toList();
  });
}

  void _openWorkEntryFormDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final colorProvider = Provider.of<ColorProvider>(context, listen: false);
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Rounded corners for the dialog
          ),
          child: Container(
            width: MediaQuery.of(context).size.width, // Dialog width to 80% of screen width
            padding: const EdgeInsets.all(16.0),
            child: AddEntryForm(
              btnCallBack: () {
                Navigator.of(context).pop(); // Close the dialog when the form is submitted
              },
              btnColor: colorProvider.mainColorDark,
              txtColor: colorProvider.textColorLight,
              txtColorDark: colorProvider.textColorDark,
            )
          )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    final workEntryProvider = Provider.of<WorkEntryProvider>(context);
    User loggedInUser = User('_id', 'Laakkonen', 'Joni', '_username', '_email', '_password', List.empty(), '_company', '_userLevel', '_profilePicture');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(//--------SEARCH BAR--------
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: SearchbarFullwdh(
                txtColorLight: colorProvider.textColorLGray,
                searchCallback: _searchfilter,
                searchController: _searchfiltercontroller,
                )
            ),
            const SizedBox(height: 16.0),
            SlickSlider(//--------slick slider--------
              items: favoriteEntries.map((item) {
                return SlickSliderItem(
                  txtColorDark: colorProvider.textColorDark,
                  txtColorLight: colorProvider.textColorGray,
                  boxColor: colorProvider.mainColorLight,
                  boxIxon: Icons.work_outline,
                  item: item,
                );
              },
              ).toList(),
              options: SlickOptions(
                height: 200,
                viewportFraction: 0.45,
                autoPlay: false,
                initialPage: 0, // Start from the first item
                enableInfiniteScroll: false, //Disable the "center item enlargement"
                padEnds: false,
              ),
            ),
            Padding( //--------ADD BUTTON--------
              padding: const EdgeInsets.symmetric( vertical: 16.0, horizontal: 16.0),
              child: FullwidthBtn(
                btnCallBack: _openWorkEntryFormDialog,
                btnColor: colorProvider.mainColorDark,
                txtColor: colorProvider.textColorLight,
                btnText: "Add",
                btnIcon: Icons.add_rounded,
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: workEntryProvider.getLength(),
                  itemBuilder: (context, index) {
                    WorkEntry entry = workEntryProvider.getEntry(workEntryProvider.getLength()-(index+1));
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NameboxRound(
                              txtColor: colorProvider.textColorLight,
                              boxColor: colorProvider.mainColorDark,
                              user: loggedInUser
                            ),
                            const SizedBox(width: 10.0,),
                            TaskEntry(
                              txtColorDark: colorProvider.textColorDark,
                              txtColorGrey: colorProvider.textColorGray,
                              txtColorLightGrey: colorProvider.textColorLGray,
                              boxColor: colorProvider.mainColorLight,
                              borderColor: colorProvider.mainColorDark,
                              entry: entry,
                            ),
                          ]
                        ),
                        const SizedBox(height: 16.0),
                      ]
                    );
                  },
                )
              )
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorProvider.mainColorDark,
              ),
              child: const Text(
                'Sthedule',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Option 1'),
              onTap: () {
                // Handle option 1
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.abc),
              title: const Text('Option 2'),
              onTap: () {
                // Handle option 2
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Option 3'),
              onTap: () {
                // Handle option 3
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorProvider.mainColorDark,
        selectedItemColor: colorProvider.textColorLight,
        unselectedItemColor: colorProvider.textColorLight,
        items: [
          BottomNavigationBarItem(
            icon: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer when pressed
                },
              ),
            ),
            tooltip: 'Open menu',
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.map),
                onPressed: () {
                },
              ),
            ),
            tooltip: 'Map',
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                },
              ),
            ),
            tooltip: 'Profile',
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}