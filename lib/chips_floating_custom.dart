
///
/// Autor: Rodrigo Vidal Canales
/// GitHub: [vidal1101](https://github.com/vidal1101)
/// 
/// 

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


/// Un widget personalizado para mostrar y gestionar palabras clave en forma de burbujas flotantes.
///
/// [ChipsFloating] es un widget que te permite mostrar una lista de palabras clave
/// como burbujas flotantes y permite a los usuarios agregar y eliminar palabras
/// clave según sea necesario.
///
/// Ejemplo de uso:
///
/// ```dart
/// ChipsFloating(
///   inputDecoration: InputDecoration(labelText: 'Etiqueta'),
///   controller: _controller,
///   keywords: _keywords,
///   maxKeywords: 5,
///   maxKeywordsToastMessage: 'Se alcanzó el límite máximo de palabras clave',
///   displayChipsBelow: true,
///   chipColor: Colors.green,
///   toastBackgroundColor: Colors.red,
///   toastTextColor: Colors.white,
/// )
/// ```

class ChipsFloating extends StatefulWidget {

  final InputDecoration inputDecoration;
  final TextEditingController controller;
  final bool displayChipsBelow;
  final Color chipColor;
  final int maxKeywords;
  final List<String> keywords;
  final String maxKeywordsToastMessage;
  final Color toastBackgroundColor;
  final Color toastTextColor;

  ChipsFloating({
    Key? key,
    required this.inputDecoration,
    required this.controller,
    required this.keywords,
    required this.maxKeywords,
    required this.maxKeywordsToastMessage,
    this.displayChipsBelow = false,
    this.chipColor = Colors.blueAccent,
    this.toastBackgroundColor = Colors.red,
    this.toastTextColor = Colors.white,
  }) : super(key: key);

  @override
  State<ChipsFloating> createState() => _ChipsFloatingState();
}

class _ChipsFloatingState extends State<ChipsFloating> {
  @override
  Widget build(BuildContext context) {
    return widget.displayChipsBelow
        ? Column(
            children: [
              _buildTextFormField(),
              _buildChips(),
            ],
          )
        : Column(
            children: [
              _buildChips(),
              _buildTextFormField(),
            ],
          );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: widget.controller,
      decoration: widget.inputDecoration,
      onChanged: (value) async {
        // Manejar cambios en el TextFormField si es necesario.
      },
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          if (widget.keywords.length < widget.maxKeywords) {
            setState(() {
              widget.keywords.add(value);
              widget.controller.clear();
            });
          } else {
            // Mostrar mensaje de límite máximo alcanzado usando FlutterToast.
            Fluttertoast.showToast(
              msg: widget.maxKeywordsToastMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: widget.toastBackgroundColor,
              textColor: widget.toastTextColor,
            );
          }
        }
      },
    );
  }

  Widget _buildChips() {
    return Wrap(
      children: widget.keywords.map((keyword) {
        return InputChip(
          label: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(keyword),
          ),
          onDeleted: () {
            setState(() {
              widget.keywords.remove(keyword);
            });
          },
          backgroundColor: widget.chipColor,
        );
      }).toList(),
    );
  }
}
