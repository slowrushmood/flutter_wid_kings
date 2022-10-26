// import 'package:flutter/material.dart';

// class Modal {
//   static open(
//     BuildContext context,
//     Widget sheet, {
//     bool isScrollControlled = false,
//   }) {
//     showModalBottomSheet(
//       isScrollControlled: isScrollControlled,
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       backgroundColor: Colors.transparent,
//       builder: (context) => sheet,
//     );
//   }
// }

import 'package:flutter/material.dart';

class Modal {
  static open(
    BuildContext context,
    Widget sheet, {
    bool isScrollControlled = false,
  }) {
    showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) => sheet,
    );
  }
}
