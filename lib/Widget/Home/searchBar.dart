import 'package:flutter/material.dart';
import 'package:Dealings/MORE/Core/Constant/color.dart';

class SearchBar extends StatelessWidget {
  final String title;
  final void Function()? onPressedSearching;
  final void Function(String)? onChanged;
  final TextEditingController myController;

  const SearchBar({
    Key? key,
    required this.title,
    this.onPressedSearching,
    this.onChanged,
    required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        height: 40,
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: myController,
              onChanged: onChanged,
              cursorColor: ColorApp.intergalactic,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: ColorApp.intergalactic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: ColorApp.warmGray.withOpacity(0.4),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  hintText: title,
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: ColorApp.intergalactic,
                    ),
                    onPressed: onPressedSearching,

                  )),
            onEditingComplete:onPressedSearching,
            )),
          ],
        ));
  }
}
