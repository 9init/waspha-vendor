import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/driver/driver_model.dart';
import 'package:vendor/src/repository/carriers/carriers.dart';
import 'package:vendor/src/routes/routes_names.dart';
import 'package:vendor/src/view/common/carrier_item/carrier_item.dart';

class Carrier extends ConsumerWidget {
  Carrier({super.key, required this.driverType});

  final DriverType driverType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeDrivers = ref.watch(CarriersRepository.storeDriverProvider(driverType));
    debugPrint('The Driver Type Is $driverType');
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            driverType == DriverType.ONLINE
                ? context.localization.online_carriers
                : context.localization.offline_carriers,
            style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () =>
                  context.push(RoutesNames.addNewDriver, extra: driverType),
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          storeDrivers.isLoading || storeDrivers.value == null
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 190.w, right: 40.w),
                        child: Divider(color: Colors.grey[200]),
                      );
                    },
                    itemCount: storeDrivers.value!.length,
                    itemBuilder: (context, index) {
                      return CarrierItem(
                        driverModel: storeDrivers.value![index],
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
