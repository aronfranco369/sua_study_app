import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/Providers/gg.dart';
import 'package:study_app/Providers/recentDocsProvider.dart';

class RecentComponent extends ConsumerStatefulWidget {
  const RecentComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecentComponentState();
}

class _RecentComponentState extends ConsumerState<RecentComponent> {
  @override
  Widget build(BuildContext context) {
    final starredState = ref.watch(starredStateProvider);
    // final recentDocMaps= ref.read(rece)
    final recentDocMaps = ref.watch(recentDocsProvider);
    return ListView.builder(
      itemCount: recentDocMaps.length,
      itemBuilder: (context, index) {
        final doc = recentDocMaps[index];
        final number = doc['number'];
        final name = doc['name'];
        final type = doc['type'];
        final isStarred = starredState[doc['id']] ?? false; // Assuming you have an 'id' field in your doc

        return ListTile(
          title: Text('Document #$number: $name'),
          subtitle: Text('Type: $type'),
          trailing: IconButton(
            icon: isStarred ? const Icon(Icons.star_rounded, color: Colors.green) : const Icon(Icons.star_outline_rounded),
            onPressed: () {
              // ref.watch(starredStateProvider.notifier).getCurrentMap(doc['id']);
              ref.watch(starredStateProvider.notifier).toggleStar(doc['id']);
              // ref.watch(starreddDocumentMapsProvider.notifier).clearBox();
            },
          ),
          onTap: () {
            // Handle document tap, e.g., open the document using downloadURL
          },
        );
      },
    );
  }
}

final starredStateProvider = StateNotifierProvider<StarredStateNotifier, Map<String, bool>>((ref) {
  return StarredStateNotifier(ref);
});

class StarredStateNotifier extends StateNotifier<Map<String, bool>> {
  Ref ref;
  StarredStateNotifier(this.ref) : super({});

  void toggleStar(String docId) {
    state = {...state, docId: !(state[docId] ?? false)};
    getCurrentMap(docId);
    final currentMap = ref.watch(starredStateProvider.notifier).getCurrentMap(docId);
    ref.watch(starreddDocumentMapsProvider.notifier).addToRecent(currentMap!);
    print(state);
  }

  Map<String, dynamic>? getCurrentMap(String id) {
    final recentDocMaps = ref.watch(recentDocsProvider);
    try {
      for (var map in recentDocMaps) {
        if (map['id'] == id) {
          print(Map<String, dynamic>.from(map));
          return Map<String, dynamic>.from(map);
        }
      }
    } catch (e) {
      print('errorrrr');
    }

    return null;

    // Return null when no matching 'downloadURL' is found
  }
}
