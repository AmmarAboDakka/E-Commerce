import 'dart:developer';

import 'package:e_commerce/app/injector.dart';
import 'package:e_commerce/config/widget/small_text_widget.dart';
import 'package:e_commerce/core/utils/constant.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/module/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please , enter valid email';
                }
                return null;
              },
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'hussein74@gmail.com',
                label: SmallTextWidget('Email Address'),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            AppConstant.horizontalDivider(),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please , enter valid email';
                }
                return null;
              },
              controller: _nameController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'Ammar',
                label: SmallTextWidget('Name'),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            AppConstant.horizontalDivider(),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please , enter valid email';
                }
                return null;
              },
              controller: _phoneController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'hussein74@gmail.com',
                label: SmallTextWidget('phone'),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            AppConstant.horizontalDivider(),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please , enter valid password';
                }
                return null;
              },
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: '**********',
                label: const SmallTextWidget('Password'),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {},
                child: const SmallTextWidget('Reset Password?'),
              ),
            ),
            BlocProvider(
              create: (context) => getIt<AuthBloc>(),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                if (state.registerState == RequestState.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: SmallTextWidget(
                        state.registerErrorMessage,
                        maxLines: null,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  );
                  log('Error Happen ${state.registerErrorMessage}');
                }
              },
                builder: (context, state) {
                  if (state.registerState==RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            RegisterWithEmailAndPasswordEvent(
                                name: _nameController.text,
                                password: _passwordController.text,
                                phone: _phoneController.text,
                                email: _emailController.text),
                          );
                        }
                      },
                      child: const SmallTextWidget('register'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
