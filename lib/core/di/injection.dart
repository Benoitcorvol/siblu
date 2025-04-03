@InjectableInit(
  initializerName: 'initDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() => initDependencies();

@module
abstract class AppModule {
  @singleton
  ConnectivityService get connectivity => ConnectivityService();
  
  @singleton
  SyncManager get syncManager => SyncManager();
  
  @singleton
  AssetManager get assetManager => AssetManager();
  
  @singleton
  DistributionService get distribution => DistributionService();
  
  @singleton
  ErrorHandler get errorHandler => ErrorHandler();
}