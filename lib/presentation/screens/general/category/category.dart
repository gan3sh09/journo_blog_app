part of 'category_imports.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Categories'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                HugeIcons.strokeRoundedAdd01,
              ),
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          separatorBuilder: (context, index) => 10.heightBox,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.whiteColor,
              child: ListTile(
                leading: Text(
                  "${index + 1}".toString(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                title: Text(
                  "Enter a Category",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        HugeIcons.strokeRoundedTaskEdit02,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        HugeIcons.strokeRoundedDelete02,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
