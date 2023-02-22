import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageButtonNotifier extends StateNotifier<int> {
  PageButtonNotifier() : super(0);
  next() {
    state = state + 1;
  }

  pre() {
    state = state - 1;
  }
}
