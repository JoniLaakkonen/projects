library slick_slider;

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sthedule/components/slickslider/slick_state.dart';
import 'package:sthedule/provider/colorprovider.dart';

import 'slick_controller.dart';
import 'slick_options.dart';
import 'utils.dart';

export 'slick_controller.dart';
export 'slick_options.dart';

typedef ExtendedIndexedWidgetBuilder = Widget Function(
    BuildContext context, int index, int realIndex);

class SlickSlider extends StatefulWidget {
  /// [SlickOptions] to create a [SlickState] with
  final SlickOptions options;

  final bool? disableGesture;

  /// The widgets to be shown in the slick of default constructor
  final List<Widget>? items;

  /// The widget item builder that will be used to build item on demand
  /// The third argument is the PageView's real index, can be used to cooperate
  /// with Hero.
  final ExtendedIndexedWidgetBuilder? itemBuilder;

  /// A [MapController], used to control the map.
  final SlickSliderControllerImpl _slickController;

  final int? itemCount;

  SlickSlider(
      {required this.items,
      required this.options,
      this.disableGesture,
      SlickSliderController? slickController,
      super.key})
      : itemBuilder = null,
        itemCount = items != null ? items.length : 0,
        _slickController = slickController != null
            ? slickController as SlickSliderControllerImpl
            : SlickSliderController() as SlickSliderControllerImpl;

  /// The on demand item builder constructor
  SlickSlider.builder(
      {required this.itemCount,
      required this.itemBuilder,
      required this.options,
      this.disableGesture,
      SlickSliderController? slickController,
      super.key})
      : items = null,
        _slickController = slickController != null
            ? slickController as SlickSliderControllerImpl
            : SlickSliderController() as SlickSliderControllerImpl;

  @override
  SlickSliderState createState() => SlickSliderState(_slickController);
}

