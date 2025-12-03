import 'package:flutter/material.dart';
import '../models/cause.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Cause> causes = [
      Cause(
        title: 'Education for All',
        description: 'Providing school supplies and tuition for underprivileged children in rural Uganda.',
        imageUrl: 'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        targetAmount: 5000,
        raisedAmount: 1250,
      ),
      Cause(
        title: 'Clean Water Initiative',
        description: 'Building wells and water purification systems for communities without access to safe water.',
        imageUrl: 'https://images.unsplash.com/photo-1538300342682-cf57afb97285?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        targetAmount: 10000,
        raisedAmount: 4500,
      ),
      Cause(
        title: 'Medical Outreach',
        description: 'Mobile clinics providing basic healthcare and vaccinations to remote villages.',
        imageUrl: 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        targetAmount: 7500,
        raisedAmount: 3000,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moland Mission Uganda'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Together We Can\nMake a Difference',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Join us in our mission to support communities in Uganda through charity and sustainable development.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to donate tab via parent controller or direct push
                      // For simplicity in this demo, we rely on the user using the bottom nav
                      // or we could use a global key or provider.
                      // Here we just show a snackbar.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please visit the Donate tab to contribute!')),
                      );
                    },
                    child: const Text('Support Our Mission'),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Our Causes',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            // Causes List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: causes.length,
              itemBuilder: (context, index) {
                final cause = causes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Placeholder for image (using a color container if network image fails or for loading)
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        child: Image.network(
                          cause.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: Icon(Icons.image, size: 50, color: Colors.grey));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cause.title,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              cause.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 16),
                            LinearProgressIndicator(
                              value: cause.raisedAmount / cause.targetAmount,
                              backgroundColor: Colors.grey.shade200,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${cause.raisedAmount.toInt()} raised',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Goal: \$${cause.targetAmount.toInt()}',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
