import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "myLang": "ar",
          "TitleApp": "تعاملات",
          //////////////////////////////////////////
          //////////////////////////////////////////OnBoarding
          //////////////////////////////////////////
          "title1": "انضم إلينا اليوم!",
          "body1":
              "ابدأ رحلتك الرقمية معنا. سجل الآن لتتمكن من الوصول إلى جميع خدماتنا المتاحة بسهولة وسرعة!",

          "title2": "طلباتك في متناول يدك",
          "body2":
              "قم بتقديم طلباتك بسرعة وسهولة. املأ النموذج المطلوب لتبدأ في الاستفادة من خدماتنا المتنوعة.",

          "title3": " استكشف خدماتنا",
          "body3":
              "نقدم مجموعة شاملة من الخدمات القانونية والإدارية. تصفح القائمة واكتشف كيف يمكننا مساعدتك في احتياجاتك.",

          "title4": "نحن هنا لمساعدتك",
          "body4":
              "إذا كانت لديك أي استفسارات أو تحتاج إلى دعم، نحن هنا للمساعدة. اتصل بفريق الدعم الخاص بنا وسنكون سعداء لمساعدتك.",

          //////////////////////////////////////////
          //////////////////////////////////////////btn Continue
          //////////////////////////////////////////
          "btnContinue": "متابعة",

          //////////////////////////////////////////
          //////////////////////////////////////////Choose Language
          //////////////////////////////////////////
          "chooseLanguage": "اختر اللغة",

          //////////////////////////////////////////
          //////////////////////////////////////////Alert exite
          //////////////////////////////////////////

          "Alert": "تنبيه",
          "bodyAlert": "هل تريد الخروج؟ ",
          "btnConfirm": "متابعة",
          "btnCancel": "تجاهل",
          //////////////////////////////////////////
          /////////////////////valided
          //////////////////////////////////////////

          "vEmpty": "لايمكن ان يكون الحقل فارغ",
          "vNum": "ادخل ارقام فقط",
          "vURL": "رابط غير صالح",
          "vUsername": " اسم المستخدم غير صالح",
          "vMin": " الحد الادنى",
          "vMax": " الحد الأعلى",
          "vEmail": " بريد الكتروني غير صالح",
          "vPhone": " رقم هاتف غير صالح",
          ////////////////////////////
          "Generateanewaccount": "توليد حساب جديد",
          "ihaveacode": "لدي كود دخول",
          "generateAccount": "توليد حساب",
          "titleAppBarrAuthLog": "تسجيل الدخول",
          "fildnumberphone": "الموبايل",
          "fildpassword": "كلمة المرور ",
          "fildemail": "البريد الالكتروني",
          "fildusername": "اسم المستخدم",
          "fildaddress": "العنوان",
          "forgetpassword": "نسيت الرمز الخاص بي",

          //////////////////////////////////////////
          ///////////////////////home
          //////////////////////////////////////////
          "hello": "مرحباً",
          "Searchforservice": "البحث عن خدمة",
          "Requestadocument": "طلب وثيقة",
          "Legalconsultation": "استشارة قانونية",
          "Requestapassport": "طلب جواز سفر",
          "Requestnow": "اطلب الآن",
          "Consultnow": "استشر الآن",
          "Rdocument":
              " يمكن للمواطنين تقديم طلبات للحصول على وثائق مختلفة، مثل وثائق احوال مدنية او دراسية ,البطاقات الوطنية.",
          "Ladvice":
              "يتيح للمواطنين التواصل مع المحامين للحصول على مشورة قانونية.",
          "Rpassport": " يمكن للمواطنين تقديم طلبات للحصول على  جواز السفر",

          //////////////////////////////////////////
          ///////////////////////Req Docs
          //////////////////////////////////////////

          "infoOwner": "معلومات صاحب الوثيقة",
          "infoDocs": "معلومات الوثيقة",
          "ArabicName": "الاسم الكامل بالعربي",
          "ArabicNameHint": "ادخل الاسم الثلاثي بالعربي",
          "EnglishName": "الاسم الكامل بالانجليزي",
          "EnglishNameHint": "ادخل الاسم الثلاثي بالانجليزي",
          "birthdate": "تاريخ الميلاد",
          "Vbirthdate": "تاريخ الميلاد فارغ",
          "docstype": "نوع الوثيقة",
          "LegalAdvisor": "محامي أو أخصائي معاملات",
          "Pleaseselectlawyer": "يرجى اختيار محامي",
          "selectDocsPlease": "يرجى اختيار نوع الوثيقة",
          "selectcountryPlease": "يرجى اختيار بلد الوجهة",
          "translationDocs": "هل تحتاج إلى ترجمة موثقة؟",
          "AttachidentityDone": "الصورة مرفقة.",
          "Selectlanguage": "اختر لغة الترجمة",
          "SelectlanguagePlease": "يرجى اختيار لغة الترجمة'",
          "Attachidentity":
              "قم بإرفاق صورة وجهي الهوية\n بصورة واحدة لصاحب الوثيقة",
          "moreinfo": "معلومات إضافية",
          "countryDestination": "بلد الوجهة",
          "apply": "قدّم الطلب",
          "Submittedsuccessfully": "تم التقديم بنجاح",
          "seeReqSubneission": "راجع طلباتك المقدمة",
          "noLegalconsultation": "لا يوجد استشارات حتى الان",
          "answerconsultation": "الإجابة",
          "Pleaseenterconsultationdetails": "تفاصيل الاستشارة",
          "PleaseenterconsultationTitle": "عنوان الاستشارة",

          "Enterdetailshere": "أدخل التفاصيل هنا",
          "EnterdetailshereTitle": "أدخل العنوان هنا",
          "consultationdetailsValid": "الرجاء إدخال تفاصيل الاستشارة.",
          "consultationdetailsValidTitle": "الرجاء إدخال عنوان الاستشارة.",

          "consultationresponse": "لقد تم إرسال استشارتك، في انتظار الرد.",
          "previousconsultations": "استشاراتك السابقة",

          "Answeredby": "تمت الإجابة من قبل",
          "titlePageConsultion":
              "ما هي المشكلة القانونية التي ترغب في الاستشارة بشأنها؟",

          //////////////////////////////////////////
          ///////////////////////Req Passport
          //////////////////////////////////////////

          "infoOwnerpassport": "معلومات مالك جواز السفر",
          "SelectNationalityPlease": "اختر الجنسية رجاء",

          "Nationality": " الجنسية",
          "yArabicName": " الاسم بالعربية",
          "yEnglishName": " الاسم بالإنجليزية",
          "Relation": "العلاقة",
          "yArabicName": "اسمك (بالعربية)",
          "yEnglishName": "اسمك (بالانجليزية)",
          "FatherNameArabic": "اسم الأب (بالعربية)",
          "FatherNameEnglish": "اسم الأب (بالانجليزية)",
          "MotherNameArabic": "اسم الأم (بالعربية)",
          "MotherNameEnglish": "اسم الأم (بالانجليزية)",
          "SurnameArabic": "الكنية (بالعربية)",
          "SurnameEnglish": "الكنية (بالانجليزية)",
          "Gender": "الجنس",
          "PlaceofBirthArabic": "مكان الولادة (بالعربية)",
          "PlaceofBirthEnglish": "مكان الولادة (بالانجليزية)",
          "titlemale": "ذكر",
          "titlefemale": "أنثى",
          "infoagentpassport": "صاحب العلاقة المطلوب اخراج الوثيقة باسمه هو ",
          "nationalNumber": "الرقم الوطني",
          "Ihaveanoldpassport": "لدي جواز سفر قديم",
          "Oldpassportnumber": "رقم جواز السفر القديم",
          "Oldpassportissuedate": "تاريخ إصدار جواز السفر القديم",
          "Oldpassportexpirydate": "تاريخ انتهاء صلاحية جواز السفر القديم",
          "Oldpassportissueplace": "مكان إصدار جواز السفر القديم",
          "TypePassport": "نوع جواز السفر",
          "PlacePassportRicive": "مكان التسليم",
          "insidethecountry": "داخل القطر",
          "outofcountry": "خارج القطر",
          "Passports": "جوازات سفر",
          "Documents": "وثائق",
          "Dealing": "معاملات",
          "Tracking": "التتبع",
          "Account": "الحساب",
          "updateProfilebtnvMode1": "وضع  الرؤية  ",
          "updateProfilebtnvMode2": "وضع التعديل",
          "updateProfiletitle1": "تحديث المعلومات الشخصية",
          "updateProfiletitle2": "حفظ تعديلات المعلومات الشخصية",
          "updateProfilecontent1":
              "قم بتحديث معلوماتك الشخصية\n من خلال التبديل الى وضع التعديل.",
          "updateProfilecontent2":
              "قم بحفظ تعديلات معلوماتك الشخصية\n من خلال التبديل الى وضع الرؤية.",
          "notificationSetting": "إعدادات الإشعارات",
          "notificationSettingStatusTitle":
              "في حال تم ايقاف الإشعارات لن يصلك اي اشعار او رسالة",
          "notificationStatusBtnOn": " مفعلة",
          "notificationStatusBtnOff": " معطلة",
          "requestStatus": "حالة الطلبات المقدمة",

          "FrequentlyAskedQuestions": " الأسئلة الشائعة",

          "bodyFP":
              "سيتم التحقق من وجود حسابك و اعادة ارسال رمز جديد الى البريد الخاص بك,احتفظ به",
          "ChickEmailbtnFB": "التحقق من البريد الالكتروني و ارسال رمز",
          "moreTools": "المزيد من الأدوات",
          "Languages": "اللغات",
          "Logout": "تسجيل خروج",
          "languCurrent": "اللغة الحالية",
          "Error": "خطأ",
          "Errortitle": "رمز الدخول خطأ ...",

          "newCodetitle": "رمز جديد",
          "newCodeBody": "لقد تم إرسال رمز الدخول الجديد إلى بريدك الإلكتروني.",
          "ErrortitleEmailNotFound": "البريد الالكتروني غير موجود",
          "OK": "حسناً",
          "cityBirth": "مدينة الولادة",
          "Pleaseselectimage": "يرجى اختيار صورة الهوية قبل تأكيد الطلب",
          "selectCityPlease": "يرجى اختيار مدينة الولادة",
          "selectRelation": "يرجى اختيار العلاقة",
          "noLawyerً": "لا يوجد محاميين حاليا",
          "Suggestions": "اقتراحات",

          //payment
          "Paid": "مدفوعة",
          "pay": "ادفع",
          "PaymentStatus": "حالة الدفعة",
          "Paymentamount": "مبلغ الدفعة",
          "PaymentNumber": "رقم الدفعة",
          "PaymentDate": "تاريخ الدفعة",
          "Payments": "الدفعات",
          "PaymentIDReq": "معرف الطلب",
          "Paymentreceipt": "إيصال الدفع",
          "confirmation": "تأكيد",
          "PleaseselectimagePaymentReceipts": "يرجى تحميل صورة لإيصال الدفع الخاص بك.",

          //Notifications
          "Notifications": "الإشعارات",
          "NotificationsEmpty": "الإشعارات فارغة",

          "Waiting": "بالانتظار",
          "Coast": "التكلفة",
          "Save": "حفظ",
          "Message": "رسالة",
          "chatDealings": "دردشات تعاملات",
          "Searchforuser": "ابحث عن المستخدم",
          "chatDealingshint": "لن يظهر لك الا المحامين المسؤولين على طلبك",

          //Privacy Policy
          "PrivacyPolicy":"سياسة الخصوصية",

          "titlePP1":"الاتصالات الخارجية ",
          "subPP1": " نحن غير مسؤولين عن أي تواصل أو اتفاقات تتم خارج التطبيق أو المحادثة الخاصة بالتطبيق.",

          "titlePP2":"شركات الشحن ",
          "subPP2": " نعلن أننا غير مسؤولين عن أي ضرر أو خسارة قد تحدث نتيجة استخدام خدمات شركات الشحن.",

          "titlePP3":"السياسات المالية ",
          "subPP3": " بعد إجراء الدفع، لا يحق استرجاع المبلغ المدفوع.",

          "titlePP4":"مسؤولية المعلومات المقدمة",
          "subPP4": " يتحمل صاحب العلاقة مسؤولية كاملة عن المعلومات المقدمة من قبله، ويجب أن تكون دقيقة وصحيحة.",

          "titlePP5":"حماية البيانات",
          "subPP5": " نحن نعمل على حماية بياناتكم وضمان سلامتها، لكننا لا نتحمل أي مسؤولية عن الاستخدام غير القانوني للمعلومات.",

          "titlePP6":"الامتثال للقوانين ",
          "subPP6": " يجب على جميع المستخدمين الامتثال للقوانين واللوائح المعمول بها في الدولة. يجب على جميع المستخدمين الامتثال للقوانين واللوائح المعمول بها في الجمهورية العربية السورية،\n يشمل ذلك، على سبيل المثال لا الحصر، حماية البيانات الشخصية، مكافحة الجرائم المعلوماتية، وقوانين التجارة الإلكترونية. نحث المستخدمين على الاطلاع على القوانين المحلية ذات الصلة لضمان الاستخدام القانوني للتطبيق.",

          "footerPPT":"للاستفسارات، يرجى التواصل معنا عبر ",
          "footerPPS":" الدردشة > الدعم",
          "RatingReq":"ساعدنا في تحسين خدماتنا من خلال تقييم المحامي لهذا الطلب، \nولن يعرف أحد أنك قمت بالتقييم",
          "Submit":"تأكيد",
          "thnks":"نحن نقدر تقييمك، شكرا لك.",
          "Rating":"تقييم",
          "or":"أو",
          "Lessthanastar":"أقل من نجمة",

        },
        "en": {
          "myLang": "en",
          "TitleApp": "Dealings",

          //////////////////////////////////////////
          //OnBoarding
          //////////////////////////////////////////

          "title1": "Join us today!",
          "body1":
              "Start your digital journey with us. Register now to access all our available services easily and quickly!",

          "title2": "Your requests at your fingertips",
          "body2":
              "Submit your requests quickly and easily. Fill out the required form to start benefiting from our various services.",

          "title3": "Explore our services",
          "body3":
              "We offer a comprehensive range of legal and administrative services. Browse the list and discover how we can help you with your needs.",

          "title4": "We're here to help",
          "body4":
              "If you have any questions or need support, we're here to help. Contact our support team and we'll be happy to help.",

          //////////////////////////////////////////
          //////////////////////////////////////////btn Continue
          //////////////////////////////////////////

          "btnContinue": "Continue",

          //////////////////////////////////////////
          ////////////////////////Choose Language
          //////////////////////////////////////////

          "chooseLanguage": "Choose Language",

          //////////////////////////////////////////
          /////////////////////Alert exite
          //////////////////////////////////////////

          "Alert": "Alert",
          "bodyAlert": "Are you want Exit? ",
          "btnConfirm": "Ok",
          "btnCancel": "Cancel",
          //////////////////////////////////////////
          /////////////////////valided
          //////////////////////////////////////////

          "vEmpty": "can not be fail empty",
          "vNum": "enter only numbers",
          "vURL": "url is not valid",
          "vUsername": "username is not valid",
          "vMin": "min ",
          "vMax": " max ",
          "vEmail": " email is not valid",
          "vPhone": "phone is not valid",
          ////////////////////////////
          "Generateanewaccount": "Generate a new account",
          "ihaveacode": "I have a Login Code",
          "generateAccount": "Generate An Account",
          "titleAppBarrAuthLog": "Login",
          "fildnumberphone": "Phone",
          "fildpassword": "Password",
          "fildemail": "Email",
          "fildusername": "Username",
          "fildusername": "Username",
          "fildaddress": "Address",
          "forgetpassword": "Forget my code",

          //////////////////////////////////////////
          ///////////////////////home
          //////////////////////////////////////////

          "hello": "Hello",
          "Searchforservice": "Search for a service",
          "Requestadocument": "Request a document",
          "Legalconsultation": "Legal consultation",
          "Requestapassport": "Request a passport",
          "Requestnow": "Request now",
          "Consultnow": "Consult now",
          "Rdocument":
              "Citizens can apply for various documents, such as civil status or educational documents, national cards.",
          "Ladvice":
              "Allows citizens to communicate with lawyers to obtain legal advice.",
          "Rpassport": "Citizens can apply for a passport",
          //////////////////////////////////////////
          ///////////////////////Req Docs
          //////////////////////////////////////////

          "infoOwner": "Information of the owner of the document",
          "infoDocs": "Information of the document",
          "ArabicName": "Arabic Full Name",
          "ArabicNameHint": "Enter your full arabic name",
          "EnglishName": "English Full Name",
          "EnglishNameHint": "Enter your full english name",
          "birthdate": "Birth date",
          "Vbirthdate": "Birth date is empty",

          "docstype": "Document Type",
          "translationDocs": "Do you need a certified translation?",
          "selectDocsPlease": "Please select document type",
          "selectcountryPlease": "Please select country destination",
          "LegalAdvisor": "lawyer or Transaction Specialist",
          "Pleaseselectlawyer": "Please select a lawyer.",
          "Selectlanguage": "Select translation language",
          "SelectlanguagePlease": "Please select translation language'",
          "Attachidentity":
              "Attach a photo of both sides of the ID \n with one photo of the document holder",
          "AttachidentityDone": "Image attached.",
          "moreinfo": "More Informations",
          "countryDestination": "Destination",
          "apply": "Apply",
          "Submittedsuccessfully": "Submitted successfully",
          "seeReqSubneission": "See the submissions requests",
          "noLegalconsultation": "There are no consultations yet",
          "answerconsultation": "The answer",
          "ConsultationDetails": "Consultation Details",
          "Enterdetailshere": "Enter details here",
          "consultationdetailsValid": "Please enter consultation details.",
          "consultationdetailsValidTitle": "Please enter consultation title.",
          "Pleaseenterconsultationdetails": "Please enter consultation details",
          "PleaseenterconsultationTitle": "Please enter consultation title",
          "Enterdetailshere": "Enter details here",
          "EnterdetailshereTitle": "Enter title here",
          "consultationdetailsValid": "Please enter consultation details.",
          "consultationresponse":
              "Your consultation has been sent, awaiting response.",
          "previousconsultations": "Your previous consultations",
          "Answeredby": "Answered by",
          "titlePageConsultion": "What legal issue would you like advice on?",
          //////////////////////////////////////////
          ///////////////////////Req Passport
          //////////////////////////////////////////

          "infoOwnerpassport": "Passport owner information",
          "SelectNationalityPlease": "Select nationality please",
          "Relation": "Relation",
          "yArabicName": "Your Name (Arabic)",
          "yEnglishName": "Your Name (English)",

          "FatherNameArabic": "Father's Name (Arabic)",
          "FatherNameEnglish": "Father's Name (English)",
          "MotherNameArabic": "Mother's Name (Arabic)",
          "MotherNameEnglish": "Mother's Name (English)",
          "SurnameEnglish": "Surname (English)",
          "SurnameArabic": "Surname (Arabic)",
          "Gender": "Gender",
          "PlaceofBirthArabic": "Place of Birth (Arabic)",
          "PlaceofBirthEnglish": "Place of Birth (English)",
          "titlemale": "male",
          "titlefemale": "female",
          "infoagentpassport":
              "The person in whose name the document is required to be issued is",
          "nationalNumber": "National number",
          "Ihaveanoldpassport": "I have an old passport",
          "Oldpassportnumber": "Old passport number",
          "Oldpassportissuedate": "Old passport issue date",
          "Oldpassportexpirydate": "Old passport expiry date",
          "Oldpassportissueplace": "Old passport issue place",
          "TypePassport": "Type Passport",
          "PlacePassportRicive": "Delivery location",
          "insidethecountry": "inside the country",
          "outofcountry": "out of country",
          "Passports": "Passports",
          "Documents": "Documents",
          "Dealing": "Dealing",
          "Tracking": "Tracking",
          "Account": "Account",
          "notificationStatusBtnOn": " On",
          "notificationStatusBtnOff": " Off",
          "updateProfilebtnvMode1": "Visibility Mode",
          "updateProfilebtnvMode2": "Edit Mode",
          "updateProfiletitle1": "Update Personal Information",
          "updateProfiletitle2": "Save Personal Information Changes",
          "updateProfilecontent1":
              "Update your personal information\n by switching to edit mode.",
          "updateProfilecontent2":
              "Save your personal information\n by switching to visibility mode.",
          "notificationSetting": "Notification Settings",
          "notificationSettingStatusTitle":
              "If notifications are turned off, you will not receive any notifications or messages.",
          "update": "Update",
          "FrequentlyAskedQuestions": "Frequently asked questions",
          "requestStatus": "Status of submitted applications",

          "bodyFP":
              "Your account will be verified and anew code will be sent to your email, keep it.",
          "ChickEmailbtnFB": "Chick email and sent code",
          "moreTools": "More Tools",
          "Languages": "Languages",
          "languCurrent": "Current language",
          "Error": "Error",
          "Errortitle": "Code is Wrong ...",

          "newCodetitle": "New Code",
          "newCodeBody": "The new login code has been sent to your email.",
          "ErrortitleEmailNotFound": "Email Not Found ...",
          "OK": "OK",
          "cityBirth": "City of birth",
          "selectCityPlease": "Please select City of birth",

          "Pleaseselectimage": "Please select a ID image before submitting.",
          "selectRelation": "Please select Relation",
          "noLawyer": "There are no lawyers currently available",
          "Suggestions": "Suggestions",
          //payment
          "Paid": "Paid",
          "pay": "pay",
          "PaymentStatus": "Payment status",
          "Paymentamount": "Payment amount",
          "PaymentNumber": "Payment number",
          "PaymentDate": "Payment date",
          "Payments": "Payments",
          "PaymentIDReq": "Request ID",
          "Paymentreceipt": "Payment receipt",
          "confirmation": "Confirmation",
          "PleaseselectimagePaymentReceipts": "Please upload a photo of your payment receipt.",
          //Notifications
          "Notifications": "Notifications",
          "NotificationsEmpty": "Notifications are Empty",

          "Waiting": "Waiting",
          "Coast": "Coast",
          "Save": "Save",
          "Message": "Message",
          "chatDealings": "Chats Dealings",
          "Searchforuser": "Search for user",
          "chatDealingshint":"Only the lawyers responsible for your request will be shown to you.",

          //Privacy Policy
          "PrivacyPolicy":"Privacy Policy",

           "titlePP1":"External communications ",
           "subPP1": " We are not responsible for any communication or agreements made outside the application or the private conversation within the application.",

          "titlePP2":"Shipping companies ",
          "subPP2": " We declare that we are not responsible for any damage or loss that may occur as a result of using the services of shipping companies.",

          "titlePP3":"Financial policies ",
          "subPP3": " After making a payment, the amount paid is non-refundable.",

          "titlePP4":"Responsibility for the information provided ",
          "subPP4": " The party involved is fully responsible for the information provided by them, and it must be accurate and correct.",

          "titlePP5":"Data protection ",
          "subPP5": " We work to protect your data and ensure its safety, but we do not bear any responsibility for illegal use of the information.",

          "titlePP6":"Compliance with laws ",
          "subPP6": " All users must comply with the laws and regulations in the country. All users must comply with the laws and regulations in the Syrian Arab Republic,\n including but not limited to personal data protection, combating cybercrime, and e-commerce laws. We urge users to review the relevant local laws to ensure legal use of the application.",
          "footerPPT":"For inquiries, please contact us through ",
           "footerPPS":"Chats > Support",
          "RatingReq":"Help us make our services better by rating the lawyer for this request, \nno one will know that you have made the rating ",
          "Submit":"Submit",
          "thnks":"We appreciate your rating, thank you.",
          "Rating":"Rating",
          "or":"OR",
          "Lessthanastar":"Less than a star",

        },
      };
}
