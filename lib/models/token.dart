import 'package:deus_mobile/service/ethereum_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as provider;

import '../core/widgets/svg.dart';

class Token extends Equatable {
  final String name;
  final String symbol;
  final String logoPath;


  Token(this.name, this.symbol, this.logoPath);

  @override
  List<Object> get props => [symbol];


  String getTokenName(){
    return symbol.toLowerCase();
  }
}

extension PathCheck on String {
  bool get isSvg => this.endsWith('.svg');

  Widget showCircleImage({double radius = 20}) =>
      CircleAvatar(radius: radius, backgroundImage: isSvg ? provider.Svg('assets/$this') : AssetImage('assets/$this'));

  Widget showImage({double size}) => isSvg
      ? PlatformSvg.asset(this, height: size, width: size)
      : Image.asset('assets/' + this, height: size, width: size);
}
