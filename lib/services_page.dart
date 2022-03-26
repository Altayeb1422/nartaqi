import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nartaqi/services_class.dart';
import 'package:nartaqi/services_page_card.dart';
import 'constants.dart';

final bucketGlobal = PageStorageBucket();
class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('الخدمات والفعاليات', style: kPageTitleStyle,),
            ],
          ),
        ),
        elevation: 10,
      ),
      body:
      PageStorage(
        bucket: bucketGlobal,
        child:MasonryGridView.count(
          key: const PageStorageKey<String>('servicesPage'),
          physics: const BouncingScrollPhysics(),
          itemCount: services.length,
          shrinkWrap: true,
          itemBuilder: ( context,  index) =>
              ServicesPageCard(
                services: services[index],
              ),
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
      )
    );
  }
}