class SlickSliderState extends State<SlickSlider>
    with TickerProviderStateMixin {
  final SlickSliderControllerImpl slickController;
  Timer? timer;

  SlickOptions get options => widget.options;

  SlickState? slickState;

  PageController? pageController;

  /// mode is related to why the page is being changed
  SlickPageChangedReason mode = SlickPageChangedReason.controller;

  SlickSliderState(this.slickController);

  void changeMode(SlickPageChangedReason mode) {
    mode = mode;
  }

  @override
  void didUpdateWidget(SlickSlider oldWidget) {
    slickState!.options = options;
    slickState!.itemCount = widget.itemCount;

    // pageController needs to be re-initialized to respond to state changes
    pageController = PageController(
      viewportFraction: options.viewportFraction,
      initialPage: slickState!.realPage,
    );
    slickState!.pageController = pageController;

    // handle autoplay when state changes
    handleAutoPlay();

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    slickState =
        SlickState(options, clearTimer, resumeTimer, changeMode);

    slickState!.itemCount = widget.itemCount;
    slickController.state = slickState;
    slickState!.initialPage = widget.options.initialPage;
    slickState!.realPage = options.enableInfiniteScroll
        ? slickState!.realPage + slickState!.initialPage
        : slickState!.initialPage;
    handleAutoPlay();

    pageController = PageController(
      viewportFraction: options.viewportFraction,
      initialPage: slickState!.realPage,
    );

    slickState!.pageController = pageController;
  }

  Timer? getTimer() {
    return widget.options.autoPlay
        ? Timer.periodic(widget.options.autoPlayInterval, (_) {
            if (!mounted) {
              clearTimer();
              return;
            }

            final route = ModalRoute.of(context);
            if (route?.isCurrent == false) {
              return;
            }

            SlickPageChangedReason previousReason = mode;
            changeMode(SlickPageChangedReason.timed);
            int nextPage = slickState!.pageController!.page!.round() + 1;
            int itemCount = widget.itemCount ?? widget.items!.length;

            if (nextPage >= itemCount &&
                widget.options.enableInfiniteScroll == false) {
              if (widget.options.pauseAutoPlayInFiniteScroll) {
                clearTimer();
                return;
              }
              nextPage = 0;
            }

            slickState!.pageController!
                .animateToPage(nextPage,
                    duration: widget.options.autoPlayAnimationDuration,
                    curve: widget.options.autoPlayCurve)
                .then((_) => changeMode(previousReason));
          })
        : null;
  }

  void clearTimer() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
  }

  void resumeTimer() {
    timer ??= getTimer();
  }

  void handleAutoPlay() {
    bool autoPlayEnabled = widget.options.autoPlay;

    if (autoPlayEnabled && timer != null) return;

    clearTimer();
    if (autoPlayEnabled) {
      resumeTimer();
    }
  }

  Widget getGestureWrapper(Widget child) {
    Widget wrapper;
    if (widget.options.height != null) {
      wrapper = SizedBox(height: widget.options.height, child: child);
    } else {
      wrapper =
          AspectRatio(aspectRatio: widget.options.aspectRatio, child: child);
    }

    if (true == widget.disableGesture) {
      return NotificationListener(
        onNotification: (Notification notification) {
          if (widget.options.onScrolled != null &&
              notification is ScrollUpdateNotification) {
            widget.options.onScrolled!(slickState!.pageController!.page);
          }
          return false;
        },
        child: wrapper,
      );
    }

    return RawGestureDetector(
      behavior: HitTestBehavior.opaque,
      gestures: {
        _MultipleGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<_MultipleGestureRecognizer>(
                () => _MultipleGestureRecognizer(),
                (_MultipleGestureRecognizer instance) {
          instance.onStart = (_) {
            onStart();
          };
          instance.onDown = (_) {
            onPanDown();
          };
          instance.onEnd = (_) {
            onPanUp();
          };
          instance.onCancel = () {
            onPanUp();
          };
        }),
      },
      child: NotificationListener(
        onNotification: (Notification notification) {
          if (widget.options.onScrolled != null &&
              notification is ScrollUpdateNotification) {
            widget.options.onScrolled!(slickState!.pageController!.page);
          }
          return false;
        },
        child: wrapper,
      ),
    );
  }

  Widget getCenterWrapper(Widget child) {
    if (widget.options.disableCenter) {
      return Container(
        child: child,
      );
    }
    return Center(child: child);
  }

  Widget getEnlargeWrapper(Widget? child,
      {double? width,
      double? height,
      double? scale,
      required double itemOffset}) {
    if (widget.options.enlargeStrategy == CenterPageEnlargeStrategy.height) {
      return SizedBox(width: width, height: height, child: child);
    }
    if (widget.options.enlargeStrategy == CenterPageEnlargeStrategy.zoom) {
      late Alignment alignment;
      final bool horizontal = options.scrollDirection == Axis.horizontal;
      if (itemOffset > 0) {
        alignment = horizontal ? Alignment.centerRight : Alignment.bottomCenter;
      } else {
        alignment = horizontal ? Alignment.centerLeft : Alignment.topCenter;
      }
      return Transform.scale(scale: scale!, alignment: alignment, child: child);
    }
    return Transform.scale(
        scale: scale!,
        child: SizedBox(width: width, height: height, child: child));
  }

  void onStart() {
    changeMode(SlickPageChangedReason.manual);
  }

  void onPanDown() {
    if (widget.options.pauseAutoPlayOnTouch) {
      clearTimer();
    }

    changeMode(SlickPageChangedReason.manual);
  }

  void onPanUp() {
    if (widget.options.pauseAutoPlayOnTouch) {
      resumeTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    clearTimer();
  }

  @override
  Widget build(BuildContext context) {
    return getGestureWrapper(PageView.builder(
      padEnds: widget.options.padEnds,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        overscroll: false,
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      clipBehavior: widget.options.clipBehavior,
      physics: widget.options.scrollPhysics,
      scrollDirection: widget.options.scrollDirection,
      pageSnapping: widget.options.pageSnapping,
      controller: slickState!.pageController,
      reverse: widget.options.reverse,
      itemCount: widget.options.enableInfiniteScroll ? null : (widget.itemCount ?? widget.items!.length) + 1,
      key: widget.options.pageViewKey,
      onPageChanged: (int index) {
        int currentPage = getRealIndex(index + slickState!.initialPage,
            slickState!.realPage, widget.itemCount);
        if (widget.options.onPageChanged != null) {
          widget.options.onPageChanged!(currentPage, mode);
        }
      },
      itemBuilder: (BuildContext context, int idx) {
        final int index = getRealIndex(idx + slickState!.initialPage,
            slickState!.realPage, widget.itemCount);
      // Check if it's the last index
      if (idx == widget.itemCount) {
        // Return the IconButton for the last item
        return 
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: InkWell(
            onTap: () => {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: ColorProvider().mainColorDark,width: 3),
              ),
              child:
              Center(
                child: Icon(
                  Icons.add_circle_outline_sharp,
                  color: ColorProvider().mainColorDark,
                  size: 50.0,
                ),
              )
            )
          )
        );
      }
        return AnimatedBuilder(
          animation: slickState!.pageController!,
          child: (widget.items != null)
              ? (widget.items!.isNotEmpty ? widget.items![index] : Container())
              : widget.itemBuilder!(context, index, idx),
          builder: (BuildContext context, child) {
            double distortionValue = 1.0;
            // if `enlargeCenterPage` is true, we must calculate the slick item's height
            // to display the visual effect
            double itemOffset = 0;
            if (widget.options.enlargeCenterPage != null &&
                widget.options.enlargeCenterPage == true) {
              // pageController.page can only be accessed after the first build,
              // so in the first build we calculate the itemoffset manually
              var position = slickState?.pageController?.position;
              if (position != null &&
                  position.hasPixels &&
                  position.hasContentDimensions) {
                var page = slickState?.pageController?.page;
                if (page != null) {
                  itemOffset = page - idx;
                }
              } else {
                BuildContext storageContext = slickState!
                    .pageController!.position.context.storageContext;
                final double? previousSavedPosition =
                    PageStorage.of(storageContext).readState(storageContext)
                        as double?;
                if (previousSavedPosition != null) {
                  itemOffset = previousSavedPosition - idx.toDouble();
                } else {
                  itemOffset =
                      slickState!.realPage.toDouble() - idx.toDouble();
                }
              }

              final double enlargeFactor =
                  options.enlargeFactor.clamp(0.0, 1.0);
              final num distortionRatio =
                  (1 - (itemOffset.abs() * enlargeFactor)).clamp(0.0, 1.0);
              distortionValue =
                  Curves.easeOut.transform(distortionRatio as double);
            }

            final double height = widget.options.height ??
                MediaQuery.of(context).size.width *
                    (1 / widget.options.aspectRatio);

            if (widget.options.scrollDirection == Axis.horizontal) {
              return getCenterWrapper(getEnlargeWrapper(child,
                  height: distortionValue * height,
                  scale: distortionValue,
                  itemOffset: itemOffset));
            } else {
              return getCenterWrapper(getEnlargeWrapper(child,
                  width: distortionValue * MediaQuery.of(context).size.width,
                  scale: distortionValue,
                  itemOffset: itemOffset));
            }
          },
        );
      },
    ));
  }
}

class _MultipleGestureRecognizer extends PanGestureRecognizer {}
