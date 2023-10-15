import 'package:shimmer/shimmer.dart';
import 'package:study_app/Routes/notesScreen.dart';
import 'package:study_app/mindex.dart';

class Users extends ConsumerStatefulWidget {
  const Users({super.key});

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends ConsumerState<Users> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // final path = ref.read(pathProviderString);

  @override
  Widget build(BuildContext context) {
    final path = ref.watch(signupDataProvider.notifier).getiGlobalPath();
    final student = ref.watch(signupDataProvider);

    // final pathAsyncValue = ref.watch(pathProviderString);
    return Scaffold(
      backgroundColor: mpAppBackGroundColor,
      key: _scaffoldKey,
      drawer: const DrawerScreen(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(path!).where('code', isNotEqualTo: '').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: CustomText(
              text: 'Sorry there is no any module added in ${student.semester} ',
            ));
          } else {
            // Assuming 'Note' is your data model.
            final List<Module> modules = snapshot.data!.docs.map((doc) {
              final data = doc.data();

              return Module(
                name: data['name'],
                id: data['id'],
                code: data['code'],
                credit: data['credit'],
                status: data['status'],
                instructors: data['instructors'],
                path: data['path'],
              );
            }).toList();

            return Column(
              children: [
                Expanded(
                  child: AnimatedWrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    spacing: 6,
                    runSpacing: 2,
                    itemCount: modules.length,
                    itemBuilder: (context, index) {
                      final module = modules[index];
                      final List<dynamic> instructors = module.instructors;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: GestureDetector(
                          onTap: () async {
                            SS(
                              moduleCode: module.code,
                            ).launch(context);
                          },
                          child: Card(
                            color: mpAppBackGroundColor3,
                            elevation: 3,
                            margin: const EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: module.code,
                                        fontSize: 24,
                                      ),
                                      CustomText(text: module.status),
                                    ],
                                  ),
                                  5.height,
                                  CustomText(text: module.name),
                                  5.height,
                                  Row(
                                    children: [
                                      CustomText(text: 'Credits : ${module.credit}'),
                                      5.width,
                                      const CustomText(text: '| '),
                                      for (var instructor in instructors) ...[
                                        CustomText(text: '${instructor['status']}.${instructor['name']}'),
                                        if (instructor != instructors.last) const CustomText(text: ' & '),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
