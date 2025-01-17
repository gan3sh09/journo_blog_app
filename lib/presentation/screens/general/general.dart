part of 'general_imports.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  List<TabItem> items = [
    TabItem(
      icon: HugeIcons.strokeRoundedHome01,
      title: 'Home',
    ),
    TabItem(
      icon: HugeIcons.strokeRoundedDashboardSquareAdd,
      title: 'Category',
    ),
    TabItem(
      icon: HugeIcons.strokeRoundedAdd01,
      title: 'Wishlist',
    ),
    TabItem(
      icon: HugeIcons.strokeRoundedTags,
      title: 'Tags',
    ),
    TabItem(
      icon: HugeIcons.strokeRoundedUserCheck01,
      title: 'profile',
    ),
  ];
  int visit = 0;

  List<Widget> pages = [
    Home(),
    Categories(),
    AddPosts(),
    Tags(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: visit,
        children: pages,
      ),
      bottomNavigationBar: BottomBarCreative(
        items: items,
        backgroundColor: AppColors.scafLightBackground,
        titleStyle: Theme.of(context).textTheme.bodySmall,
        color: AppColors.textColor,
        colorSelected: AppColors.primaryColor,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
          debugPrint(visit.toString());
        }),
      ),
    );
  }
}
