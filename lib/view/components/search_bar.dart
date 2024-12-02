// import 'package:daraz_web/view_model.dart/product_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FiltersSection extends StatelessWidget {
//   const FiltersSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = context.watch<ProductViewModel>();

//     return Container(
//       width: MediaQuery.of(context).size.width < 900
//           ? MediaQuery.of(context).size.width / 2
//           : MediaQuery.of(context).size.width / 6,
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Filters',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           const SizedBox(height: 8),
//           Expanded(
//             child: ListView.builder(
//               itemCount: viewModel.filters.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.only(bottom: 8),
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.grey[100],
//                   ),
//                   child: Row(
//                     children: [
//                       Checkbox(
//                         value: viewModel.selectedFilters[index],
//                         activeColor: Colors.orange,
//                         onChanged: (bool? value) {
//                           viewModel.updateFilterSelection(
//                               index, value ?? false);
//                         },
//                       ),
//                       const SizedBox(width: 18),
//                       Text(
//                         viewModel.filters[index],
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
