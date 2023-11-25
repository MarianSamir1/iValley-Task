import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivally_task/app/model/car_model.dart';
import 'package:ivally_task/utilities/components/custom_text.dart';
import 'package:ivally_task/utilities/components/toast.dart';
import 'package:ivally_task/utilities/constants/end_points.dart';
import 'package:ivally_task/utilities/styles/colors.dart';
import 'package:ivally_task/utilities/styles/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CarCardWidget extends StatelessWidget {
  final CarModel? carModel;
  const CarCardWidget({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 175.h,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(14.r),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Row(
            children: [
              //========================= car image =========================
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    EndPoints.baseUrl + carModel!.mainImagePath!,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    errorBuilder: (c, o, t) => Container(),
                  ),
                ),
              ),
              //========================= car data ==========================
              SizedBox(width: 8.w),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //==================== phone ===== model - name row ============================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "${carModel!.brandName} - ${carModel!.model}",
                          fontSize: FontManager.font14,
                          color: ColorManager.grey,
                        ),
                        InkWell(
                          onTap: () async {
                            if (carModel!.phone != null) {
                              await launch("tel:${carModel!.phone}");
                            } else {
                              showToast(
                                msg: "لا يوجد رقم هاتف",
                                state: ToastStates.ERROR,
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: ColorManager.black,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Icon(
                              Icons.phone_enabled_rounded,
                              color: ColorManager.white,
                              size: 17.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //==================== price , mainTitle , discription , model  ================
                    CustomText(
                      text: "${carModel!.price!} ريال",
                      color: ColorManager.amber,
                      fontSize: FontManager.font15,
                    ),
                    CustomText(
                      text: carModel!.mainTitle!,
                      color: ColorManager.darkGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: FontManager.font16,
                    ),
                    SizedBox(height: 5.h),
                    if (carModel!.description != null)
                      CustomText(
                        text: "السياره: ${carModel!.description}",
                        maxLines: 1,
                        fontSize: FontManager.font14,
                        color: ColorManager.grey,
                      ),
                    if (carModel!.model != null)
                      CustomText(
                        text: "الموديل: ${carModel!.model}",
                        maxLines: 1,
                        fontSize: FontManager.font14,
                        color: ColorManager.grey,
                      ),
                    //======================== loaction row ==============================
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: ColorManager.red,
                          size: 20.r,
                        ),
                        CustomText(
                          text: carModel!.cityName!,
                          fontSize: FontManager.font13,
                          color: ColorManager.darkBlue,
                        ),
                        CustomText(
                          text: " | منذ ${carModel!.hours} ساعات",
                          fontSize: FontManager.font13,
                          color: ColorManager.grey,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(width: 8.w),
            ],
          ),
        ),
      ),
    );
  }
}
