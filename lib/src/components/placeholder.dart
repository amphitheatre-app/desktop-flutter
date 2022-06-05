import 'package:flutter/material.dart';

typedef HasContentCallback = bool Function();

/// Takes content and a placeholder, and swaps between them
/// depending on the results of the hasContent delegate.
class ContentPlaceholder extends StatelessWidget {
  final HasContentCallback hasContent;
  final Widget content;
  final Widget placeholder;
  final EdgeInsets padding;

  const ContentPlaceholder(
      {Key? key,
      required this.hasContent,
      required this.content,
      required this.placeholder,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        hasContent()
            ? content
            : Container(
                alignment: Alignment.center,
                margin: padding,
                child: placeholder,
              ),
      ],
    );
  }
}
