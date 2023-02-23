import 'package:flutter/material.dart';
import 'package:flutter_application/Components/TodoList/Add.dart';
import 'package:flutter_application/Components/TodoList/ListItem.dart';
import 'package:flutter_application/Components/TodoList/Provider/createProvider.dart';
import 'package:flutter_application/Components/TodoList/Provider/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TodoList extends StatelessWidget {
//   const TodoList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print(1);
//     return Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(children: [
//           const AddTodo(),
//           Expanded(
//               child: Row(
//             children: [
//               Expanded(
//                   child: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Text('未完成'),
//                   ),
//                   Expanded(child: Consumer(
//                     builder: (context, ref, child) {
//                       final List<Todo> notCompletedTodos = ref
//                           .watch(todosProvider)
//                           .where((todo) => !todo.isCompleted)
//                           .toList();
//                       print(2);

//                       return ListView.builder(
//                         itemCount: notCompletedTodos.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ListItem(todo: notCompletedTodos[index]);
//                         },
//                       );
//                     },
//                   ))
//                 ],
//               )),
//               Expanded(
//                   child: Column(children: [
//                 const Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Text('已完成'),
//                 ),
//                 Expanded(child: Consumer(
//                   builder: (context, ref, child) {
//                     final List<Todo> notCompletedTodos = ref
//                         .watch(todosProvider)
//                         .where((todo) => todo.isCompleted)
//                         .toList();
//                     print(3);
//                     return ListView.builder(
//                       itemCount: notCompletedTodos.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return ListItem(todo: notCompletedTodos[index]);
//                       },
//                     );
//                   },
//                 ))
//               ])),
//             ],
//           ))
//         ]));
//   }
// }

// class TodoList extends ConsumerWidget {
//   const TodoList({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final completedTodos = getCompletedTodos(ref);
//     final notCompletedTodos = getNotCompletedTodos(ref);
//     print('11');
//     return Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(children: [
//           const AddTodo(),
//           Expanded(
//               child: Row(
//             children: [
//               Expanded(
//                   child: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Text('未完成'),
//                   ),
//                   Expanded(
//                       child: ListView.builder(
//                     itemCount: notCompletedTodos.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListItem(todo: notCompletedTodos[index]);
//                     },
//                   ))
//                 ],
//               )),
//               Expanded(
//                   child: Column(children: [
//                 const Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Text('未完成'),
//                 ),
//                 Expanded(
//                     child: ListView.builder(
//                   itemCount: completedTodos.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListItem(todo: completedTodos[index]);
//                   },
//                 ))
//               ])),
//             ],
//           ))
//         ]));
//   }

//   List<Todo> getCompletedTodos(WidgetRef ref) {
//     final List<Todo> todos = ref.watch(todosProvider);
//     return todos.where((todo) => todo.isCompleted).toList();
//   }

//   List<Todo> getNotCompletedTodos(WidgetRef ref) {
//     final List<Todo> todos = ref.watch(todosProvider);
//     return todos.where((todo) => !todo.isCompleted).toList();
//   }
// }
class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    print(1);
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const AddTodo(),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('未完成'),
                  ),
                  Expanded(child: Consumer(
                    builder: (context, ref, child) {
                      // final List<Todo> notCompletedTodos =
                      //     getNotCompletedTodos(ref);
                      final List<Todo> notCompletedTodos =
                          ref.watch(getNotCompletedTodos);
                      print(2);
                      return ListView.builder(
                        itemCount: notCompletedTodos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListItem(todo: notCompletedTodos[index]);
                        },
                      );
                    },
                  ))
                ],
              )),
              Expanded(
                  child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('已完成'),
                ),
                Expanded(child: Consumer(
                  builder: (context, ref, child) {
                    final List<Todo> completedTodos =
                        ref.watch(completedTodosProvider);
                    print(3);
                    return ListView.builder(
                      itemCount: completedTodos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListItem(todo: completedTodos[index]);
                      },
                    );
                  },
                ))
              ])),
            ],
          ))
        ]));
  }
}
