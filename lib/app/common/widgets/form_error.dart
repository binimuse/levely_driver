

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lively_driver/app/constant/size_config.dart';

import '../../config/theme/custom_colors.dart';




class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length,
            (index) => Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Error.svg",
                      height: getProportionateScreenWidth(14),
                      width: getProportionateScreenWidth(14),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      errors[index].toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: CustomColors.red, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),),);
  }
}
