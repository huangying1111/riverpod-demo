import 'package:flutter_application/Page/TodoList/Provider/stateNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

final todosProvider =
    StateNotifierProvider<TodosNotifier, List<Todo>>((ref) => TodosNotifier());
