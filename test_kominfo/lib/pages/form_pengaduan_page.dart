import 'dart:async';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:test_kominfo/pages/register_page.dart';
import 'package:test_kominfo/widgets/button/primary_button.dart';
import 'package:test_kominfo/widgets/dialog/login_dialog.dart';
import 'package:test_kominfo/widgets/input/text_input.dart';
import 'package:test_kominfo/widgets/navigation/primary_navigation.dart';

class FormPengaduanPage extends StatelessWidget {
  const FormPengaduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    Future pickFile() async {
      // Create an instance of FilePicker
      final picker = FilePicker.platform;

      // Use the instance to pick files
      FilePickerResult? result = await picker.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'doc'],
      );

      log("${result?.files.single.path}", name: "RESULT");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Pengaduan"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8),
        child: PrimaryButton(
          label: 'Kirim Pengaduan',
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) => LoginDialog(
                onTap: () {},
                additionWidget: TextButton(
                  onPressed: () {
                    PrimaryNavigation.pushFromRight(
                      context,
                      page: const RegisterPage(),
                    );
                  },
                  child: const Text("Belum Ada Akun? Daftar"),
                ),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FormPengaduan(
                title: "Data Diri",
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
                      label: 'Alamat Pengaduan',
                      placeHolder: 'Masukkan alamat pengaduan',
                      type: TextInputType.streetAddress,
                      autoFill: const [
                        AutofillHints.streetAddressLevel1,
                        AutofillHints.streetAddressLevel2,
                        AutofillHints.streetAddressLevel3,
                        AutofillHints.streetAddressLevel4,
                      ],
                      onChange: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              FormPengaduan(
                title: "Data Pengaduan",
                child: Column(
                  children: [
                    TextInput(
                      label: 'Judul',
                      placeHolder: 'Masukkan judul pengaduan',
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextInput(
                      label: 'Deskripsi Permasalahan',
                      placeHolder: 'Masukkan deskripsi permasalahan',
                      minLines: 3,
                      maxLines: 5,
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Bukti Pengaduan",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          MaterialButton(
                            onPressed: () async {
                              await pickFile();
                            },
                            padding: const EdgeInsets.all(12),
                            color: Colors.amber.withOpacity(0.5),
                            child: const Icon(Icons.photo),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormPengaduan extends StatelessWidget {
  const FormPengaduan({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(
            height: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      ],
    );
  }
}
