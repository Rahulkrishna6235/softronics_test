import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getFonts (double fontsize,Color color){
  return GoogleFonts.merriweather(fontWeight: FontWeight.w600,fontSize: fontsize ,color:color );
}
TextStyle styledFont (double fontsize,Color color, decoration){
  return GoogleFonts.robotoSlab(fontWeight: FontWeight.w600,fontSize: fontsize ,color:color,fontStyle: FontStyle.italic,decoration: decoration  );
}
TextStyle normalFonts (double fontsize,Color color,){
  return GoogleFonts.josefinSans(fontWeight: FontWeight.w600,fontSize: fontsize ,color:color,fontStyle: FontStyle.italic,);
}