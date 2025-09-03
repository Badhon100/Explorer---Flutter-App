

import 'package:explorer_flutter_app/core/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

enum ButtonType { fill, transparent }

t14(String title) => commonText(title, size: 14);

t16(String title) => commonText(title, size: 16);

t18b800(String title) => commonText(
  title,
  size: 18,
  fontWeight: FontWeight.w800,
);

t16b700(String title) =>
    commonText(title, size: 16, fontWeight: FontWeight.w700);

t14b600(String title) =>
    commonText(title, size: 14, fontWeight: FontWeight.w600);

t14b500(String title) =>
    commonText(title, size: 14, fontWeight: FontWeight.w500);


t12b500(String title) =>
    commonText(title, size: 12, fontWeight: FontWeight.w500, maxLine: 3);


sH2() => const SizedBox(height: 2);

sH4() => const SizedBox(height: 4);

sH8() => const SizedBox(height: 8);

sH10() => const SizedBox(height: 10);

sH12() => const SizedBox(height: 12);

sH16() => const SizedBox(height: 16);

sH20() => const SizedBox(height: 20);

sH24() => const SizedBox(height: 24);

sH32() => const SizedBox(height: 32);

sH64() => const SizedBox(height: 64);

sH100() => const SizedBox(height: 100);

sW2() => const SizedBox(width: 2);

sW4() => const SizedBox(width: 4);

sW8() => const SizedBox(width: 8);

sW10() => const SizedBox(width: 10);

sW12() => const SizedBox(width: 12);

sW16() => const SizedBox(width: 16);

sW20() => const SizedBox(width: 20);

sW24() => const SizedBox(width: 24);

sW32() => const SizedBox(width: 32);

sW64() => const SizedBox(width: 64);

sp3() => const Spacer(flex: 3);

sp1() => const Spacer(flex: 1);

