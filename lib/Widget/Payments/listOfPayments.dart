import 'package:Dealings/MORE/Classes/handlingStatusRemotDataView.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Payments/payments_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Localization/translateDB.dart';

class ListOfPayments extends StatefulWidget {
  const ListOfPayments({Key? key}) : super(key: key);

  @override
  State<ListOfPayments> createState() => _ListOfPaymentsState();
}

class _ListOfPaymentsState extends State<ListOfPayments>
    with SingleTickerProviderStateMixin {
  final Payments_Controller controller = Get.put(Payments_Controller());
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // ابدأ من الجانب الأيمن
      end: Offset.zero, // الوصول إلى الموضع الأصلي
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCirc,
    ));

    // بدء الانيميشن عند تحميل الويدجت
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<Payments_Controller>(
        builder: (controller) => HandlingStatusRemotDataView(
        statusRequest: controller.statusRequest,
        widget:


        SlideTransition(
      position: _animation,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.listOFPayment.length,
        itemBuilder: (context, index) {
          return ExpansionTileCard(
            expandedTextColor: ColorApp.intergalactic,
            turnsCurve: Curves.fastOutSlowIn,
            animateTrailing: false,
            initiallyExpanded: true,
            duration: const Duration(milliseconds: 500),
            expandedColor: ColorApp.pureWhite.withOpacity(0.8),
            trailing: Icon(
              Icons.payments_outlined,
              color: ColorApp.warmGray,
            ),
            title: Text(
              "${controller.listOFPayment[index].typeReq}".tr+" - "+
              translateDB(
                controller.listOFPayment[index].nameArabic,
                controller.listOFPayment[index].nameEnglish,
              ),

              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 15, color: ColorApp.intergalactic.withOpacity(0.5)),
            ),
            children: [
              ListTile(
                title: Text(controller.listOFPayment[index].invoiceNumber!.toString(),
                    style: Theme.of(context).textTheme.displaySmall!),
                leading: Text("PaymentNumber".tr,
                    style: Theme.of(context).textTheme.displaySmall!),
                trailing: MaterialButton(
                    onPressed: controller.listOFPayment[index].statusPay==1 || controller.listOFPayment[index].statusPay==3?() {

                      controller.dialogForPaymentReceipts(
                        context,
                          controller.listOFPayment[index].invoiceNumber!.toString(),
                          controller.listOFPayment[index].totalCoast.toString()!,
                          controller.listOFPayment[index].idReq.toString()!,
                          controller.listOFPayment[index].typeReq.toString()!,

                      );
setState(() {
});
                    }:null,
                    child: Text(controller.listOFPayment[index].statusPay==1 || controller.listOFPayment[index].statusPay==3?"pay".tr:"Paid".tr),
                    color: controller.listOFPayment[index].statusPay==1 || controller.listOFPayment[index].statusPay==3?ColorApp.paw:ColorApp.warmGray,
                    splashColor: ColorApp.mildBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ListTile(
                title: Text(controller.listOFPayment[index].idReq.toString()!,
                    style: Theme.of(context).textTheme.displaySmall!),
                leading: Text("PaymentIDReq".tr,
                    style: Theme.of(context).textTheme.displaySmall!),
              ),
              ListTile(
                title: Text(
                    controller.listOFPayment[index].dateInsert.toString().substring(0,16),
                    style: Theme.of(context).textTheme.displaySmall!),
                leading: Text("PaymentDate".tr,
                    style: Theme.of(context).textTheme.displaySmall!),
              ),
              ListTile(
                title: Text(
                    controller.convertCodeStatus(controller.listOFPayment[index].statusPay).toString(),
                    style: Theme.of(context).textTheme.displaySmall!),
                leading: Text("PaymentStatus".tr,
                    style: Theme.of(context).textTheme.displaySmall!),
              ),
              ListTile(
                title: Text(controller.listOFPayment[index].totalCoast.toString()!+" \$ ",
                    style: Theme.of(context).textTheme.displaySmall!),
                leading: Text("Paymentamount".tr,
                    style: Theme.of(context).textTheme.displaySmall!),
              ),
            ],
          );
        },
      ),
    )));
  }
}
