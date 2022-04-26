// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../persistance/api_provider.dart' as _i3;
import '../service/network_service.dart' as _i5;
import '../service/services_module.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.ApiProvider>(() => thirdPartyServicesModule.apiProvider);
  gh.lazySingleton<_i4.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<_i4.NavigationService>(
      () => thirdPartyServicesModule.navigationServices);
  gh.lazySingleton<_i5.NetworkService>(
      () => thirdPartyServicesModule.networkService);
  return get;
}

class _$ThirdPartyServicesModule extends _i6.ThirdPartyServicesModule {
  @override
  _i3.ApiProvider get apiProvider => _i3.ApiProvider();
  @override
  _i4.BottomSheetService get bottomSheetService => _i4.BottomSheetService();
  @override
  _i4.NavigationService get navigationServices => _i4.NavigationService();
  @override
  _i5.NetworkService get networkService => _i5.NetworkService();
}
