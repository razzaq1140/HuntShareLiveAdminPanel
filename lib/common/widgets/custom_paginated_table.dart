// custom_paginated_table.dart
import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';

class CustomPaginatedTable<T> extends StatefulWidget {
  final List<T> data;
  final List<String> headers;
  final int initialRowsPerPage;
  final ValueChanged<int>? onPageChanged;
  final void Function(int rowsPerPage)? onRowsPerPageChanged;
  final Widget Function(T item) rowBuilder;
  final Color borderColor;
  final Color selectedButtonColor;
  final Color unSelectedButtonColor;

  const CustomPaginatedTable({
    Key? key,
    required this.data,
    required this.headers,
    required this.rowBuilder,
    this.initialRowsPerPage = 5,
    this.onPageChanged,
    this.onRowsPerPageChanged,
    this.borderColor = Colors.grey,
    this.selectedButtonColor = Colors.blue,
    this.unSelectedButtonColor = Colors.white,
  }) : super(key: key);

  @override
  _CustomPaginatedTableState<T> createState() =>
      _CustomPaginatedTableState<T>();
}

class _CustomPaginatedTableState<T> extends State<CustomPaginatedTable<T>> {
  int _currentPage = 1;
  late int _rowsPerPage;

  @override
  void initState() {
    super.initState();
    _rowsPerPage = widget.initialRowsPerPage;
  }

  @override
  Widget build(BuildContext context) {
    final startIndex = (_currentPage - 1) * _rowsPerPage;
    final endIndex = startIndex + _rowsPerPage;
    final paginatedData = widget.data.sublist(
        startIndex, endIndex > widget.data.length ? widget.data.length : endIndex);

    return Column(
      children: [
        // Header Row
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: widget.borderColor.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.headers
                .map((header) => Expanded(
                      child: Center(
                        child: Text(
                          header,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.borderColor,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        // Data Rows
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: paginatedData
                .map((item) => widget.rowBuilder(item))
                .toList(),
          ),
        ),
        // Pagination and Rows per Page Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text("Show Rows: "),
                DropdownButton<int>(
                  value: _rowsPerPage,
                  items: [5, 10, 15, 20].map((rows) {
                    return DropdownMenuItem(
                      value: rows,
                      child: Text("$rows Rows"),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _rowsPerPage = newValue!;
                      _currentPage = 1;
                    });
                    if (widget.onRowsPerPageChanged != null) {
                      widget.onRowsPerPageChanged!(_rowsPerPage);
                    }
                  },
                ),
              ],
            ),
            NumberPagination(
              totalPages: (widget.data.length / _rowsPerPage).ceil(),
              currentPage: _currentPage,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
                if (widget.onPageChanged != null) {
                  widget.onPageChanged!(page);
                }
              },
              selectedButtonColor: widget.selectedButtonColor,
              unSelectedButtonColor: widget.unSelectedButtonColor,
            ),
          ],
        ),
      ],
    );
  }
}
