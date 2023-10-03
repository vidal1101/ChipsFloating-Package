

# ChipsFloating

[![pub package](https://img.shields.io/pub/v/chips_floating.svg)](https://pub.dev/packages/chips_floating)

ChipsFloating es un paquete Flutter que te permite mostrar y gestionar palabras clave en forma de burbujas flotantes en tus aplicaciones.


![Ejemplo ](/assets/demo.jpeg)


## Instalación

Para utilizar ChipsFloating en tu proyecto Flutter, agrega la siguiente dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  chips_floating: ^1.2.2 
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
            fontSizeToast: 14, // Tamaño de fuente para el mensaje de aviso
            createTagOnSubmit: true, // Crear una etiqueta al enviar el formulario
            showSaveBotton: true, // Mostrar un botón de guardar
            textBotton: 'Agregar', // Texto del botón de guardar
            textStyleBotton: TextStyle(fontSize: 16), // Estilo de texto del botón de guardar
            heightBotton: 40, // Altura del botón de guardar
            widthBotton: 100, // Ancho del botón de guardar
            boxDecorationBotton: BoxDecoration(
              color: Colors.blue, // Color de fondo del botón de guardar
              borderRadius: BorderRadius.circular(10.0), // Bordes redondos del botón de guardar
            ),
            spacingTextBotton: 8, // Espacio vertical entre el campo de entrada y el botón de guardar
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


## Propiedades

El widget `ChipsFloating` admite las siguientes propiedades personalizables:

- `inputDecoration`: Configuración de decoración para el campo de entrada.
- `controller`: Controlador del campo de entrada.
- `displayChipsBelow`: Booleano que controla si las burbujas se muestran debajo del campo de entrada.
- `maxKeywords`: Límite máximo de palabras clave.
- `keywords`: Lista de palabras clave.
- `maxKeywordsToastMessage`: Mensaje que se muestra cuando se alcanza el límite máximo de palabras clave.
- `toastBackgroundColor`: Color de fondo del mensaje de aviso.
- `toastTextColor`: Color del texto del mensaje de aviso.
- `deleteIconColorChip`: Color del icono de eliminación en las burbujas.
- `chipColor`: Color de las burbujas.
- `spacingChip`: Espacio horizontal entre las burbujas.
- `runSpacingChip`: Espacio vertical entre las burbujas si hay múltiples filas.
- `elevationChip`: Elevación de las burbujas.
- `spacingElement`: Espacio vertical entre los elementos.
- `directionScroll`: Dirección de desplazamiento de las burbujas.
- `deleteIconChip`: Icono de eliminación en las burbujas.
- `textStyleChip`: Estilo de texto en las burbujas.
- `fontSizeToast`: Tamaño de fuente para el mensaje de aviso.
- `createTagOnSubmit`: Booleano que controla si se crea una etiqueta al enviar el formulario.
- `showSaveBotton`: Booleano que controla si se muestra un botón de guardar.
- `textBotton`: Texto del botón de guardar.
- `textStyleBotton`: Estilo de texto del botón de guardar.
- `heightBotton`: Altura del botón de guardar.
- `widthBotton`: Ancho del botón de guardar.
- `boxDecorationBotton`: Decoración del botón de guardar.

Asegúrate de personalizar estas propiedades según tus necesidades específicas en tu aplicación Flutter.


# Contribución

¡Contribuciones son bienvenidas! Si deseas contribuir al desarrollo de ChipsFloating, por favor sigue estos pasos:

Fork el repositorio.
Clona tu fork: git clone https://github.com/vidal1101/chips_floating.git.
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




