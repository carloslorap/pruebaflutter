class cancion {
  final String titulo;
  final String imagen;

  cancion({required this.titulo, required this.imagen});
}

List<cancion> canciones = [
  cancion(
    titulo: 'MAGIG! - Rude(official video)',
    imagen: 'assets/rude.jpg',
  ),
  cancion(
    titulo: 'Daddy Yankee - Con Calma )',
    imagen: "assets/daddy.jpg",
  ),
  cancion(
    titulo: 'Bruno Mars Thats What ILike ',
    imagen: "assets/bruno.jpg",
  ),
  cancion(
    titulo: "BoyWithUke'Toxic'Open Mic",
    imagen: "assets/maxx.jpg",
  ),
  cancion(
    titulo: ' Ozuna - DEPRIMIDA ',
    imagen: "assets/ozuna.png",
  ),
  cancion(
    titulo: 'BAD BUNNY - AMORFODA ',
    imagen: "assets/badbunny.jpg",
  ),
];
