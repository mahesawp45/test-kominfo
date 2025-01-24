import 'package:flutter/material.dart';
import 'package:test_kominfo/widgets/button/primary_button.dart';
import 'package:test_kominfo/widgets/input/text_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Pengaduan"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8),
          child: PrimaryButton(
            label: 'Daftar',
            onTap: () async {},
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextInput(
                  label: 'NIK',
                  placeHolder: 'Masukkan NIK anda',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 12,
                ),
                TextInput(
                  label: 'Nama',
                  placeHolder: 'Masukkan Nama anda',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 12,
                ),
                TextInput(
                  label: 'No. HP',
                  placeHolder: 'Masukkan No. HP anda',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 12,
                ),
                TextInput(
                  label: 'Email',
                  placeHolder: 'Masukkan Email anda',
                  type: TextInputType.emailAddress,
                  autoFill: const [AutofillHints.email],
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 12,
                ),
                TextInput(
                  label: 'Alamat Anda',
                  placeHolder: 'Masukkan alamat anda',
                  type: TextInputType.streetAddress,
                  autoFill: const [
                    AutofillHints.streetAddressLevel1,
                    AutofillHints.streetAddressLevel2,
                    AutofillHints.streetAddressLevel3,
                    AutofillHints.streetAddressLevel4,
                  ],
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 12,
                ),
                TextInput(
                  label: 'Password',
                  placeHolder: 'Masukkan Password anda',
                  isPassword: true,
                  isPassVisible: false,
                  onChange: (value) {},
                  onPasswordTap: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
