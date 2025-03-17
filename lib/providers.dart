import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/user/provider/main_page_provider.dart';
MultiProvider appProvider({required Widget child}){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>MainPageProvider())
  ],
  child: child,
  );

}