




// Future<List<Map<String, dynamic>>> getDocumentsfromFirestore(WidgetRef ref) async {
//   final module = ref.read(signupDataProvider.notifier).getModule();
//   final path = ref.read(signupDataProvider.notifier).getiGlobalPath();

//   try {
//     // Get the documents from Firestore
//     QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('$path/${module!.code}/studyMaterials').get();

//     // Extract data from QuerySnapshot and return a list of maps
//     List<Map<String, dynamic>> documentsData = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

//     // Print the documents for debugging (optional)
//     print(documentsData.length);

//     // Return the list of maps
//     return documentsData;
//   } catch (error) {
//     // Handle errors here (print error for now)
//     print('Error retrieving documents: $error');
//     // Return an empty list or throw an exception based on your use case
//     return [];
//   }
// }


// Future<void> saveFirebaseDocsToHive() async {
//   final retrievedDocuments = await getDocumentsfromFirestore();
//   try {
//     // Open a Hive box (make sure to register the adapter for your data model)
//     final box = Hive.box<List<Map<String, dynamic>>>('retrievedDocuments');

//     // Clear existing data in the box (if needed)
//     await box.clear();

//     // Store the data directly in the Hive box as a List<Map<String, dynamic>>
//     await box.put('retrievedDocuments', retrievedDocuments);

//     // Close the box after storing the data
//     // await box.close();

//     print('Data stored in Hive successfully.');
//   } catch (error) {
//     print('Error storing data in Hive: $error');
//     // Handle the error as needed
//   }
// }

// Future<List<Map<String, dynamic>>> getFirebaseDocsFromHive() async {
//   await saveFirebaseDocsToHive();
//   var box = Hive.box<List<Map<String, dynamic>>>('retrievedDocuments');
//   var retrievedDocuments = box.values.expand((element) => element).toList(); // Flatten the list of lists
//   print(retrievedDocuments.length);
//   await offlineDocs(retrievedDocuments);
//   box.close();

//   return retrievedDocuments;
// }


// Future<void> offlineDocs(List<Map<String, dynamic>> docs) async {
//   var box = Hive.box<dynamic>('offlineDocs');
//   await box.put('offlineDocs', docs);
// }


// dynamic getofflineDocs() {
//   try {
//     final box = Hive.box<dynamic>('offlineDocs');
//     final docs = box.get('offlineDocs')!.toList();
//     print(docs);

//     return docs;
//   } catch (e) {
//     print(e);
//     return [];
//   }
// }
