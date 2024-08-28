import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController? _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _textController!.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    DarkThemeProvider darkThemeProvider =
        Provider.of<DarkThemeProvider>(context);
    return Container(
      color: darkThemeProvider.darkTheme ? Colors.grey[200] : Colors.white,
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width,
      child: Form(
        child: TextFormField(
          controller: _textController,
          focusNode: _focusNode,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            filled: true,
            hintStyle: const TextStyle(color: Color(0xFF757575)),
            fillColor: const Color(0xFF979797).withOpacity(0.1),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: Colors.green),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Color(0xFF979797)),
            ),
            hintText: "Search product",
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _textController!.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _textController.clear();
                      _focusNode.unfocus();
                      setState(() {});
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
