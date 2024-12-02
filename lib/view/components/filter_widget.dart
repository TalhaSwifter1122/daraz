import 'package:daraz_web/view_model.dart/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersSection extends StatelessWidget {
  const FiltersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();

    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive font size
    double titleFontSize =
        screenWidth < 600 ? 14 : 16; // Smaller font for smaller screens
    double filterFontSize =
        screenWidth < 600 ? 12 : 14; // Smaller font for filter items

    // Define responsive padding
    double containerPadding = screenWidth < 600 ? 12 : 16;
    double itemPadding = screenWidth < 600 ? 0 : 0;

    return Container(
      width: screenWidth < 900
          ? screenWidth / 2 // 50% width for small screens
          : screenWidth / 6, // 1/6 width for larger screens
      padding: EdgeInsets.all(containerPadding), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filters',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize, // Responsive title font size
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.filters.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding:
                      EdgeInsets.all(itemPadding), // Responsive item padding
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: viewModel.selectedFilters[index],
                        activeColor: Colors.orange,
                        onChanged: (bool? value) {
                          viewModel.updateFilterSelection(
                              index, value ?? false);
                        },
                      ),
                      const SizedBox(width: 18),
                      Text(
                        viewModel.filters[index],
                        style: TextStyle(
                            fontSize:
                                filterFontSize), // Responsive filter font size
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
