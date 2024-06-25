import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/router/app_router.dart';
import 'package:renting_bd/core/router/route_path.dart';
import 'package:renting_bd/core/utils/constant.dart';
import 'package:renting_bd/core/utils/progress_indicator.dart';
import 'package:renting_bd/core/utils/shared_prefs_helper.dart';
import 'package:renting_bd/features/data/models/user_model.dart';
import 'package:renting_bd/features/domain/usecases/profile_usecase/add_user_profile_usecase.dart';
import 'package:renting_bd/features/domain/usecases/auth_usecases/register_usecase.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  final AddUserProfileUseCase addUserProfileUseCase;
  final ProgressIndicator progressIndicator;
  final AppRouter appRouter;
  final FirebaseAuth firebaseAuth;
  final SharedPrefsHelper sharedPrefsHelper;

  RegisterCubit(this.registerUseCase, this.addUserProfileUseCase, this.progressIndicator, this.appRouter,
      this.firebaseAuth, this.sharedPrefsHelper)
      : super(const RegisterState._());

  registerNewUser(RegisterParams params) async {
    await progressIndicator.show();
    final registrationResponse = await registerUseCase.call(params);

    registrationResponse.fold((failure) => progressIndicator.showError(error: failure.message), (user) async {
      if (user == null) {
        progressIndicator.showError();
        return;
      }

      final profileResponse =
          await addUserProfileUseCase.call(UserModel(uuid: user.uid, role: params.role, email: params.email));

      profileResponse.fold((failure) {
        progressIndicator.showError(error: failure.message);
        firebaseAuth.currentUser?.delete();
      }, (_) async {
        await sharedPrefsHelper.setUserRole(params.role);
        progressIndicator.dismiss();
        appRouter.router.goNamed(RoutePath.home);
      });
    });
  }

  onChangeRole(String? role) {
    if (role == null) return;
    emit(RegisterState.updateRole(role));
  }
}
