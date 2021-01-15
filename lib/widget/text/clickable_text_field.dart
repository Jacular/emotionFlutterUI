import 'package:amotionflutterui/color/color.dart';
import 'package:amotionflutterui/utils/adapt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///文本输入框
class ClickableItemWidget extends StatefulWidget {
  final bool showLine;
  final bool showArrow;
  final bool isEditable;
  final bool isIntegerOnly;
  final String titleText;
  final String hintText;
  final int valueLength;
  final String valueText;
  final Color valueTextColor;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final List<TextInputFormatter> textInputFormatters;

  final VoidCallback onTap;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onDone;

  const ClickableItemWidget(
      {Key key,
        this.showLine = true,
        this.showArrow = true,
        this.isEditable = false,
        this.isIntegerOnly = false,
        @required this.titleText,
        @required this.hintText,
        this.valueText,
        this.valueTextColor = color666666,
        this.valueLength = 50,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.done,
        this.onChanged,
        this.onDone,
        this.onTap,
        this.textInputFormatters})
      : super(key: key);

  @override
  ClickableItemWidgetState createState() => ClickableItemWidgetState();
}

class ClickableItemWidgetState extends State<ClickableItemWidget> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text:widget.valueText);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void setValueText(String text) => _controller.text = text;

  String get valueText => _controller.text;

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.valueText;
    var formatterList = <TextInputFormatter>[]
      ..add(LengthLimitingTextInputFormatter(widget.valueLength));
    if (widget.isIntegerOnly) {
      formatterList.add(FilteringTextInputFormatter.digitsOnly);
    }
    if (widget.textInputFormatters != null &&
        widget.textInputFormatters.isNotEmpty) {
      formatterList.addAll(widget.textInputFormatters);
    }

    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        widget.onTap();
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: Adapt.px(16)),
                Text(
                  widget.titleText,
                  style: TextStyle(fontSize: Adapt.px(16), color: color333333),
                ),
                Flexible(
                  child: TextField(
                    controller: _controller,
                    enabled: widget.isEditable,
                    keyboardType: widget.inputType,
                    textAlign: TextAlign.end,
                    onChanged: widget.onChanged,
                    inputFormatters: formatterList,
                    textInputAction: widget.inputAction,
                    style: TextStyle(
                        fontSize: Adapt.px(16), color: widget.valueTextColor),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText ?? "必填",
                      hintStyle:
                      TextStyle(color: colorC9C9C9, fontSize: Adapt.px(16)),
                      contentPadding: EdgeInsets.only(
                        top: Adapt.px(16),
                        bottom: Adapt.px(16),
                        left: Adapt.px(6),
                        right: Adapt.px(widget.showArrow ? 6 : 0),
                      ),
                    ),
                    onSubmitted: (value) => widget.onDone(value),
                  ),
                ),
                widget.showArrow && !widget.isEditable
                    ? Image(
                    image: AssetImage("assets/images/ic_right_arrow.png"),
                    width: Adapt.px(16),
                    height: Adapt.px(16))
                    : Container(),
                SizedBox(width: Adapt.px(16)),
              ],
            ),
            widget.showLine
                ? Padding(
              padding: EdgeInsets.only(left: Adapt.px(16)),
              child: Divider(height: 0.5, color: colorF0F0F0),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}
