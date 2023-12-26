part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isRegister;
  final bool isLoading;
  final bool validateLogin;
  final bool validateRegister;
  final bool sholdMovePage;
  final bool showError;
  final bool showSuccess;

  const AuthState({
    this.isRegister = false,
    this.isLoading = false,
    this.validateLogin = false,
    this.validateRegister = false,
    this.sholdMovePage = false,
    this.showError = false,
    this.showSuccess = false,
  });

  AuthState copyWith({
    bool? isRegister,
    bool? isLoading,
    bool? validateLogin,
    bool? validateRegister,
    bool? sholdMovePage,
    bool? showError,
    bool? showSuccess,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isRegister: isRegister ?? this.isRegister,
      validateLogin: validateLogin ?? this.validateLogin,
      validateRegister: validateRegister ?? this.validateRegister,
      sholdMovePage: sholdMovePage ?? this.sholdMovePage,
      showError: showError ?? this.showError,
      showSuccess: showSuccess ?? this.showSuccess,
    );
  }

  @override
  List<Object?> get props => [
        isRegister,
        isLoading,
        validateLogin,
        validateRegister,
        sholdMovePage,
        showError,
        showSuccess,
      ];
}
