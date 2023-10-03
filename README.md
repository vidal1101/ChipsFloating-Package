

# ChipsFloating

[![pub package](https://img.shields.io/pub/v/chips_floating.svg)](https://pub.dev/packages/chips_floating)

ChipsFloating es un paquete Flutter que te permite mostrar y gestionar palabras clave en forma de burbujas flotantes en tus aplicaciones.

![Ejemplo de uso de ChipsFloating](example.gif)

## Instalación

Para utilizar ChipsFloating en tu proyecto Flutter, agrega la siguiente dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  chips_floating: ^1.1.0  
```

- Uso

Para utilizar ChipsFloating, simplemente agrega el widget a tu árbol de widgets y configura sus propiedades según sea necesario:


``` Dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ChipsFloating Example'),
        ),
        body: Center(
          child: ChipsFloating(
            inputDecoration: InputDecoration(
              labelText: 'Agregar palabra clave',
            ),
            controller: TextEditingController(),
            keywords: [], // Lista de palabras clave
            maxKeywords: 5, // Límite máximo de palabras clave
            maxKeywordsToastMessage: '¡Se alcanzó el límite máximo de palabras clave!',
            displayChipsBelow: true, // Muestra las burbujas debajo del campo de entrada
            chipColor: Colors.blueAccent, // Color de las burbujas
            toastBackgroundColor: Colors.red, // Color de fondo del mensaje de aviso
            toastTextColor: Colors.white, // Color del texto del mensaje de aviso
            deleteIconColorChip: Colors.black, // Color del icono de eliminación en las burbujas
            spacingChip: 8.0, // Espacio horizontal entre las burbujas
            runSpacingChip: 8.0, // Espacio vertical entre las burbujas
            elevationChip: 3, // Elevación de las burbujas
            spacingElement: 10, // Espacio vertical entre los elementos
            directionScroll: Axis.vertical, // Dirección de desplazamiento de las burbujas
            deleteIconChip: Icon(Icons.cancel), // Icono de eliminación en las burbujas
            textStyleChip: TextStyle(color: Colors.white), // Estilo de texto en las burbujas
            borderRadius: BorderRadius.circular(20.0), // Bordes redondos de las burbujas
          ),
        ),
      ),
    );
  }
}



```

# Características

- Muestra palabras clave como burbujas flotantes.
- Permite a los usuarios agregar y eliminar palabras clave.
- Personalización de colores y comportamiento.
- Limita el número de palabras clave que se pueden agregar.

# Contribución

¡Contribuciones son bienvenidas! Si deseas contribuir al desarrollo de ChipsFloating, por favor sigue estos pasos:

Fork el repositorio.
Clona tu fork: git clone https://github.com/tu_usuario/chips_floating.git.
Crea una nueva rama para tu contribución: git checkout -b mi-contribucion.
Realiza tus cambios y commit: git commit -m 'Añade una nueva característica'.
Empuja tus cambios a tu fork: git push origin mi-contribucion.
Crea una solicitud de extracción en el repositorio original.


Autor
    
    Rodrigo Vidal Canales
    GitHub: vidal1101

Licencia

Este paquete está disponible bajo la Licencia MIT. Consulta el archivo LICENSE para obtener más información.
Agradecimientos

Agradecimientos a la comunidad de Flutter y a todos los desarrolladores que contribuyen a hacer Flutter aún mejor.




