part of 'general_imports.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int visit = 0;

  List<Widget> pages = [
    Home(),
    Categories(
      navigateType: NavigateType.outer,
    ),
    AddPosts(),
    Tags(
      navigateType: NavigateType.outer,
    ),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    List<TabItem> items = [
      TabItem(
        icon: HugeIcons.strokeRoundedHome01,
        title: AppLocalizations.of(context)!.dashboard,
      ),
      TabItem(
        icon: HugeIcons.strokeRoundedDashboardSquareAdd,
        title: AppLocalizations.of(context)!.category,
      ),
      TabItem(
        icon: HugeIcons.strokeRoundedAdd01,
      ),
      TabItem(
        icon: HugeIcons.strokeRoundedTags,
        title: AppLocalizations.of(context)!.tags,
      ),
      TabItem(
        icon: HugeIcons.strokeRoundedUserCheck01,
        title: AppLocalizations.of(context)!.profile,
      ),
    ];
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
