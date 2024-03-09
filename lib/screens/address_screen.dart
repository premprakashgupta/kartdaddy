import 'package:flutter/material.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/box_shadow_container.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class Address {
  String address;
  bool isDefault;

  Address({required this.address, required this.isDefault});
}

class _AddressScreenState extends State<AddressScreen> {
  List<Address> addresses = [
    Address(address: "123 Main Street, City-12345, State-XYZ", isDefault: true),
    Address(
        address: "456 Side Street, City-67890, State-ABC", isDefault: false),
    Address(address: "789 Up Street, City-54321, State-PQR", isDefault: false),
    Address(
        address: "321 Down Street, City-09876, State-MNO", isDefault: false),
    Address(
        address: "555 Left Street, City-13579, State-JKL", isDefault: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Screen'),
      ),
      bottomNavigationBar: Container(
         width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(-2, -2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: CustomButton(
            onPressed: (){},
            child: NormalText(text: "Add New Address",),),
        ) ,),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return BoxBorderContainer(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubHeading(text: "PREM PRAKASH GUPTA",color: Colors.black,),
                          Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        addresses[index].isDefault ? 'Default' : '',
                        style: TextStyle(
                          color: addresses[index].isDefault
                              ? Colors.green
                              : Colors.transparent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Checkbox(
                        value: addresses[index].isDefault,
                        onChanged: (value) {
                          setState(() {
                            for (var addr in addresses) {
                              addr.isDefault = false;
                            }
                            addresses[index].isDefault = value!;
                          });
                        },
                      ),
                    ),
                  ],
                )
                        ],
                      ),
                      NormalText(text: "21"),
                      NormalText(text: "13"),
                      NormalText(text: addresses[index].address),
                      NormalText(text: "India"),
                      NormalText(text: "Phone number: ${"995804730"}"),
                     
                    ],
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
