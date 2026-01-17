import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
//import 'package:dropdown_search/dropdown_search.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Screen')),
      body: _buildBody(),
    );
  }

  final _formkey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();

  DateTime? _selectedDate, _selectedBookingDate;

  bool _isSchoolarship = false;

  final _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage({bool camera = false}) async {
    final pickedFile = await _picker.pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
    ); // or .camera
    if (pickedFile != null) {
      setState(() => _imageFile = pickedFile);
    }
  }

  List<Map<String, dynamic>> genders = [
    {"eng": "Select Gender", "kh": "សូមជ្រើសរើសភេទ", "ch": "选择性别", "value": 0},
    {"eng": "Male", "kh": "ប្រុស", "ch": "男", "value": 1},
    {"eng": "Female", "kh": "ស្រី", "ch": "女", "value": 2},
  ];

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formkey,
        child: ListView(
          children: [
            _buildEmailTextField(),
            SizedBox(height: 20),
            _buildDatePicker(),
            SizedBox(height: 20),
            _buildBookingDate(),
            SizedBox(height: 20),
            _buildGenderDropdown(),
            SizedBox(height: 20),
            _isSchoolarshipSwitch(),
            SizedBox(height: 20),
            _buildimgepicker(),
            SizedBox(height: 20),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _emailCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Input Email",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email is required";
        }
        if (EmailValidator.validate(value) == false) {
          return "Email format is incorrect";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {}
      },
      child: Text("Submit"),
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate ?? DateTime(2000, 1, 1),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          setState(() => _selectedDate = pickedDate);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Date and Birth",
        ),
        child: Text(
          _selectedDate != null
              ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
              : 'Select Date of Birth',
        ),
      ),
    );
  }

  Widget _buildBookingDate() {
    DateTime today = DateTime.now();
    DateTime onemonthLater = today.add(const Duration(days: 30));

    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedBookingDate ?? today,
          firstDate: today,
          lastDate: onemonthLater,
        );
        if (pickedDate != null) {
          setState(() => _selectedBookingDate = pickedDate);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Date and Birth",
        ),
        child: Text(
          _selectedBookingDate != null
              ? DateFormat('yyyy-MM-dd').format(_selectedBookingDate!)
              : 'Select your booking date',
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField(
      hint: Text("Select"),
      padding: EdgeInsets.all(5),
      initialValue: genders[0]["value"],
      items: genders
          .map(
            (item) =>
                DropdownMenuItem(value: item["value"], child: Text(item["kh"])),
          )
          .toList(),
      onChanged: (value) {},
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }

  Widget _isSchoolarshipSwitch() {
    return ListTile(
      title: Text("Schoolarship Student?"),
      leading: Icon(Icons.person_2_outlined),
      trailing: Switch(
        value: _isSchoolarship,
        onChanged: (value) {
          setState(() => _isSchoolarship = value);
        },
      ),
      onTap: () {
        setState(() => _isSchoolarship = !_isSchoolarship);
      },
    );
  }

  Widget _buildimgepicker() {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            _pickImage();
          },
          icon: Icon(Icons.photo),
          label: Text("Choose image from gallery"),
        ),
        SizedBox(width: 25),
        ElevatedButton.icon(
          onPressed: () {
            _pickImage(camera: true);
          },
          icon: Icon(Icons.camera_alt_outlined),
          label: Text("Take a photo"),
        ),
        _buildPictureFrame(),
      ],
    );
  }

  Widget _buildPictureFrame() {
    return _imageFile != null
        ? Container(
            width: double.infinity,
            //height: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Image.file(File(_imageFile!.path), fit: BoxFit.cover),
          )
        : Text("No image selected");
  }
}
