
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import '../persistance/api_provider.dart';
import 'network_service.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  ApiProvider get apiProvider;

  @lazySingleton
  NavigationService get navigationServices;

  @lazySingleton
  BottomSheetService get bottomSheetService;

  @lazySingleton
  NetworkService get networkService;
}
