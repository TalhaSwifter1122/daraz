import 'package:daraz_web/asset%20helper/asset_helper.dart';
import 'package:daraz_web/view_model.dart/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProductViewModel>();

    return Container(
      height: MediaQuery.sizeOf(context).height * 0.35,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              darazIcon,
              height: MediaQuery.sizeOf(context).height * 0.15,
              width: MediaQuery.sizeOf(context).width,
            ),
            ResponsiveTextWidget(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    darazLogo,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: TextField(
                      onChanged: (query) => viewModel.updateSearchQuery(query),
                      style: const TextStyle(color: Colors.white), // Text color
                      decoration: const InputDecoration(
                        hintText: "Search products...",
                        hintStyle:
                            TextStyle(color: Colors.white), // Hint text color
                        iconColor: Colors.white, // Icon color
                        prefixIconColor: Colors.white, // Prefix icon color
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors
                            .transparent, // Make the background transparent if needed
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white), // Border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .white), // Border color for enabled state
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .white), // Border color for focused state
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.insert_emoticon_sharp,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust font size based on screen width
    double fontSize;
    if (screenWidth < 400) {
      fontSize = 14; // Small devices
    } else if (screenWidth < 800) {
      fontSize = 18; // Medium devices
    } else {
      fontSize = 24; // Large devices
    }

    return Text(
      "E-Commerce By Maqsood Lab",
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
