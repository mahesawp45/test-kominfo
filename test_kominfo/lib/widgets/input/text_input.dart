import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    this.controller,
    this.label,
    this.placeHolder,
    this.isEnabled,
    this.type,
    this.isPassword,
    this.isMoney,
    this.validatorMessage,
    this.textInputAction,
    this.onEditingComplete,
    this.autoFill,
    this.autoFocus,
    this.focusNode,
    this.onChange,
    this.maxLines,
    this.minLines,
    this.errorMessage,
    this.onPasswordTap,
    this.isPassVisible,
    this.isRequired,
    this.readOnly,
  });

  final TextEditingController? controller;
  final String? label;
  final String? placeHolder;
  final bool? isEnabled;
  final TextInputType? type;
  final bool? isPassword;
  final bool? isMoney;
  final String? validatorMessage;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final Iterable<String>? autoFill;
  final bool? autoFocus;
  final FocusNode? focusNode;
  final void Function(String)? onChange;
  final int? maxLines;
  final int? minLines;

  final String? errorMessage;
  final VoidCallback? onPasswordTap;
  final bool? isPassVisible;
  final bool? isRequired;
  final bool? readOnly;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.label != null,
          child: Row(
            children: [
              Text(
                widget.label ?? "",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Visibility(
                visible: widget.isRequired == true,
                child: const Text(
                  "*",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: widget.isEnabled == false
              ? null
              : const EdgeInsets.only(
                  left: 12,
                ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: widget.errorMessage != null ? Colors.red : Colors.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            child: TextFormField(
              autofillHints: widget.autoFill,
              textInputAction: widget.textInputAction,
              onEditingComplete: widget.onEditingComplete,
              focusNode: widget.focusNode,
              maxLines: widget.maxLines ?? 1,
              minLines: widget.minLines,
              onChanged: widget.onChange,
              readOnly: widget.readOnly ?? false,
              autofocus: widget.autoFocus ?? false,
              obscureText: widget.isPassword != null &&
                  widget.isPassword == true &&
                  widget.isPassVisible == false,
              enabled: widget.isEnabled ?? true,
              controller: widget.controller,
              cursorColor: Colors.amber,
              keyboardType: widget.type,
              decoration: InputDecoration(
                focusColor: Colors.amber,
                suffixIcon: widget.errorMessage != null
                    ? const Icon(
                        Icons.error,
                        color: Colors.red,
                      )
                    : widget.isPassword != null && widget.isPassword == true
                        ? GestureDetector(
                            onTap: widget.onPasswordTap,
                            child: Icon(
                              widget.isPassVisible == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                              size: 14,
                            ),
                          )
                        : null,
                contentPadding: widget.isEnabled == false
                    ? const EdgeInsets.symmetric(horizontal: 12, vertical: 4)
                    : null,
                filled: widget.isEnabled == false,
                fillColor: Colors.grey.withOpacity(0.35),
                border: InputBorder.none,
                hintText: widget.placeHolder,
                hintStyle: TextStyle(
                  color: widget.isEnabled == false
                      ? Colors.grey
                      : Colors.grey.withOpacity(0.5),
                  fontSize: 8,
                ),
              ),
            ),
          ),
        ),
        widget.errorMessage != null
            ? Column(
                children: [
                  const SizedBox(height: 4),
                  Text(
                    widget.errorMessage ?? "",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 8,
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
