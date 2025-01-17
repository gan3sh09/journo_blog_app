part of 'update_category_import.dart';

@RoutePage()
class UpdateCategory extends StatefulWidget {
  final Category categoriesData;
  const UpdateCategory({required this.categoriesData, super.key});

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  late UpdateCategoryViewModel updateCategoryViewModel;

  @override
  void initState() {
    updateCategoryViewModel =
        UpdateCategoryViewModel(repository: context.read<Repository>());
    updateCategoryViewModel.textEditingController.text =
        widget.categoriesData.title.toString();
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
          title: Text('Update Category'),
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
                  controller: updateCategoryViewModel.textEditingController,
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
                  controller: updateCategoryViewModel.textEditingController,
                  keyboardType: TextInputType.text,
                  hintText: 'Eg. software-development',
                  onChanged: (value) {},
                ),
                50.heightBox,
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                  bloc: updateCategoryViewModel.isLoadingBloc,
                  builder: (context, state) {
                    return PrimaryButton(
                      isLoading: state.data,
                      title: 'Update Category',
                      onPressed: () => updateCategoryViewModel.updateCategories(
                        context,
                        widget.categoriesData.id.toString(),
                      ),
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
