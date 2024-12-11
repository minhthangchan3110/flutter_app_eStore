import 'package:flutter/material.dart';

class HorizontalList<T> extends StatelessWidget {
  final List<T>? items;
  final T selected;
  final String Function(T) itemToString;
  final void Function(T) onSelect;

  const HorizontalList(
      {super.key,
      this.items,
      required this.itemToString,
      required this.selected,
      required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items?.length ?? 0,
          itemBuilder: (context, index) {
            T item = items![index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ChoiceChip(
                label: Text(
                  itemToString(item),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: selected == item
                        ? Colors.white
                        : Colors.black, // Màu chữ
                  ),
                ),
                selected: selected == item,
                onSelected: (bool selected) {
                  onSelect(item);
                },

                side: BorderSide.none,
                backgroundColor: Colors.white,
                selectedColor: Colors.black,
                elevation: 5, // Thêm shadow
                shadowColor: Colors.grey.withOpacity(0.5), // Màu shadow
                pressElevation: 8, // Shadow khi được nhấn
                showCheckmark: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
