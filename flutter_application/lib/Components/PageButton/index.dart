import 'package:flutter/material.dart';
import 'package:flutter_application/Components/PageButton/Provider.dart/stateNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageButton extends StatefulWidget {
  const PageButton({super.key});

  @override
  State<PageButton> createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  final StateNotifierProvider<PageButtonNotifier, int>
      pageButtonNotifierProvider =
      StateNotifierProvider<PageButtonNotifier, int>((ref) {
    return PageButtonNotifier();
  });
  late Provider<bool> canGoToPreviousPageProvider;

  @override
  void initState() {
    canGoToPreviousPageProvider = Provider<bool>((ref) {
      return ref.watch(pageButtonNotifierProvider) > 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Row(
      children: [
        Consumer(builder: (context, ref, child) {
          print('preNew');
          final onPressed = ref.watch(canGoToPreviousPageProvider)
              ? ref.read(pageButtonNotifierProvider.notifier).pre
              : null;
          return TextButton(onPressed: onPressed, child: const Text('上一页 缓存'));
        }),
        Consumer(builder: (context, ref, child) {
          print('pre');
          final onPressed = ref.watch(pageButtonNotifierProvider) > 0
              ? ref.read(pageButtonNotifierProvider.notifier).pre
              : null;
          return TextButton(onPressed: onPressed, child: const Text('上一页'));
        }),
        Consumer(builder: (context, ref, child) {
          print('watch');
          return Text('${ref.watch(pageButtonNotifierProvider)}');
        }),
        Consumer(builder: (context, ref, child) {
          print('next');

          return TextButton(
              onPressed: ref.read(pageButtonNotifierProvider.notifier).next,
              child: const Text('下一页'));
        }),
      ],
    );
  }
}

// class PageButton extends ConsumerStatefulWidget {
//   const PageButton({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _PageButtonState();
// }

// class _PageButtonState extends ConsumerState<PageButton> {
//   final StateNotifierProvider<PageButtonNotifier, int>
//       pageButtonNotifierProvider =
//       StateNotifierProvider<PageButtonNotifier, int>((ref) {
//     return PageButtonNotifier();
//   });
//   late Provider<bool> canGoToPreviousPageProvider;

//   @override
//   void initState() {
//     canGoToPreviousPageProvider = Provider<bool>((ref) {
//       return ref.watch(pageButtonNotifierProvider) > 0;
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build');
//     return Row(children: [
//       TextButton(
//           onPressed: ref.watch(canGoToPreviousPageProvider)
//               ? ref.read(pageButtonNotifierProvider.notifier).pre
//               : null,
//           child: const Text('上一页 缓存')),
//       TextButton(
//           onPressed: ref.watch(pageButtonNotifierProvider) > 0
//               ? ref.read(pageButtonNotifierProvider.notifier).pre
//               : null,
//           child: const Text('上一页')),
//       Text('${ref.watch(pageButtonNotifierProvider)}'),
//       TextButton(
//           onPressed: ref.read(pageButtonNotifierProvider.notifier).next,
//           child: const Text('下一页')),
//     ]);
//   }
// }
