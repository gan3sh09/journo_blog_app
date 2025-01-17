part of 'update_tags_import.dart';

@RoutePage()
class UpdateTags extends StatefulWidget {
  final Tag tagsData;
  const UpdateTags({required this.tagsData, super.key});

  @override
  State<UpdateTags> createState() => _UpdateTagsState();
}

class _UpdateTagsState extends State<UpdateTags> {
  late UpdateTagsViewModel updateTagsViewModel;

  @override
  void initState() {
    updateTagsViewModel =
        UpdateTagsViewModel(repository: context.read<Repository>());
    updateTagsViewModel.textEditingController.text =
        widget.tagsData.title.toString();
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
          title: Text('Update Tags'),
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
                  controller: updateTagsViewModel.textEditingController,
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
                  controller: updateTagsViewModel.textEditingController,
                  keyboardType: TextInputType.text,
                  hintText: 'Eg. software-development',
                  onChanged: (value) {},
                ),
                50.heightBox,
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                  bloc: updateTagsViewModel.isLoadingBloc,
                  builder: (context, state) {
                    return PrimaryButton(
                      isLoading: state.data,
                      title: 'Update Tag',
                      onPressed: () => updateTagsViewModel.updateTags(
                        context,
                        widget.tagsData.id.toString(),
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
