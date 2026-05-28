import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1d6b4f),
      surfaceTint: Color(0xff1d6b4f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa7f2cf),
      onPrimaryContainer: Color(0xff00513a),
      secondary: Color(0xff4c6358),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcfe9da),
      onSecondaryContainer: Color(0xff354b41),
      tertiary: Color(0xff006a62),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9df2e6),
      onTertiaryContainer: Color(0xff005049),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff404943),
      outline: Color(0xff707973),
      outlineVariant: Color(0xffc0c9c1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff8cd5b4),
      primaryFixed: Color(0xffa7f2cf),
      onPrimaryFixed: Color(0xff002115),
      primaryFixedDim: Color(0xff8cd5b4),
      onPrimaryFixedVariant: Color(0xff00513a),
      secondaryFixed: Color(0xffcfe9da),
      onSecondaryFixed: Color(0xff092017),
      secondaryFixedDim: Color(0xffb3ccbe),
      onSecondaryFixedVariant: Color(0xff354b41),
      tertiaryFixed: Color(0xff9df2e6),
      onTertiaryFixed: Color(0xff00201d),
      tertiaryFixedDim: Color(0xff81d5ca),
      onTertiaryFixedVariant: Color(0xff005049),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003f2c),
      surfaceTint: Color(0xff1d6b4f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff307a5e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff253b31),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5b7266),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003e38),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1c7a71),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff0c1213),
      onSurfaceVariant: Color(0xff303833),
      outline: Color(0xff4c554e),
      outlineVariant: Color(0xff666f69),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff8cd5b4),
      primaryFixed: Color(0xff307a5e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0e6146),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5b7266),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff435a4e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff1c7a71),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff006058),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c7c9),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe3e9ea),
      surfaceContainerHigh: Color(0xffd8dedf),
      surfaceContainerHighest: Color(0xffcdd3d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003323),
      surfaceTint: Color(0xff1d6b4f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00543c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1b3027),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff374e43),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00332e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00534c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff262e29),
      outlineVariant: Color(0xff424b45),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff8cd5b4),
      primaryFixed: Color(0xff00543c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003b29),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff374e43),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff21372d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00534c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003a35),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4babb),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2f3),
      surfaceContainer: Color(0xffdee3e5),
      surfaceContainerHigh: Color(0xffcfd5d6),
      surfaceContainerHighest: Color(0xffc2c7c9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8cd5b4),
      surfaceTint: Color(0xff8cd5b4),
      onPrimary: Color(0xff003827),
      primaryContainer: Color(0xff00513a),
      onPrimaryContainer: Color(0xffa7f2cf),
      secondary: Color(0xffb3ccbe),
      onSecondary: Color(0xff1f352b),
      secondaryContainer: Color(0xff354b41),
      onSecondaryContainer: Color(0xffcfe9da),
      tertiary: Color(0xff81d5ca),
      onTertiary: Color(0xff003732),
      tertiaryContainer: Color(0xff005049),
      onTertiaryContainer: Color(0xff9df2e6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffc0c9c1),
      outline: Color(0xff8a938c),
      outlineVariant: Color(0xff404943),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff1d6b4f),
      primaryFixed: Color(0xffa7f2cf),
      onPrimaryFixed: Color(0xff002115),
      primaryFixedDim: Color(0xff8cd5b4),
      onPrimaryFixedVariant: Color(0xff00513a),
      secondaryFixed: Color(0xffcfe9da),
      onSecondaryFixed: Color(0xff092017),
      secondaryFixedDim: Color(0xffb3ccbe),
      onSecondaryFixedVariant: Color(0xff354b41),
      tertiaryFixed: Color(0xff9df2e6),
      onTertiaryFixed: Color(0xff00201d),
      tertiaryFixedDim: Color(0xff81d5ca),
      onTertiaryFixedVariant: Color(0xff005049),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa1ecc9),
      surfaceTint: Color(0xff8cd5b4),
      onPrimary: Color(0xff002c1e),
      primaryContainer: Color(0xff569e80),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc9e2d4),
      onSecondary: Color(0xff142a20),
      secondaryContainer: Color(0xff7e9689),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff97ebe0),
      onTertiary: Color(0xff002b27),
      tertiaryContainer: Color(0xff499e94),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd6dfd7),
      outline: Color(0xffabb4ad),
      outlineVariant: Color(0xff89938b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff00533b),
      primaryFixed: Color(0xffa7f2cf),
      onPrimaryFixed: Color(0xff00150c),
      primaryFixedDim: Color(0xff8cd5b4),
      onPrimaryFixedVariant: Color(0xff003f2c),
      secondaryFixed: Color(0xffcfe9da),
      onSecondaryFixed: Color(0xff01150d),
      secondaryFixedDim: Color(0xffb3ccbe),
      onSecondaryFixedVariant: Color(0xff253b31),
      tertiaryFixed: Color(0xff9df2e6),
      onTertiaryFixed: Color(0xff001512),
      tertiaryFixedDim: Color(0xff81d5ca),
      onTertiaryFixedVariant: Color(0xff003e38),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff3f4647),
      surfaceContainerLowest: Color(0xff040809),
      surfaceContainerLow: Color(0xff191f20),
      surfaceContainer: Color(0xff23292a),
      surfaceContainerHigh: Color(0xff2d3435),
      surfaceContainerHighest: Color(0xff393f40),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb8ffdd),
      surfaceTint: Color(0xff8cd5b4),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff88d1b0),
      onPrimaryContainer: Color(0xff000e07),
      secondary: Color(0xffdcf6e7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffafc8ba),
      onSecondaryContainer: Color(0xff000e07),
      tertiary: Color(0xffaefff3),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff7ed1c6),
      onTertiaryContainer: Color(0xff000e0c),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe9f2ea),
      outlineVariant: Color(0xffbcc5bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff00533b),
      primaryFixed: Color(0xffa7f2cf),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff8cd5b4),
      onPrimaryFixedVariant: Color(0xff00150c),
      secondaryFixed: Color(0xffcfe9da),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb3ccbe),
      onSecondaryFixedVariant: Color(0xff01150d),
      tertiaryFixed: Color(0xff9df2e6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff81d5ca),
      onTertiaryFixedVariant: Color(0xff001512),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff4b5152),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2122),
      surfaceContainer: Color(0xff2b3133),
      surfaceContainerHigh: Color(0xff363c3e),
      surfaceContainerHighest: Color(0xff424849),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
