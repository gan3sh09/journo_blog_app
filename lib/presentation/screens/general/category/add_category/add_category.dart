part of 'add_category_import.dart';

@RoutePage()
class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  late AddCategoryViewModel addCategoryViewModel;

  @override
  void initState() {
    addCategoryViewModel = AddCategoryViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Category'),
          leading: AutoLeadingButton(),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                5.heightBox,
                CustomTextFormField(
                  controller: addCategoryViewModel.textEditingController,
                  keyboardType: TextInputType.text,
                  hintText: 'Eg. Software Development',
                  onChanged: (value) {},
                ),
                20.heightBox,
                Text(
                  'Slug',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                5.heightBox,
                CustomTextFormField(
                  controller: addCategoryViewModel.textEditingController,
                  keyboardType: TextInputType.text,
                  hintText: 'Eg. software-development',
                  onChanged: (value) {},
                ),
                50.heightBox,
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                  bloc: addCategoryViewModel.isLoadingBloc,
                  builder: (context, state) {
                    return PrimaryButton(
                      isLoading: state.data,
                      title: 'Add New Category',
                      onPressed: () => addCategoryViewModel.addNewCategories(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
