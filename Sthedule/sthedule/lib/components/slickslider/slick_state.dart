import 'package:flutter/material.dart';
import 'package:sthedule/components/slickslider/slick_options.dart';

class SlickState {
  /// The [SlickOptions] to create this state
  SlickOptions options;

  /// [pageController] is created using the properties passed to the constructor
  /// and can be used to control the [PageView] it is passed to.
  PageController? pageController;

  /// The actual index of the [PageView].
  ///
  /// This value can be ignored unless you know the slick will be scrolled
  /// backwards more then 10000 pages.
  /// Defaults to 10000 to simulate infinite backwards scrolling.
  int realPage = 10000;

  /// The initial index of the [PageView] on [SlickSlider] init.
  ///
  int initialPage = 0;

  /// The widgets count that should be shown at slick
  int? itemCount;

  /// Will be called when using pageController to go to next page or
  /// previous page. It will clear the autoPlay timer.
  /// Internal use only
  Function onResetTimer;

  /// Will be called when using pageController to go to next page or
  /// previous page. It will restart the autoPlay timer.
  /// Internal use only
  Function onResumeTimer;

  /// The callback to set the Reason Slick changed
  Function(SlickPageChangedReason) changeMode;

  SlickState(
      this.options, this.onResetTimer, this.onResumeTimer, this.changeMode);
}
