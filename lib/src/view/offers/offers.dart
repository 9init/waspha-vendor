import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/offer/offer_model.dart';
import 'package:vendor/src/repository/offers/offer.dart';
import 'package:vendor/src/view/common/profile_app_bar/profile_app_bar.dart';
import 'package:vendor/src/view/offers/offer_item.dart';

class OffersScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offersState = useState(OfferStatus.active);
    final offers =
        ref.watch(OfferRepository.offersProviderFamily(offersState.value));

    return Scaffold(
      appBar: ProfileAppBar(title: "Offers"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicWidth(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Consumer(
                    builder: (context, ref, child) => SizedBox(
                      height: 42,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: offersState.value.name,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Active",
                                style: TextStyle(color: Colors.white),
                              ),
                              value: "active",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Inactive",
                                style: TextStyle(color: Colors.white),
                              ),
                              value: "inactive",
                            ),
                          ],
                          onChanged: (v) async {
                            offersState.value = v == "active"
                                ? OfferStatus.active
                                : OfferStatus.inactive;
                            ref.invalidate(OfferRepository.offersProviderFamily(
                                offersState.value));
                          },
                          dropdownColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              if (!offers.isLoading && offers.value != null)
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: offers.value!.length,
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemBuilder: (context, index) =>
                      OfferItem(offer: offers.value![index]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
