abstract class AppStrings {
  // onBoarding
  static const String onBoardingTitle1 = "مرحبًا بك في ";

  static const String onBoardingSubTitle1 =
      "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.";

  static const String onBoardingTitle2 = "ابحث وتسوق";

  static const String onBoardingSubTitle2 =
      "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية";

  static const String skip = "تخط";

  static const String start = "ابدأ الآن";

  // auth
  static const String login = "تسجيل الدخول";
  static const String register = "حساب جديد";
  static const String email = "البريد الإلكتروني";
  static const String fullName = "الاسم الكامل";
  static const String password = "كلمة المرور";
  static const String confirmPassword = "تأكيد كلمة المرور";
  static const String forgotPassword = "نسيت كلمة المرور؟";
  static const String doNotHaveAccount = "لا تمتلك حساب؟";
  static const String makeAnAccount = "قم بإنشاء حساب";
  static const String makeNewAccount = "إنشاء حساب جديد";
  static const String alreadyHaveAccount = "تمتلك حساب بالفعل؟";
  static const String or = "أو";
  static const String signWithGoogle = "تسجيل بواسطة جوجل";
  static const String signWithFacebook = "تسجيل بواسطة فيسبوك";
  static const String signWithApple = "تسجيل بواسطة أبل";
  static const String conditionsAndTerms = "الشروط والأحكام الخاصة بنا";
  static const String acceptConditionAndTerms =
      "يجب الموافقة على الشروط والأحكام أولاً";
  static const String bySigningUp = "من خلال إنشاء حساب، فإنك توافق على";
  static const String successRegister = "تم انشاء الحساب بنجاح";
  static const String successLogin = "تم تسجيل الدخول بنجاح";

  // home
  static const String goodMorning = "صباح الخير !..";
  static const String searchHint = "ابحث عن....... ";
  static const String mostSelling = "الأكثر مبيعًا";
  static const String more = "المزيد";
  static const String home = "الرئيسية";
  static const String products = "المنتجات";
  static const String shoppingCart = "سلة التسوق";
  static const String myProfile = "حسابي";

  static const String eidOffers = "عروض العيد";
  static const String discount = "خصم 25%";
  static const String shopNow = "تسوق الآن";

  // validators
  // الاسم
  static const String nameRequired = "من فضلك أدخل الاسم بالكامل";
  static const String nameTooShort = "الاسم يجب أن يحتوي على 3 أحرف على الأقل";

  // البريد الإلكتروني
  static const String emailRequired = "من فضلك أدخل البريد الإلكتروني";
  static const String emailInvalid = "البريد الإلكتروني غير صحيح";

  // كلمة المرور
  static const String passwordRequired = "من فضلك أدخل كلمة المرور";
  static const String passwordTooShort =
      "كلمة المرور يجب أن تحتوي على 6 أحرف على الأقل";

  // تأكيد كلمة المرور
  static const String confirmPasswordRequired =
      "من فضلك أدخل تأكيد كلمة المرور";
  static const String passwordsNotMatch = "كلمتا المرور غير متطابقتان";

  // الحقول الفارغة
  static const String emptyField = "هذا الحقل مطلوب";

  // ✅ Auth Errors
  static const String invalidCredentials =
      "البريد الإلكتروني أو كلمة المرور غير صحيحة.";

  static const String emailAlreadyInUse = "هذا البريد مستخدم بالفعل.";
  static const String weakPassword = "كلمة المرور ضعيفة جدًا.";
  static const String invalidEmail = "البريد الإلكتروني غير صالح.";
  static const String userDisabled = "تم تعطيل حساب هذا المستخدم.";
  static const String tooManyRequests = "عدد محاولات كبير جدًا، حاول لاحقًا.";
  static const String operationNotAllowed = "طريقة تسجيل الدخول غير مفعلة.";
  static const String networkRequestFailed =
      "فشل في الاتصال بالشبكة، تحقق من اتصالك.";
  static const String defaultAuthError = "حدث خطأ في تسجيل الدخول.";

  // ✅ Firestore Errors
  static const String permissionDenied = "ليس لديك صلاحية لهذه العملية.";
  static const String notFound = "المستند المطلوب غير موجود.";
  static const String alreadyExists = "هذا المستند موجود بالفعل.";
  static const String cancelled = "تم إلغاء العملية.";
  static const String deadlineExceeded = "العملية استغرقت وقتًا طويلًا.";
  static const String unavailable = "الخدمة غير متوفرة حاليًا.";

  // ✅ Storage Errors
  static const String objectNotFound = "الملف المطلوب غير موجود.";
  static const String unauthorized = "ليست لديك صلاحية للوصول لهذا الملف.";
  static const String retryLimitExceeded = "عدد محاولات زائد، حاول لاحقًا.";
  static const String quotaExceeded = "تم استهلاك المساحة المسموحة.";
  static const String canceled = "تم إلغاء تحميل/تنزيل الملف.";
  static const String invalidChecksum = "تم إتلاف الملف أثناء النقل.";
  static const String unknownError = "خطأ غير معروف.";

  // ✅ Default
  static const String unexpectedError = "حدث خطأ غير متوقع.";
}
