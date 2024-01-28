import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vendor/src/repository/offers/offer.dart';

class OfferInvoiceScreen extends ConsumerWidget {
  final int invoiceModelId;

  OfferInvoiceScreen({
    super.key,
    required this.invoiceModelId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoice =
        ref.watch(OfferRepository.offerInvoiceProviderFamily(invoiceModelId));

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: invoice.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Offer #${invoice.value!.proposal?.id}",
                          style: TextStyle(
                            fontSize: 21.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          toBeginningOfSentenceCase(
                                invoice.value!.proposal?.status,
                              ) ??
                              "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                            ),
                          ),
                          Text(
                            "${invoice.value!.total?.value} ${invoice.value!.currency}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.15.sw, vertical: 10.h),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text("User fees"),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            invoice.value!.fees!.wasphaFeesFrom?.user?.length ??
                                0,
                        itemBuilder: (context, index) {
                          final fee =
                              invoice.value!.fees!.wasphaFeesFrom!.user![index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                fee.label ?? "",
                              ),
                              Text(
                                "${fee.calculatedValue} ${invoice.value!.currency}",
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Text(
                            "${invoice.value!.subtotal} ${invoice.value!.currency}",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: invoice.value!.proposal!.item!.length,
                        itemBuilder: (context, index) {
                          final item = invoice.value!.proposal!.item![index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${item.quantity}x ${item.title} (${item.taxRatio}% tax)",
                              ),
                              Text(
                                "${invoice.value!.proposal!.item![index].totalPrice} ${invoice.value!.currency}",
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                      ),
                      invoice.value!.proposal?.type == "delivery"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 0.15.sw,
                                    right: 0.15.sw,
                                    bottom: 10.h,
                                  ),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery fees",
                                    ),
                                    Text(
                                      "${invoice.value!.delivery?.calculatedValue} ${invoice.value!.currency}",
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                () {
                                  final date = Duration(
                                      minutes: invoice.value!.proposal?.eta?.avg
                                              ?.toInt() ??
                                          0);
                                  final day = date.inDays;
                                  final hour = date.inHours - day * 24;
                                  final minute =
                                      date.inMinutes - (day * 24 + hour) * 60;
                                  String stringedDate = "";
                                  if (day > 0) stringedDate += "${day}d:";
                                  if (hour > 0) stringedDate += "${hour}h:";
                                  stringedDate += "${minute}m";
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("ETA"),
                                      Text(stringedDate),
                                    ],
                                  );
                                }(),
                                SizedBox(height: 15),
                              ],
                            )
                          : SizedBox(),
                      invoice.value!.proposal?.schedule?.isScheduled == true
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.15.sw, vertical: 10.h),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                    "Scheduled on ${invoice.value!.proposal!.schedule!.scheduledDeliveryTime}"),
                                SizedBox(height: 15),
                              ],
                            )
                          : SizedBox(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.15.sw, vertical: 10.h),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text("Vendor fees"),
                      // non scrollable listview on vendor's waspha fee
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: invoice
                                .value!.fees!.wasphaFeesFrom?.vendor?.length ??
                            0,
                        itemBuilder: (context, index) {
                          final fee = invoice
                              .value!.fees!.wasphaFeesFrom!.vendor![index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                fee.label ?? "",
                              ),
                              Text(
                                "${fee.calculatedValue} ${invoice.value!.currency}",
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.15.sw, vertical: 10.h),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You owe Waspha",
                          ),
                          Text(
                            "${invoice.value!.profit?.debit} ${invoice.value!.currency}",
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Waspha owes you",
                          ),
                          Text(
                            "${invoice.value!.profit?.credit} ${invoice.value!.currency}",
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Settlement",
                          ),
                          Text(
                            "${invoice.value!.profit?.settlement} ${invoice.value!.currency}",
                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total profit",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${invoice.value!.profit?.totalEarning} ${invoice.value!.currency}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
