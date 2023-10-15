import 'package:study_app/Components/starredComponent.dart';
import 'package:study_app/Providers/hhUI.dart';
import 'package:study_app/mindex.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});

  @override
  HomeComponentState createState() => HomeComponentState();
}

class HomeComponentState extends State<HomeComponent> with SingleTickerProviderStateMixin {
  int notificationCounter = 3;
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: context.width(),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radiusOnly(topRight: 32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.height,
              Text('Inbox', style: boldTextStyle(size: 20)).paddingLeft(16.0),
              8.height,
              AppTextField(
                controller: _searchController,
                textFieldType: TextFieldType.OTHER,
                autoFocus: false,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                  suffixIcon: _searchController.text.isEmpty
                      ? null
                      : const Icon(Icons.clear).onTap(() {
                          _searchController.clear();
                        }),
                ),
              ).paddingOnly(right: 16.0, left: 16.0),
              16.height,
              TabBar(
                controller: _tabController,
                labelColor: Colors.blue,
                indicatorColor: white,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'Recent'),
                  Tab(text: 'Starred'),
                ],
              ),
              TabBarView(
                controller: _tabController,
                children: const [
                  RRecentDoc(),
                  StarredComponent(),
                ],
              ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}
