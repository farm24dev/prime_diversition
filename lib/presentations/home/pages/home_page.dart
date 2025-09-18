import 'package:flutter/material.dart';
import 'package:prime_diversition/constants/app_text_styles.dart';
import 'package:prime_diversition/constants/colours.dart';
import 'package:prime_diversition/presentations/home/interfaces/prime_number_type.dart';
import 'package:prime_diversition/presentations/home/providers/home_page_provider.dart';
import 'package:prime_diversition/utils/input_formatters.dart';
import 'package:prime_diversition/widgets/button_custom.dart';
import 'package:prime_diversition/widgets/text_formfield_custom.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colours.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                const SizedBox(height: 16),
                Center(child: Image.asset('assets/images/img_logo.png', height: 70)),
                Center(
                  child: Text(
                    'Application ตรวจสอบ Prime Number',
                    style: AppTextStyles.medium.copyWith(fontSize: 20),
                  ),
                ),
                Consumer<HomePageProvider>(
                  builder: (context, provider, child) => Column(
                    spacing: 16,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: TextFormFieldCustom(
                              hintText: 'จำนวนที่ต้องการตรวจสอบ',
                              controller: provider.inputController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              inputFormatters: InputFormatters.digitsOnly,
                            ),
                          ),
                          if (!provider.isInputEmpty)
                            IconButton(
                              onPressed: () => provider.clearInput(),
                              icon: const Icon(
                                Icons.delete,
                                color: Colours.primary,
                              ),
                            )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ButtonCustom(
                          text: 'ตรวจสอบ',
                          onPressed: provider.isInputEmpty ? null : provider.checkPrimeNumber,
                        ),
                      ),
                      if (provider.primeNumberType != null)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ผลลัพธ์ : ',
                                  style: AppTextStyles.medium.copyWith(fontSize: 16),
                                ),
                                Text(
                                  provider.primeNumberType?.display ?? '-',
                                  style: AppTextStyles.medium.copyWith(fontSize: 16, color: provider.primeNumberType?.color),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'เวลาที่โปรแกรมใช้ในการคํานวน : ',
                                  style: AppTextStyles.medium.copyWith(fontSize: 16),
                                ),
                                Text(
                                  '${provider.timeCalculate} ms',
                                  style: AppTextStyles.medium.copyWith(fontSize: 16, color: Colours.primary),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
