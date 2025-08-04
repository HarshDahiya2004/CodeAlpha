import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController courseController;
  late TextEditingController yearController;

  @override
  void didChangeDependencies() {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    nameController = TextEditingController(text: data['name']);
    phoneController = TextEditingController(text: data['phone']);
    courseController = TextEditingController(text: data['course']);
    yearController = TextEditingController(text: data['year']);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildField("Name", nameController),
              buildField("Phone", phoneController),
              buildField("Course", courseController),
              buildField("Year", yearController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'name': nameController.text,
                      'phone': phoneController.text,
                      'course': courseController.text,
                      'year': yearController.text,
                    });
                  }
                },
                child: Text("Save Changes", selectionColor: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: (value) => value!.isEmpty ? "$label is required" : null,
      ),
    );
  }
}
