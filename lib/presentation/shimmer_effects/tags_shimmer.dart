import 'package:flutter/material.dart';
import 'package:journo_blog_app/presentation/common_widgets/common_widgets_imports.dart';
import 'package:shimmer/shimmer.dart';

class TagsShimmer extends StatelessWidget {
  const TagsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        separatorBuilder: (context, index) => 10.heightBox,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.transparent,
            child: ListTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
              ),
              title: Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  25.widthBox,
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
