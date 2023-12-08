import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/models/result.dart';
import 'package:undergrad_tracker/providers/results_provider.dart';
import 'package:undergrad_tracker/utils/color_utils.dart';
import 'package:undergrad_tracker/widgets/forms/edit_result.dart';
import 'package:undergrad_tracker/widgets/lists/result_list/result_list_item.dart';

class ResultList extends ConsumerStatefulWidget {
  const ResultList({super.key});

  @override
  ConsumerState<ResultList> createState() {
    return _ResultListState();
  }
}

class _ResultListState extends ConsumerState<ResultList> {
  _showUndoDeleteSnackBar({required Result result, required int index}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 6),
        content: Text('${result.courseCode} deleted successfully.'),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            _onUndoDeleteResult(
              result: result,
              index: index,
            );
          },
        ),
      ),
    );
  }

  _onUndoDeleteResult({required Result result, required int index}) {
    ref
        .read(resultsProvider.notifier)
        .addResultAt(index: index, result: result);
  }

  _onRemoveResult({required Result result, required int index}) {
    ref.read(resultsProvider.notifier).removeResult(result);
    _showUndoDeleteSnackBar(result: result, index: index);
  }

  _onEditResult(Result result) {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (ctx) {
          return EditResult(
            result: result,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final resultList = ref.watch(resultsProvider);
    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(resultList[index]),
          background: Container(
            height: 100,
            // margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            color: getColorByCourseYear(resultList[index].courseYear)
                .withOpacity(0.5),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 32,
            ),
          ),
          secondaryBackground: Container(
            height: 100,
            // margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            color: Theme.of(context).colorScheme.error.withOpacity(0.8),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 32,
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
            } else if (direction == DismissDirection.endToStart) {
              _onRemoveResult(
                result: resultList[index],
                index: index,
              );
            }
          },
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              _onEditResult(resultList[index]);
              return false;
            } else if (direction == DismissDirection.endToStart) {
              return true;
            }
            return false;
          },
          child: ResultListItem(result: resultList[index]),
        );
      },
    );
  }
}
