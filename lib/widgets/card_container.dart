import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final DialogCard card;

  const CardContainer({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (card.imageUri != null)
            Container(
              constraints: const BoxConstraints.expand(height: 150),
              child: Image.network(
                card.imageUri!,
                fit: BoxFit.cover,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  card.title ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (card.subtitle != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      card.subtitle!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                if (card.buttons?.isNotEmpty ?? false)
                  Container(
                    constraints: const BoxConstraints(
                      maxHeight: 40,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        CardButton button = card.buttons![i];
                        return TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(button.text ?? ''),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(button.postback ?? ''),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (_, i) => Container(width: 10),
                      itemCount: card.buttons!.length,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
