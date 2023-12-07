import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/models/result.dart';
import 'package:undergrad_tracker/providers/results_provider.dart';
import 'package:undergrad_tracker/utils/color_utils.dart';
import 'package:undergrad_tracker/widgets/lists/result_list/result_list_item.dart';

class ResultList extends ConsumerStatefulWidget {
  const ResultList({super.key});

  @override
  ConsumerState<ResultList> createState() {
    return _ResultListState();
  }
}

class _ResultListState extends ConsumerState<ResultList> {
  _onRemoveResult(Result result) {
    ref.read(resultsProvider.notifier).removeResult(result);
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
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
              // _onRemoveResult(resultList[index]);
            }
          },
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              return false;
            } else if (direction == DismissDirection.endToStart) {
              // _onRemoveResult(resultList[index]);
              return false;
            }
          },
          child: ResultListItem(result: resultList[index]),
        );
      },
    );
  }
}
