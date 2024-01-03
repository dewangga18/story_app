// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/data/api/api_services.dart';
import 'package:story_app/data/models/payload/login_payload.dart';
import 'package:story_app/data/models/payload/register_payload.dart';
import 'package:story_app/global_bloc/app_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required ApiService api,
    required BuildContext context,
  }) : super(const AuthState()) {
    on<SetVariableAuth>((event, emit) {
      emit(AuthState(
        isLoading: event.state.isLoading,
        isRegister: event.state.isRegister,
        sholdMovePage: event.state.sholdMovePage,
        showError: event.state.showError,
        showSuccess: event.state.showSuccess,
        validateLogin: event.state.validateLogin,
        validateRegister: event.state.validateRegister,
      ));
    });

    on<AuthIsLoginEvent>((event, emit) {
      emit(const AuthState(
        isRegister: false,
      ));
    });

    on<AuthIsRegisterEvent>((event, emit) {
      emit(const AuthState(
        isRegister: true,
      ));
    });

    on<ValidateLoginEvent>((event, emit) {
      final email = event.email;
      final password = event.password;
      bool isValid = true;
      if (email == '' || password == '') {
        isValid = false;
      }
      emit(AuthState(validateLogin: isValid));
    });

    on<ValidateRegisterEvent>((event, emit) {
      final email = event.email;
      final password = event.password;
      final name = event.name;
      bool isValid = true;
      if (email == '' || name == '') {
        isValid = false;
      }
      if (password.length < 8) {
        isValid = false;
      }
      emit(AuthState(
        validateRegister: isValid,
        isRegister: true,
      ));
    });

    on<DoRegisterEvent>((event, emit) async {
      emit(const AuthState(
        isRegister: true,
        validateRegister: true,
        isLoading: true,
      ));
      final response = await api.doRegister(
        RegisterPayload(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );
      if (response.error ?? false) {
        emit(const AuthState(
          isRegister: true,
          validateRegister: true,
          isLoading: false,
          showError: true,
        ));
      } else {
        emit(const AuthState(
          showSuccess: true,
          isLoading: false,
          isRegister: false,
        ));
      }
    });

    on<DoLoginEvent>((event, emit) async {
      emit(const AuthState(
        validateLogin: true,
        isLoading: true,
      ));
      final response = await api.doLogin(
        LoginPayload(
          email: event.email,
          password: event.password,
        ),
      );
      if (response.error ?? false) {
        emit(const AuthState(
          validateLogin: true,
          isLoading: false,
          showError: true,
        ));
      } else {
        context.read<AppBloc>().add(EventSetUserData(response.loginResult!));
        await Future.delayed(const Duration(seconds: 1));
        emit(const AuthState(
          sholdMovePage: true,
          isLoading: false,
        ));
      }
    });
  }
}
