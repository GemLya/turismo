class LugarTuristico {
  final String id;
  final String nombre;
  final String categoria;
  final String imagenUrl;
  final String descripcionCorta;
  final String descripcionLarga;
  final double calificacion;
  final String duracionEstimada;
  final double precio;

  LugarTuristico({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.imagenUrl,
    required this.descripcionCorta,
    required this.descripcionLarga,
    required this.calificacion,
    required this.duracionEstimada,
    required this.precio,
  });
}

// Lista de datos ficticios (Mock Data)
final List<LugarTuristico> listaLugares = [
  LugarTuristico(
    id: '1',
    nombre: 'Centro Histórico Colonial',
    categoria: 'Monumentos',
    imagenUrl: 'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2',
    descripcionCorta: 'Hermosas calles empedradas y arquitectura colonial.',
    descripcionLarga: 'Un recorrido fascinante por el corazón de la ciudad, lleno de historia, museos, iglesias centenarias y una oferta gastronómica tradicional inigualable.',
    calificacion: 4.8,
    duracionEstimada: '3 horas',
    precio: 0.0,
  ),
  LugarTuristico(
    id: '2',
    nombre: 'Cascada Oculta del Bosque',
    categoria: 'Natural',
    imagenUrl: 'https://images.unsplash.com/photo-1432821596592-e2c18b78144f',
    descripcionCorta: 'Naturaleza viva y pozas de agua cristalina.',
    descripcionLarga: 'Una aventura ecoturística ideal para los amantes del senderismo. Disfruta de la flora local, aire puro y un refrescante baño en la cascada principal.',
    calificacion: 4.9,
    duracionEstimada: '5 horas',
    precio: 15.0,
  ),
  LugarTuristico(
    id: '3',
    nombre: 'Playa de Arena Blanca',
    categoria: 'Playas',
    imagenUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
    descripcionCorta: 'Aguas turquesas y atardeceres inolvidables.',
    descripcionLarga: 'Relájate bajo el sol en una de las playas más hermosas de la región. Ideal para practicar esnórquel, descansar y disfrutar de mariscos frescos.',
    calificacion: 4.7,
    duracionEstimada: 'Todo el día',
    precio: 5.0,
  ),
];