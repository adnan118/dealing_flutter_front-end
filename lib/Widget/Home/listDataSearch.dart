import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../Controller/Home/home_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Localization/translateDB.dart';
import '../../MORE/Data/Model/typeDocsModel.dart';

class ListDataSearch extends StatefulWidget {
  final List<TypeDocsModel> listdata;

  const ListDataSearch({Key? key, required this.listdata}) : super(key: key);

  @override
  State<ListDataSearch> createState() => _ListDataSearchState();
}

class _ListDataSearchState extends State<ListDataSearch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  final Home_Controller homeController = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child:Wrap(
      children: [
        Text(
          "Suggestions".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: ColorApp.warmGray, fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.1, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: _animationController,
            curve: Curves.fastOutSlowIn,
          )),
          child:

          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة في الشبكة
              childAspectRatio: 2, // نسبة عرض وارتفاع العنصر
              crossAxisSpacing: 5, mainAxisSpacing: 8,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.listdata.length,
            itemBuilder: (context, index) {
              return IconButton(
                onPressed: () {
                  homeController.goToReqDocs(widget.listdata[index].typeDocsIdId);
                },
                splashRadius: 1,
                icon: Neumorphic(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(20)),
                      color: ColorApp.paw,
                      depth: 2,
                      shape: NeumorphicShape.concave),
                  child: Center(
                    child: Text(
                        "${translateDB(widget.listdata[index].typeDocsIdNameAr, widget.listdata[index].typeDocsIdNameEn)}",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 13)),
                  ),
                ),
              );
            },
          ),

        )
      ],
    )
    )

    ;
  }
}
