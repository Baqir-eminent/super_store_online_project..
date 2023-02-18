import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:super_store_online_project/features/features_intro/repositories/spash_repository.dart';


part 'splash_state.dart';
part 'connection_status.dart';
class SplashCubit extends Cubit<SplashState> {
  SplashRepository splashRepository = SplashRepository();

  SplashCubit() : super(
      SplashState(
          connectionStatus: ConnectionInitial()
      ));


  void checkConnectionEvent()async{
    emit(state.copyWith(newConnectionStatus: ConnectionInitial()));
    bool isConnect = await splashRepository.checkConnectivity();


    if(isConnect){
      emit(state.copyWith(newConnectionStatus: ConnectionOn()));
    }else{
      emit(state.copyWith(newConnectionStatus: ConnectionOf()));
    }

  }
}
