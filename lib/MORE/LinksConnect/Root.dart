import 'package:get/get.dart';
import '../../Views/Account/privacyPolicy.dart';
import '../../Views/Chat/chat_page.dart';
import '../../Views/Chat/usersListPage.dart';
import '../../Views/Home/requestDocument.dart';
import '../../Views/Home/home.dart';
import '../../Views/Home/legalconsultation.dart';
import '../../Views/Home/mainScreen.dart';
import '../../Views/Home/requestaPassport.dart';
import '../../Views/LoginCode/forgetMyCode.dart';
import '../../Views/Payments/paymentsPage.dart';
import '../../Views/LoginCode/loginCode.dart';
import '../../Views/Notifications/notifications.dart';
import '../../Views/OnBoarding/onboarding.dart';
import '../../Views/Tracking/tracking.dart';
import '../../mix/exp_AlignTransitio.dart';
import '../../mix/exp_AnimatedOpacityFade.dart';
import '../../mix/exp_DefaultTextStyleTransition .dart';
import '../../mix/exp_PaddingTransition.dart';
import '../../mix/exp_PositionedDirectionalTransition.dart';
import '../../mix/exp_PositionedTransition.dart';
import '../../mix/exp_RotationTransition.dart';
import '../../mix/exp_ScaleTransition.dart';
import '../../mix/exp_SlideTransition.dart';
import '../../mix/imp_AnimatedAlign.dart';
import '../../mix/imp_AnimatedDefaultTextStyle.dart';
import '../../mix/imp_AnimatedFractionallySizedBox.dart';
import '../../mix/imp_AnimatedOpacity.dart';
import '../../mix/imp_AnimatedPadding.dart';
import '../../mix/imp_AnimatedPhysicalModel.dart';
import '../../mix/imp_AnimatedPositioned.dart';
import '../../mix/imp_AnimatedPositionedDirectional.dart';
import '../../mix/imp_AnimatedRotation.dart';
import '../../mix/imp_AnimatedScale.dart';
import '../../mix/imp_AnimatedSlide.dart';
import '../../withController_Transition_&_Builder/FooTransition.dart';
import '../../withController_Transition_&_Builder/FooTransition2.dart';
import '../../withController_Transition_&_Builder/FooTransition3.dart';
import '../../withController_Transition_&_Builder/animationBuilder.dart';
import '../../withOutController_Foo_&_Tween/AnimatedFoo1.dart';
import '../../withOutController_Foo_&_Tween/TweenAnimation.dart';
import '../Core/Localization/languageItems/language.dart';
import '../Core/MiddleWare/mymiddleware.dart';


List<GetPage<dynamic>>? routes = [

 GetPage(name: "/Language", page: () => Language()),
GetPage(name: "/", page: () => Language(), middlewares: [Mymiddleware()]),

  GetPage(name: "/OnBoarding", page: () => OnBoarding()),
  GetPage(name: "/LoginCode", page: () => LoginCode()),
  GetPage(name: "/Home", page: () => Home()),
  GetPage(name: "/MainScreen", page: () => MainScreen()),
  GetPage(name: "/Notifications", page: () => Notifications()),
  //Home
  GetPage(name: "/RequestDocument", page: () => RequestDocument()),
  GetPage(name: "/LegalConsultation", page: () => LegalConsultation()),
  GetPage(name: "/RequestaPassport", page: () => RequestaPassport()),
  GetPage(name: "/PaymentsPage", page: () => PaymentsPage()),
  GetPage(name: "/ForgetMyCode", page: () => ForgetMyCode()),
  GetPage(name: "/Tracking", page: () => Tracking()),
  GetPage(name: "/UsersListPage", page: () => UsersListPage()),
  GetPage(name: "/ChatPage", page: () => ChatPage(userId: "",userName: "",)),
  GetPage(name: "/PrivacyPolicy", page: () => PrivacyPolicy()),
  ////---------------------------------------------------------------------
  //GetPage(name: "/", page: () => Basic()),
  GetPage(name: "/AnimatedFoo1", page: () => AnimatedFoo1()),
  GetPage(name: "/TweenAnimation", page: () => TweenAnimation()),
  GetPage(name: "/FooTransition", page: () => FooTransition()),
  GetPage(name: "/FooTransition2", page: () => FooTransition2()),
  GetPage(name: "/FooTransition3", page: () => FooTransition3()),
  GetPage(name: "/animationBuilder", page: () => animationBuilder()),
  GetPage(name: "/Animated_Rotation", page: () => Animated_Rotation()),
  GetPage(name: "/Rotation_Transition", page: () => Rotation_Transition()),
  GetPage(name: "/Animated_Opacity", page: () => Animated_Opacity()),
  GetPage(name: "/Animated_OpacityFade", page: () => Animated_OpacityFade()),
  GetPage(name: "/Animated_Default_TextStyle", page: () => Animated_Default_TextStyle()),
  GetPage(name: "/Default_TextStyle_Transition", page: () => Default_TextStyle_Transition()),
  GetPage(name: "/Animated_Slide", page: () => Animated_Slide()),
  GetPage(name: "/Slide_Transition", page: () => Slide_Transition()),
  GetPage(name: "/Animated_Positioned", page: () => Animated_Positioned()),
  GetPage(name: "/Positioned_Transition", page: () => Positioned_Transition()),
  GetPage(name: "/Animated_Positioned_Directional", page: () => Animated_Positioned_Directional()),
  GetPage(name: "/Positioned_Directional_Transition", page: () => Positioned_Directional_Transition()),
  GetPage(name: "/Animated_Padding", page: () => Animated_Padding()),
  GetPage(name: "/Padding_Transition", page: () => Padding_Transition()),
  GetPage(name: "/Animated_Physical_Model", page: () => Animated_Physical_Model()),
  GetPage(name: "/Animated_Fractionally_SizedBox", page: () => Animated_Fractionally_SizedBox()),
  GetPage(name: "/Animated_Align", page: () =>  Animated_Align()),
  GetPage(name: "/Align_Transition", page: () =>  Align_Transition()),
  GetPage(name: "/Animated_Scale", page: () =>  Animated_Scale()),
  GetPage(name: "/Scale_Transition", page: () =>  Scale_Transition()),
];
