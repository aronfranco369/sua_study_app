import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/Providers/recentDocsProvider.dart';

class StarredComponent extends ConsumerStatefulWidget {
  const StarredComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StarredComponentState();
}

class _StarredComponentState extends ConsumerState<StarredComponent> {
  @override
  Widget build(BuildContext context) {
    // final recentDocMaps= ref.read(rece)
    final recentDocMaps = ref.watch(recentDocsProvider);
    return ListView.builder(
      itemCount: recentDocMaps.length,
      itemBuilder: (context, index) {
        final doc = recentDocMaps[index];
        final number = doc['number'];
        final name = doc['name'];
        final type = doc['type'];

        return ListTile(
          title: Text('Document #$number: $name'),
          subtitle: Text('Type: $type'),
          onTap: () {
            // Handle document tap, e.g., open the document using downloadURL
          },
        );
      },
    );
  }
}
