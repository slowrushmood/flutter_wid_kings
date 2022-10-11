import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterwidgets/save%20data%20locally/model/localstorage.dart';
import 'package:flutterwidgets/save%20data%20locally/util/mediaquery.dart';
import 'package:flutterwidgets/save%20data%20locally/view/viewmodel.dart';
import 'package:flutterwidgets/widgets/input_field.dart';

class AddQoute extends ConsumerWidget {
  const AddQoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
  const QouteBody({super.key, this.localStorage});
  final LocalStrorage? localStorage;

  @override
  State<QouteBody> createState() => _QouteBodyState();
}

class _QouteBodyState extends State<QouteBody> {
  late TextEditingController _quoteController;

  @override
  void initState() {
    _quoteController = TextEditingController(
        text: widget.localStorage == null
            ? null
            : '${widget.localStorage}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, __) {
      final provider = ref.read(quoteViewModelProvider);

      return SingleChildScrollView(
        child: CustomTextField(
          borderRadius: 0,
          maxLines: 7,
          padding: const EdgeInsets.symmetric(vertical: 20),
          fontSize: 25,
          keyboardType: TextInputType.multiline,
          fillColor: Colors.blue.shade500,
          hint: '"Inspire Yourself"',
          controller: _quoteController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              provider.checkAndSaveInput(
                  editQuote: _quoteController.text,
                  existingQuote:
                      widget.localStorage == null ? '' : widget.localStorage!.paragraph);
            }
          },
        ),
      );
    });
  }
}

class SaveQouteBtn extends StatelessWidget {
  const SaveQouteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, __) {
      final provider = ref.watch(quoteViewModelProvider);

      return Opacity(
        opacity: provider.canSave ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          alignment: Alignment.centerLeft,
          child: SizedBox.fromSize(
            size: const Size(100, 50),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.5))),
              onPressed: provider.canSave
                  ? () async{
                      
                    await  provider.saveQuote(quote: provider.myQuote).whenComplete(() => Navigator.pop(context));
                    }
                  : null,
              child: const Text(
                'save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    });
  }
}
