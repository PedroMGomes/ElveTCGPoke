import 'package:elve_tcg_poke/components/common/elve_card_loading_widget.dart';
import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:extended_image/extended_image.dart'
    show ExtendedImage, ExtendedImageState, LoadState;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

/// Card Image widget with unbound width and locked aspect ratio.
/// Uses the `extended_image` package for image local cache and loading placeholder.
/// Image widget with placeholder loading, error and image cache.
class ElveCardImage extends StatelessWidget {
  const ElveCardImage(
      {Key? key,
      required this.imageUrl,
      required this.backgroundLoadingColor,
      required this.loadingIcon})
      : super(key: key);

  final String imageUrl;
  final Color backgroundLoadingColor;
  final String loadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: <BoxShadow>[ElveTheme.elveShadow]),
      child: ExtendedImage.network(
        imageUrl,
        cache: true,
        fit: BoxFit.contain,
        // imageCacheName: ,
        handleLoadingProgress: true,
        // enabled by default for network constructor.
        // enableLoadState: true,
        loadStateChanged: (ExtendedImageState value) {
          if (value.extendedImageLoadState == LoadState.loading) {
            return _ImageContainer(
              color: backgroundLoadingColor,
              child: ElveCardLoadingWidget(
                source: loadingIcon,
              ),
            );
          } else if (value.extendedImageLoadState == LoadState.completed) {
            return null; // actual image.
          } else if (value.extendedImageLoadState == LoadState.failed) {
            return _ImageContainer(
              color: backgroundLoadingColor,
              child: SvgPicture.asset(loadingIcon),
            );
          }
          return null; // actual image.
        },
      ),
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({Key? key, required this.color, required this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [ElveTheme.lighterShade(color), ElveTheme.darkerShade(color)],
    );
    return Container(
      // TODO hardcoded according to actual card size.
      width: 734,
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(12.0)),
      child: AspectRatio(
        aspectRatio: 0.71,
        child: FractionallySizedBox(
          widthFactor: 0.2,
          child: child,
        ),
      ),
    );
  }
}

/// [NetworkImage].
/// Fade in animation once the image loads.
class _NetworkImage extends StatelessWidget {
  const _NetworkImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) => Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, StackTrace? stackTrace) => Expanded(
            child: Container(color: Theme.of(context).primaryColorLight)),
        // image fade in animation `once` it loads.
        frameBuilder:
            (context, child, int? frame, bool? wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded ?? false) {
            // if image was sync and wasSynchronouslyLoaded is defined, return the image immediately.
            return child;
          }
          return AnimatedOpacity(
            child: child,
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
        },
      );
}
