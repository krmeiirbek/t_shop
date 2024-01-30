import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:t_store/routes/app_routes.dart';
import 'package:t_store/utils/theme/theme.dart';

import 'bindings/general_bindings.dart';
import 'data/services/translation_service.dart';
import 'utils/constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(500, 1000),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: TranslationService(),
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          themeMode: ThemeMode.system,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          initialBinding: GeneralBindings(),
          getPages: AppRoutes.pages,
          home: const Scaffold(
            backgroundColor: TColors.primary,
            body: Center(
              child: CircularProgressIndicator(color: TColors.white),
            ),
          ),
        );
      },
    );
  }
}
