import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:vendor/src/view/common/auth/auth_container.dart';
import 'package:vendor/src/view/common/auth/custom_btn.dart';

import '../common/alignContainer/aligned_container.dart';
import '../common/custom_checkout/custom_checkout.dart';

class ApplicationForm extends StatelessWidget {
  const ApplicationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WasphaHeader(
              title1: "Application\n Form",
              title1Size: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Feature and Profile images",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 280,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: const Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text("Feature Image"),
                        ],
                      )),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          child: const Icon(Icons.add),
                        ),
                        const Text(
                          "Business Logo",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Business Name",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Enter Business Name in English"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "اسم كيان العمل باللغة العربية",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintTextDirection: TextDirection.rtl,
                    hintText: "ادخل اسم كيان العمل باللغة العربية"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Business Contact Number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: PhoneFormField(
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  border: UnderlineInputBorder(),
                ),
                showFlagInInput: true,
                defaultCountry: IsoCode.EG,
                validator: (phoneNumber) {
                  if (phoneNumber == null) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Business Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Select location from map",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const ListTile(
              trailing: Icon(Icons.location_on),
              title: Text("Select Location"),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              title: Text(
                "Business Category",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.info),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Category 1",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 15,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                child: const Icon(Icons.add),
                              ),
                              const Text("Grocery")
                            ],
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Sub Category",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomCheckoutTile(
                  text: "Sub Category 1",
                  value: false,
                  onChanged: (value) {},
                ),
                const AlignedContainer(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Add New Category",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Default Periods",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Order Preparation Period",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Offer Expiry Period",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Delivery Range",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.remove_circle_outline),
                      SizedBox(
                        width: 5,
                      ),
                      Text("5 KM"),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.add_circle_outline),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Working Hours",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const CustomCheckoutTile(
              text: "24/7",
              value: false,
            ),
            const CustomCheckoutTile(
              text: "Customs",
              value: true,
            ),
            const Visibility(
                child: Column(
              children: [
                CustomCheckoutTile(
                  text: "Saturday",
                  value: true,
                ),
                CustomCheckoutTile(
                  text: "Sunday",
                  value: false,
                ),
                CustomCheckoutTile(
                  text: "Monday",
                  value: false,
                ),
                CustomCheckoutTile(
                  text: "Tuesday",
                  value: false,
                ),
                CustomCheckoutTile(
                  text: "Wednesday",
                  value: false,
                ),
                CustomCheckoutTile(
                  text: "Thursday",
                  value: false,
                ),
                CustomCheckoutTile(
                  text: "Friday",
                  value: true,
                ),
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              title: Text("Business Documents",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.info),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            child: const Icon(Icons.add),
                          ),
                          const Icon(Icons.delete)
                        ],
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AlignedContainer(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Upload Documents",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.cloud_upload_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 300, height: 60),
                  child: CustomButton(
                      shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)))),
                      onTap: () {},
                      text: "Confirm my Application")),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
