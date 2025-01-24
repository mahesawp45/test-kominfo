import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isOutline,
    this.isMedium,
    this.isLoading,
  });

  final String label;
  final VoidCallback onTap;
  final bool? isOutline;
  final bool? isMedium;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    if (isMedium == true) {
      return Expanded(
          child: BaseSecondaryButton(
              isMedium: isMedium,
              isOutline: isOutline,
              isLoading: isLoading,
              onTap: onTap,
              label: label));
    } else {
      return BaseSecondaryButton(
          isMedium: isMedium,
          isOutline: isOutline,
          isLoading: isLoading,
          onTap: onTap,
          label: label);
    }
  }
}

class BaseSecondaryButton extends StatelessWidget {
  const BaseSecondaryButton({
    super.key,
    required this.isMedium,
    required this.isOutline,
    required this.isLoading,
    required this.onTap,
    required this.label,
  });

  final bool? isMedium;
  final bool? isOutline;
  final bool? isLoading;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isMedium != null && isMedium == true
          ? null
          : MediaQuery.of(context).size.width,
      child: MaterialButton(
        elevation: 0,
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: isMedium != null && isMedium == true ? 8 : 0,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isOutline != null && isOutline == true
                ? Colors.grey
                : Colors.transparent,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        onPressed: isLoading == true ? () {} : onTap,
        color: isOutline != null && isOutline == true
            ? null
            : isLoading == true
                ? Colors.grey.withOpacity(0.5)
                : Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isOutline != null && isOutline == true
                    ? Colors.grey.withOpacity(0.7)
                    : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            isLoading == true
                ? const Row(
                    children: [
                      SizedBox(width: 8),
                      SizedBox(
                        height: 8,
                        width: 8,
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
