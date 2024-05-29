import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proximity/domain_repository/models/address_model.dart';
import 'package:proximity_commercant/ui/widgets/address_picker/address_selection_screen.dart';

void main() {
  testWidgets('Test rendering of AddressSelectionScreen', (WidgetTester tester) async {
    // Construire le widget
    await tester.pumpWidget(MaterialApp(
      home: AddressSelectionScreen(
        currentAddress: Address(
          lat: 48.8566, // Latitude of Paris
          lng: 2.3522,  // Longitude of Paris
          countryName: 'France',
          countryCode: 'FR',
          locality: 'Paris',
          region: 'Île-de-France',
          city: 'Paris',
          fullAddress: 'Paris, France',
          streetName: 'Paris Street',
          postalCode: '75000',
        ),
      ),
    ));

    // Attendre la fin du rendu
    await tester.pumpAndSettle();

    // Vérifier si le widget a rendu le titre "Select an address"
    expect(find.text('Select an address'), findsOneWidget);

    // Vérifier si le widget a rendu le bouton de validation
    expect(find.text('Validate.'), findsOneWidget);
  });
}
