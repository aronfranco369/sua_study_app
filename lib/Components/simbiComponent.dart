import 'package:study_app/mindex.dart';

class SimbiComponent extends ConsumerWidget {
  const SimbiComponent({super.key, required this.documents});

  final List<QueryDocumentSnapshot<Object?>> documents;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, List<QueryDocumentSnapshot<Object?>>> documentsByYear = {};

    for (final document in documents) {
      final String year = document['year']; // Assuming there's a 'year' field in your documents

      if (!documentsByYear.containsKey(year)) {
        documentsByYear[year] = [];
      }

      documentsByYear[year]!.add(document);
    }

    // Create a list of years in descending order
    final yearsList = documentsByYear.keys.toList()..sort((a, b) => b.compareTo(a));

    return ListView.builder(
      itemCount: yearsList.length,
      itemBuilder: (context, yearIndex) {
        final year = yearsList[yearIndex];
        final yearDocuments = documentsByYear[year]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomText(
                text: year,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              itemCount: yearDocuments.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final document = yearDocuments[index];
                final String downloadURL = document['downloadURL'];
                final String name = document['name'];

                final downloadStatusBox = Hive.box<bool?>('downloadStatusBox');
                final bool? isDownloaded = downloadStatusBox.get(name, defaultValue: false);

                return Card(
                  color: const Color(0xff1b242d),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: name,
                        ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
