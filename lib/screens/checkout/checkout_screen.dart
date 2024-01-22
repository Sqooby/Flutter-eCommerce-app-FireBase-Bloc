// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/blocs/blocs.dart';

import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController coutryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: const CustomBottomBar(
        screen: routeName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CUSTOMER INFORMATION',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              _buildTextFormField(emailController, context, 'Email'),
              _buildTextFormField(nameController, context, 'Full name'),
              Text(
                'DELIVERY INFORMATION',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              _buildTextFormField(addressController, context, 'Address'),
              _buildTextFormField(cityController, context, 'City'),
              _buildTextFormField(coutryController, context, 'Country'),
              _buildTextFormField(zipCodeController, context, 'Zip Code'),
              Text(
                'ORDER SUMMARY',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const OrderSummary()
            ]),
      ),
    );
  }
}

Padding _buildTextFormField(
  TextEditingController controller,
  BuildContext context,
  String labelText,
) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Row(children: [
      SizedBox(
        width: 75,
        child: Text(
          labelText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      Expanded(
        child: TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(left: 10),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ]),
  );
}
