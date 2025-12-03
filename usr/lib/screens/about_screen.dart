import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Image
            Container(
              height: 200,
              width: double.infinity,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.volunteer_activism,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Moland Mission Uganda Limited',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'We are a non-profit organization dedicated to improving the lives of vulnerable communities in Uganda. Founded on the principles of compassion and service, we strive to bring hope and tangible support to those who need it most.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  
                  _buildSectionTitle(context, 'Our Vision'),
                  const Text(
                    'A Uganda where every individual has access to basic needs, education, and healthcare, empowering them to live with dignity and purpose.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  
                  _buildSectionTitle(context, 'Our Mission'),
                  const Text(
                    'To mobilize resources and partner with local communities to implement sustainable solutions in education, healthcare, and clean water access.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 32),
                  
                  const Divider(),
                  const SizedBox(height: 16),
                  
                  _buildSectionTitle(context, 'Contact Us'),
                  const SizedBox(height: 8),
                  _buildContactRow(Icons.email, 'info@molandmission.org'),
                  _buildContactRow(Icons.phone, '+256 123 456 789'),
                  _buildContactRow(Icons.location_on, 'Kampala, Uganda'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade700),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
