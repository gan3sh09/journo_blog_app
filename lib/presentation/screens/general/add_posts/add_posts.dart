part of 'add_post_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  final QuillController _controller = QuillController.basic();
  bool isEditorEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      final isEmpty = _controller.document.toPlainText().trim().isEmpty;
      if (isEmpty != isEditorEmpty) {
        setState(() {
          isEditorEmpty = isEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Add Post'),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    HugeIcons.strokeRoundedTick01,
                    size: 28.h,
                  ),
                ),
              )
            ],
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child:
                        Image.asset(AppAssets.assetsImagesAddPostsPlaceholder),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      HugeIcons.strokeRoundedCameraLens,
                      color: AppColors.primaryColor,
                      size: 28,
                    ),
                  ),
                ],
              ),
              20.heightBox,
              CustomTextFormField(
                keyboardType: TextInputType.text,
                hintText: 'Title',
                fillColor: AppColors.whiteColor,
              ),
              20.heightBox,
              CustomTextFormField(
                keyboardType: TextInputType.text,
                hintText: 'Slug',
                fillColor: AppColors.whiteColor,
              ),
              20.heightBox,
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tags',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 1,
                  color: AppColors.greyColor,
                )),
                child: QuillSimpleToolbar(
                  controller: _controller,
                  configurations: const QuillSimpleToolbarConfigurations(),
                ),
              ),
              10.heightBox,
              Container(
                padding: EdgeInsets.all(20),
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    QuillEditor.basic(
                      controller: _controller,
                    ),
                    if (isEditorEmpty)
                      IgnorePointer(
                        child: Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Enter your text here...",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
