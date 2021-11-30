import 'package:flutter/material.dart';

class TappableRow extends StatelessWidget {
  TappableRow(
      {this.width,
      this.height,
      this.padding,
      this.margin,
      this.backgroundColor,
      this.borderColor,
      this.borderRadius,
      this.onTap,
      this.onLongPress,
      this.onDoubleTap,
      required this.children,
      this.flexes,
      Key? key})
      : assert(flexes != null && flexes.length == children.length,
            'No. of flexes must match with the No. of children'),
        super(key: key);

  List<Widget> children;
  final List<int>? flexes;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function()? onDoubleTap;
  final double? borderRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    if (flexes != null) {
      children = _flexes(children, flexes!);
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Row(
          children: children,
        ),
      ),
    );
  }

  _flexes(List<Widget> children, List<int> flexes) {
    List<Widget> newChild = [];

    for (int i = 0; i < flexes.length; i++) {
      newChild.add(Expanded(
        child: children[i],
        flex: flexes[i],
      ));
    }
    return newChild;
    // return children.map((e) => Expanded(child: e)).toList();
  }
}
