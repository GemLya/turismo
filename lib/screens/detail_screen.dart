import 'package:flutter/material.dart';

import '../models/lugar_turistico.dart';

class DetailScreen extends StatefulWidget {
  final LugarTuristico lugar;

  const DetailScreen({super.key, required this.lugar});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool esFavorito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen destacada con efecto Hero y botón de retroceso
            Stack(
              children: [
                Hero(
                  tag: widget.lugar.id,
                  child: Image.asset(
                    widget.lugar.imagenUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título y Categoría
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.lugar.nombre,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          esFavorito ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            esFavorito = !esFavorito;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(widget.lugar.categoria),
                    backgroundColor: Colors.teal[50],
                  ),
                  const SizedBox(height: 16),

                  // Bloques de información (Iconos informativos)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoItem(
                        Icons.star,
                        '${widget.lugar.calificacion}',
                        'Calificación',
                      ),
                      _buildInfoItem(
                        Icons.access_time,
                        widget.lugar.duracionEstimada,
                        'Duración',
                      ),
                      _buildInfoItem(
                        Icons.attach_money,
                        widget.lugar.precio == 0
                            ? 'Gratis'
                            : '\$${widget.lugar.precio}',
                        'Precio',
                      ),
                    ],
                  ),
                  const Divider(height: 32),

                  // Descripción detallada
                  const Text(
                    'Acerca del lugar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.lugar.descripcionLarga,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Botón de acción principal ("Reservar")
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('¡Reserva realizada con éxito!'),
                          ),
                        );
                      },
                      child: const Text(
                        'Reservar Experiencia',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal, size: 28),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }
}
