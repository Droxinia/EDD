import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationRequestPage extends StatefulWidget {
  @override
  _DonationRequestPageState createState() => _DonationRequestPageState();
}

class _DonationRequestPageState extends State<DonationRequestPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  String _imageUrl = '';
  late DateTime _requestTime;

  @override
  void initState() {
    super.initState();
    _requestTime = DateTime.now();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final description = _descriptionController.text;
      final phone = _phoneController.text;

      await FirebaseFirestore.instance.collection('volunteers').add({
        'title': title,
        'description': description,
        'phone': phone,
        'imageUrl': _imageUrl,
        'requestTime': _requestTime,
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Donation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Request for Volunteer'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => VolunteerPage()));
                },
                child: Text('go to list'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VolunteerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('volunteers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = snapshot.data?.docs;

          return ListView.builder(
            itemCount: documents?.length,
            itemBuilder: (context, index) {
              final document = documents![index];
              final title = document['title'];
              final description = document['description'];
              final phone = document['phone'];
              final imageUrl = document['imageUrl'];
              final requestTime = document['requestTime'].toDate();

              return ListTile(
                leading: imageUrl != null ? Image.network(imageUrl) : null,
                title: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(requestTime.toString()),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonationDetailsPage(
                        title: title,
                        description: description,
                        phone: phone,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class DonationDetailsPage extends StatelessWidget {
  const DonationDetailsPage({
    Key? key,
    required this.title,
    required this.description,
    required this.phone,
  }) : super(key: key);
  final String title;
  final String description;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Phone: $phone',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
