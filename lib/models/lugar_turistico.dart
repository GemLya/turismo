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

// Lista de destinos turísticos de México con imágenes locales 
final List<LugarTuristico> listaLugares = [
  // --- MONUMENTOS ---
  LugarTuristico(
    id: '1',
    nombre: 'Chichén Itzá',
    categoria: 'Monumentos',
    imagenUrl: 'assets/images/chichen.jpg',
    descripcionCorta: 'Maravilla del mundo antiguo en Yucatán.',
    descripcionLarga: 'Explora la majestuosa zona arqueológica maya, destacando la imponente pirámide de Kukulcán, el juego de pelota y el cenote sagrado.',
    calificacion: 4.9,
    duracionEstimada: '4 horas',
    precio: 25.0,
  ),
  LugarTuristico(
    id: '2',
    nombre: 'Palacio de Bellas Artes',
    categoria: 'Monumentos',
    imagenUrl: 'assets/images/bellas_artes.jpg',
    descripcionCorta: 'Joyas arquitectónicas en el corazón de CDMX.',
    descripcionLarga: 'El máximo recinto cultural de México, famoso por su arquitectura en mármol de Carrara y los murales de Diego Rivera y David Alfaro Siqueiros.',
    calificacion: 4.8,
    duracionEstimada: '2 horas',
    precio: 5.0,
  ),

  // --- NATURAL ---
  LugarTuristico(
    id: '3',
    nombre: 'Cañón del Sumidero',
    categoria: 'Natural',
    imagenUrl: 'assets/images/sumidero.jpg',
    descripcionCorta: 'Impresionante falla geológica en Chiapas.',
    descripcionLarga: 'Un recorrido en lancha por el río Grijalva rodeado por paredes de roca de más de 1,000 metros de altura, hogar de una gran biodiversidad.',
    calificacion: 4.9,
    duracionEstimada: '3 horas',
    precio: 18.0,
  ),
  LugarTuristico(
    id: '4',
    nombre: 'Cascadas de Agua Azul',
    categoria: 'Natural',
    imagenUrl: 'assets/images/agua_azul.jpg',
    descripcionCorta: 'Pozas de tonalidades turquesas en la selva.',
    descripcionLarga: 'Un paraíso natural formado por el río Asul, ideal para nadar, caminar por senderos rodeados de vegetación tropical y disfrutar de paisajes únicos.',
    calificacion: 4.7,
    duracionEstimada: '5 horas',
    precio: 10.0,
  ),

  // --- PLAYAS ---
  LugarTuristico(
    id: '5',
    nombre: 'Playa Delfines (Cancún)',
    categoria: 'Playas',
    imagenUrl: 'assets/images/cancun.jpg',
    descripcionCorta: 'Arena blanca y mar azul turquesa caribeño.',
    descripcionLarga: 'Una de las playas más emblemáticas de Quintana Roo, perfecta para contemplar el atardecer, tomar fotos en el parador fotográfico y relajarse.',
    calificacion: 4.9,
    duracionEstimada: 'Todo el día',
    precio: 0.0,
  ),
  LugarTuristico(
    id: '6',
    nombre: 'Playa Mazunte',
    categoria: 'Playas',
    imagenUrl: 'assets/images/mazunte.jpg',
    descripcionCorta: 'Pueblo mágico costero y santuario de tortugas.',
    descripcionLarga: 'Un destino bohemio en Oaxaca ideal para conectar con la naturaleza, surfear, disfrutar de la gastronomía local y visitar el Centro Mexicano de la Tortuga.',
    calificacion: 4.8,
    duracionEstimada: 'Todo el día',
    precio: 0.0,
  ),
];