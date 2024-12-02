import 'package:daraz_web/view/components/filter_widget.dart';
import 'package:daraz_web/view/components/grid_view.dart';
import 'package:daraz_web/view/components/header_widget.dart';
import 'package:flutter/material.dart';

class ECommerceHomePage extends StatelessWidget {
  const ECommerceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600; // Mobile screens
    final isTablet = screenWidth >= 600 && screenWidth < 1100; // Tablet screens
    final isDesktop = screenWidth >= 1100; // Desktop screens

    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          const SizedBox(height: 16),
          Expanded(
            child: isMobile
                ? const Column(
                    children: [
                      // Filters on top for mobile
                      SizedBox(height: 200, child: FiltersSection()),
                      SizedBox(height: 8),
                      // Product grid expanded to fill remaining space
                      Expanded(
                        child: ProductGridWidget(
                          crossAxisCount: 1,
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      // Filters on the side for larger screens
                      const FiltersSection(),
                      // Product grid expanded to fill remaining space
                      Expanded(
                        child: ProductGridWidget(
                          crossAxisCount: isTablet ? 2 : 4,
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
