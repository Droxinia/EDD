import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationRequestPage extends StatefulWidget {
  const DonationRequestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DonationRequestPageState createState() => _DonationRequestPageState();
}

class _DonationRequestPageState extends State<DonationRequestPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  final String _imageUrl = '';
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

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Donation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
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
                decoration: const InputDecoration(
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
                decoration: const InputDecoration(
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
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('volunteers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(requestTime.toString()),
                trailing: const Icon(Icons.arrow_forward),
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
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Phone: $phone',
                    style: const TextStyle(
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
