import 'package:flutter/material.dart';
import 'package:flutterwidgets/save%20data%20locally/util/mediaquery.dart';
import 'package:flutterwidgets/widgets/input_field.dart';

class AddQoute extends StatelessWidget {
  const AddQoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fullHeight(context) * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue.shade500,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: const [
          Expanded(
            child: ActionBar(),
          ),
          Expanded(
            flex: 7,
            child: QouteBody(),
          ),
          SaveQouteBtn(),
        ],
      ),
    );
  }
}

//* action bar
class ActionBar extends StatelessWidget {
  const ActionBar({super.key, this.title = 'Add Qoute'});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        Text(title),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.ios_share_rounded,
            size: 16,
          ),
        ),
      ]),
    );
  }
}

//* qoute body and edit widget
class QouteBody extends StatefulWidget {
  const QouteBody({super.key});

  @override
  State<QouteBody> createState() => _QouteBodyState();
}

class _QouteBodyState extends State<QouteBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomTextField(
        borderRadius: 0,
        maxLines: 7,
        padding: const EdgeInsets.all(10),
        fillColor: Colors.blue.shade500,
        hint: '"Inspire Yourself"',
        fontSize: 25,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}

class SaveQouteBtn extends StatelessWidget {
  const SaveQouteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.centerLeft,
      child: SizedBox.fromSize(
        size: const Size(100, 50),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.5))),
          onPressed: () {},
          child: const Text(
            'save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
