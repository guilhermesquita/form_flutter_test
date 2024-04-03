import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forms',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 104, 11, 192),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomTextField(label: 'name', icon: Icons.person_2),
              const SizedBox(height: 15),
              const CustomTextField(label: 'email', icon: Icons.email),
              const SizedBox(height: 15),
              const CustomTextField(label: 'password', icon: Icons.vpn_key),
              const SizedBox(height: 15),
              const CustomTextField(
                label: 'confirm password',
                icon: Icons.vpn_key,
              ),
              const SizedBox(height: 30),
              // Builder(builder: (context) { ---------> POSSIBILIDADE DE VALIDAÇÃO SEM CHAVES GLOBAIS
              //   return SizedBox(
              //     width: double.infinity,
              //     height: 40,
              //     child: ElevatedButton.icon(
              //       onPressed: () {
              //         Form.of(context).validate();
              //       },
              //       icon: const Icon(Icons.save),
              //       label: const Text('Save'),
              //     ),
              //   );
              // }),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {
                    formKey.currentState?.validate();
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.replay_outlined,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'reset',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;

  const CustomTextField({super.key, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return TextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: 'type your $label...',
        enabled: true, // PARA PODER CLICAR NELE
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
        ),
        prefixIcon: icon == null ? null : Icon(icon, color: Colors.black),
      ),
      controller: controller,
    );
  }
}
