import 'package:fakeCall/service/Contact/Contact.dart';
import 'package:fakeCall/service/Toaster/Toaster.dart';
import 'package:fakeCall/ui/components/ContactPicker/ContactPicker.dart';
import 'package:fakeCall/ui/views/Home/Home.dart';
import 'package:fakeCall/ui/views/Success/Success.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
  CupertinoRoute(page: SuccessView),
  CupertinoRoute(page: ContactPicker)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: ToasterService),
  LazySingleton(classType: ContactService)
])
class AppSetUp {}
