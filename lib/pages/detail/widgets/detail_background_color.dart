import 'package:fluent_ui/fluent_ui.dart';

class DetailBackgroundColor extends StatefulWidget {
  const DetailBackgroundColor({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ScrollController controller;

  @override
  State<DetailBackgroundColor> createState() => _DetailBackgroundColorState();
}

class _DetailBackgroundColorState extends State<DetailBackgroundColor> {
  double scrollOffset = 0;
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        scrollOffset = widget.controller.offset;
        if (scrollOffset >= 255) {
          scrollOffset = 255;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(scrollOffset.round(), 249, 249, 249),
            const Color.fromARGB(255, 243, 243, 243),
            const Color.fromARGB(255, 243, 243, 243),
          ],
        ),
      ),
    );
  }
}
