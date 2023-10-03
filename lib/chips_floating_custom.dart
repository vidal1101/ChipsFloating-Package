

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
/// import 'package:flutter/material.dart';
///
/// void main() => runApp(MyApp());
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       home: Scaffold(
///         appBar: AppBar(
///           title: Text('ChipsFloating Example'),
///         ),
///         body: Center(
///           child: ChipsFloating(
///             inputDecoration: InputDecoration(
///               labelText: 'Agregar palabra clave',
///             ),
///             controller: TextEditingController(),
///             keywords: [], // Lista de palabras clave
///             maxKeywords: 5, // Límite máximo de palabras clave
///             maxKeywordsToastMessage: '¡Se alcanzó el límite máximo de palabras clave!',
///             displayChipsBelow: true, // Muestra las burbujas debajo del campo de entrada
///             chipColor: Colors.blueAccent, // Color de las burbujas
///             toastBackgroundColor: Colors.red, // Color de fondo del mensaje de aviso
///             toastTextColor: Colors.white, // Color del texto del mensaje de aviso
///             deleteIconColorChip: Colors.black, // Color del icono de eliminación en las burbujas
///             spacingChip: 8.0, // Espacio horizontal entre las burbujas
///             runSpacingChip: 8.0, // Espacio vertical entre las burbujas
///             elevationChip: 3, // Elevación de las burbujas
///             spacingElement: 10, // Espacio vertical entre los elementos
///             directionScroll: Axis.vertical, // Dirección de desplazamiento de las burbujas
///             deleteIconChip: Icon(Icons.cancel), // Icono de eliminación en las burbujas
///             textStyleChip: TextStyle(color: Colors.white), // Estilo de texto en las burbujas
///             borderRadius: BorderRadius.circular(20.0), // Bordes redondos de las burbujas
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
///
/// Asegúrate de personalizar y expandir esta documentación según tus necesidades y requerimientos específicos.


class ChipsFloating extends StatefulWidget {

  final InputDecoration inputDecoration;
  final TextEditingController controller;
  final bool displayChipsBelow;
  final int maxKeywords;
  final List<String> keywords;
  final String maxKeywordsToastMessage;
  final Color toastBackgroundColor;
  final Color toastTextColor;
  final Color deleteIconColorChip;
  final Color chipColor;
  final double spacingChip;
  final double runSpacingChip;
  final BorderRadiusGeometry borderRadius;
  final double elevationChip;
  final double spacingElement;
  final Axis directionScroll;
  final Widget deleteIconChip;
  final TextStyle textStyleChip;
  final double fontSizeToast;
  final bool createTagOnSubmit;
  final bool showSaveBotton;
  final double spacingTextBotton;
  final double heightBotton;
  final double widthBotton;
  final BoxDecoration? boxDecorationBotton;
  final String textBotton;
  final TextStyle? textStyleBotton;

  ChipsFloating({
    Key? key,
    required this.inputDecoration,
    required this.controller,
    required this.keywords,
    required this.maxKeywords,
    required this.maxKeywordsToastMessage,
    required this.borderRadius,
    required this.deleteIconChip,
    required this.textStyleChip ,
    this.displayChipsBelow = false,
    this.chipColor = Colors.blueAccent,
    this.toastBackgroundColor = Colors.red,
    this.toastTextColor = Colors.white,
    this.deleteIconColorChip = Colors.black,
    this.spacingChip = 8.0,
    this.runSpacingChip = 8.0, 
    this.elevationChip = 3, 
    this.spacingElement = 10,
    this.fontSizeToast = 14, 
    this.createTagOnSubmit = true,
    this.showSaveBotton = true,
    this.textBotton = 'Agregar',
    this.textStyleBotton,
    this.heightBotton = 40, 
    this.widthBotton = 100, 
    this.boxDecorationBotton ,
    this.spacingTextBotton = 10,
    this.directionScroll = Axis.vertical ,//elemento aun no aplica.

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
              SizedBox(height: widget.spacingElement ,),
              _buildChips(),
            ],
          )
        : Column(
            children: [
              _buildChips(),
              SizedBox(height: widget.spacingElement ,),
              _buildTextFormField(),
            ],
          );
  }

  Widget _buildTextFormField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //texto de la palabra clave.
        TextFormField(
          controller: widget.controller,
          decoration: widget.inputDecoration,
          onChanged: (value) async {
            // Manejar cambios en el TextFormField si es necesario.
          },
          onFieldSubmitted: (widget.createTagOnSubmit) ? 
            (value) => _addWord(value): null,
        ),
        //boton de guardado.
        SizedBox(height: widget.spacingTextBotton,),
        if(widget.showSaveBotton)
          GestureDetector(
            onTap: () => _addWord(widget.controller.text),
            child: Container(
              height: widget.heightBotton,
              width: widget.widthBotton,
              decoration: widget.boxDecorationBotton,
              child: Center(
                child: Text( widget.textBotton, 
                  style: widget.textStyleBotton,),
              ),
            ),
          ),

      ],
    );
  }

  void _addWord(String value)async{
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
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: widget.toastBackgroundColor,
          textColor: widget.toastTextColor,
          fontSize: widget.fontSizeToast,
        );
      }
    }
  }

  Widget _buildChips() {
    return Wrap(
      spacing: widget.spacingChip, // Espacio horizontal entre los InputChips
      runSpacing: widget.runSpacingChip, // Espacio vertical entre los InputChips si hay múltiples filas
      children: widget.keywords.map((keyword) {
        return InputChip(
          deleteIcon: widget.deleteIconChip,
          deleteIconColor: widget.deleteIconColorChip,
          shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius // Bordes redondos
          ),
          elevation: widget.elevationChip, // Agregar sombra
          label: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(keyword, style:  widget.textStyleChip,),
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
