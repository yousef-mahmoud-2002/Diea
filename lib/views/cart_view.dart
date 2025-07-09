import 'dart:io';
import 'package:diea/cubits/add_products/add_products_cubit.dart';
import 'package:diea/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:diea/constants.dart';
import 'package:diea/widgets/buttons/checkout_button.dart';
import 'package:diea/widgets/cart_widget/delete_cart.dart';
import 'package:diea/widgets/listviews/cart_items_listview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        foregroundColor: kPrimaryColor,
        backgroundColor: Colors.white,
        title: const Text(
          'الفاتورة',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            color: kSecondaryColor,
            Icons.arrow_back,
            size: 32,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: DeleteCartItem(),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: Divider(height: 1, color: kPrimaryColor, thickness: 0.7),
        ),
      ),
      body: const CartItemsListView(),
      bottomNavigationBar: CheckoutButton(
        onPressed: () async {
          if (context.read<AddProductsCubit>().customerName != '' &&
              context.read<AddProductsCubit>().areaName != '') {
            generateArabicOrderPdf(
              customerName: context.read<AddProductsCubit>().customerName,
              areaName: context.read<AddProductsCubit>().areaName,
              cartItems: context.read<AddProductsCubit>().cartItems,
              context: context,
            );
          } else {
            showTopSnackBar(
              Overlay.of(context),
              dismissType: DismissType.onSwipe,
              displayDuration: const Duration(milliseconds: 500),
              animationDuration: const Duration(milliseconds: 600),
              reverseAnimationDuration: const Duration(milliseconds: 400),
              const CustomSnackBar.success(
                backgroundColor: Colors.red,
                icon: Icon(Icons.done, size: 0),
                message: 'الرجاء ادخال اسم  العميل و المنطقة',
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> generateArabicOrderPdf({
    required String customerName,
    required String areaName,
    required List<CartItemModel> cartItems,
    required BuildContext context,
  }) async {
    final pdf = pw.Document();
    final fontData = await rootBundle.load("assets/fonts/Cairo-Regular.ttf");
    final arabicFont = pw.Font.ttf(fontData);

    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final dayOfWeek = DateFormat('EEEE', 'ar').format(now);

    final totalPrice = cartItems.fold<double>(
        0,
        (sum, item) =>
            sum + (double.parse(item.price) * int.parse(item.quantity)));

    pdf.addPage(
      pw.Page(
        theme: pw.ThemeData.withFont(
          base: arabicFont,
          bold: arabicFont,
          italic: arabicFont,
          boldItalic: arabicFont,
        ),
        pageFormat: PdfPageFormat.a4,
        textDirection: pw.TextDirection.rtl,
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(
                  'الضياء',
                  style: const pw.TextStyle(
                    color: PdfColors.deepOrange,
                    fontSize: 22.0,
                  ),
                ),
                pw.SizedBox(width: 6.0),
                pw.Text(
                  'لمواد البناء',
                  style: const pw.TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
            pw.Text('السيد/السادة : $customerName',
                style: const pw.TextStyle(fontSize: 14)),
            pw.Text('المنطقة : $areaName',
                style: const pw.TextStyle(fontSize: 14)),
            pw.Text('التاريخ : $formattedDate ( $dayOfWeek )',
                style: const pw.TextStyle(fontSize: 12)),
            pw.Text('الساعة : ${DateFormat('mm : h  a', 'ar').format(now)}',
                style: const pw.TextStyle(fontSize: 12)),
            pw.SizedBox(height: 20),
            pw.TableHelper.fromTextArray(
              headers: ['المجموع (د.أ)', 'السعر (د.أ)', 'الكمية', 'وصف المادة'],
              data: cartItems
                  .map((item) => [
                        item.totalPrice.toStringAsFixed(2),
                        item.price,
                        item.quantity.toString(),
                        item.name,
                      ])
                  .toList(),
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              border: pw.TableBorder.all(),
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey300),
              cellAlignment: pw.Alignment.center,
            ),
            pw.TableHelper.fromTextArray(
              headers: ['الإجمالي : ${totalPrice.toStringAsFixed(2)} د.أ'],
              data: [[]],
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              border: pw.TableBorder.all(),
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey100),
              cellAlignment: pw.Alignment.center,
            ),
          ],
        ),
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File(
        "${dir.path}/طلب : $customerName _ $areaName _ $formattedDate.pdf");
    await file.writeAsBytes(await pdf.save());

    final params = ShareParams(
      files: [XFile(file.path)],
    );

    await SharePlus.instance.share(params);

    if (context.mounted) {
      context.read<AddProductsCubit>().deleteCart();
      context.read<AddProductsCubit>().customerName = '';
      context.read<AddProductsCubit>().areaName = '';
    }
  }
}
