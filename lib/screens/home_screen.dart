import 'package:flutter/material.dart';
import '../models/lugar_turistico.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String categoriaSeleccionada = 'Todos';
  String textoBusqueda = '';
  final List<String> categorias = ['Todos', 'Monumentos', 'Natural', 'Playas'];

  @override
  Widget build(BuildContext context) {
    // 1. Filtramos primero por categoría
    var lugaresFiltrados = categoriaSeleccionada == 'Todos'
        ? listaLugares
        : listaLugares.where((l) => l.categoria == categoriaSeleccionada).toList();

    // 2. Filtramos también por lo que el usuario escriba en la barra de búsqueda
    if (textoBusqueda.isNotEmpty) {
      lugaresFiltrados = lugaresFiltrados.where((l) {
        final nombreLower = l.nombre.toLowerCase();
        final descLower = l.descripcionCorta.toLowerCase();
        final catLower = l.categoria.toLowerCase();
        final query = textoBusqueda.toLowerCase();

        // Busca coincidencia en el nombre, descripción o categoría 
        return nombreLower.contains(query) || 
               descLower.contains(query) || 
               catLower.contains(query);
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Descubre Destinos'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.explore),
            onPressed: () {
              // Acción de perfil
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda funcional
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (valor) {
                setState(() {
                  textoBusqueda = valor; // Actualiza el texto de búsqueda
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar lugares, playas, monumentos...',
                prefixIcon: const Icon(Icons.search, color: Colors.teal),
                suffixIcon: textoBusqueda.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            textoBusqueda = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          // Categorías o filtros (Chips)
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final cat = categorias[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: categoriaSeleccionada == cat,
                    selectedColor: Colors.teal[200],
                    onSelected: (selected) {
                      setState(() {
                        categoriaSeleccionada = cat;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // Lista dinámica de elementos filtrados
          Expanded(
            child: lugaresFiltrados.isEmpty
                ? const Center(
                    child: Text(
                      'No se encontraron destinos',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: lugaresFiltrados.length,
                    itemBuilder: (context, index) {
                      final lugar = lugaresFiltrados[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(lugar: lugar),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: Hero(
                                  tag: lugar.id,
                                  child: Image.network(
                                    lugar.imagenUrl,
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      lugar.nombre,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      lugar.descripcionCorta,
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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