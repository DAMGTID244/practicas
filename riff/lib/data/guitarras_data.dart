import '../models/guitarra.dart';

/// Datos ficticios (mock data) que alimentan la app.
const List<String> categorias = [
  'Todos',
  'Acústicas',
  'Clásicas',
  'Eléctricas',
  'Otros',
];

const List<Guitarra> guitarras = [
  Guitarra(
    nombre: 'Acústica Dreadnought',
    categoria: 'Acústicas',
    descripcionCorta: 'Cuerpo grande, voz potente y graves profundos.',
    descripcionLarga:
        'La dreadnought es la guitarra acústica más popular del mundo. Su cuerpo '
        'amplio proyecta mucho volumen y unos graves llenos, ideales para '
        'acompañar la voz o rasgar acordes con fuerza. Es la compañera clásica '
        'de fogatas, cafés y escenarios pequeños.',
    imagen: 'assets/images/acustica_dreadnought.jpg',
    cuerdas: '6 de acero',
    origen: 'EE. UU., inicios del siglo XX',
    precio: '\$2,500 – \$15,000 MXN',
    dificultad: 3,
    maderas: 'Abeto (tapa) y caoba o palorrosa (aros y fondo)',
    estiloIdeal: 'Folk, country, rock acústico y cantautor',
    datoCurioso:
        'Su nombre viene del acorazado británico HMS Dreadnought, por su '
        'tamaño imponente.',
  ),
  Guitarra(
    nombre: 'Clásica de Nylon',
    categoria: 'Clásicas',
    descripcionCorta: 'Sonido cálido y suave, perfecta para empezar.',
    descripcionLarga:
        'La guitarra clásica usa cuerdas de nylon, que son más suaves para los '
        'dedos y dan un timbre redondo y cálido. Tiene el mástil más ancho, lo '
        'que facilita la técnica de dedos. Es la opción más común para '
        'aprender y para repertorio de concierto.',
    imagen: 'assets/images/clasica.jpg',
    cuerdas: '6 de nylon',
    origen: 'España, siglo XIX',
    precio: '\$1,800 – \$10,000 MXN',
    dificultad: 2,
    maderas: 'Abeto o cedro (tapa) y palorrosa o ciprés',
    estiloIdeal: 'Música clásica, bolero, trova y bossa nova',
    datoCurioso:
        'Las cuerdas de nylon sustituyeron a las de tripa de animal a '
        'mediados del siglo XX.',
  ),
  Guitarra(
    nombre: 'Guitarra Flamenca',
    categoria: 'Clásicas',
    descripcionCorta: 'Brillante, percusiva y llena de carácter.',
    descripcionLarga:
        'Parecida a la clásica, pero más ligera y con cuerdas más bajas para '
        'lograr un sonido seco, rápido y percusivo. Incluye golpeadores '
        'transparentes sobre la tapa para proteger la madera durante los '
        'rasgueos y golpes típicos del flamenco.',
    imagen: 'assets/images/flamenca.jpg',
    cuerdas: '6 de nylon',
    origen: 'Andalucía, España',
    precio: '\$4,000 – \$20,000 MXN',
    dificultad: 4,
    maderas: 'Ciprés (aros y fondo) y abeto (tapa)',
    estiloIdeal: 'Flamenco, rumba y música española',
    datoCurioso:
        'El golpeador no es decoración: aguanta los golpes de las uñas sobre '
        'la tapa.',
  ),
  Guitarra(
    nombre: 'Eléctrica de Cuerpo Sólido',
    categoria: 'Eléctricas',
    descripcionCorta: 'Versátil y filosa: rock, blues y mucho más.',
    descripcionLarga:
        'Su cuerpo macizo casi no resuena por sí mismo, así que el sonido '
        'depende de las pastillas y del amplificador. Eso permite una enorme '
        'variedad de timbres, desde limpios y brillantes hasta distorsiones '
        'pesadas. Es la reina de los solos.',
    imagen: 'assets/images/electrica_solida.jpg',
    cuerdas: '6 de acero',
    origen: 'EE. UU., década de 1950',
    precio: '\$4,000 – \$30,000 MXN',
    dificultad: 3,
    maderas: 'Aliso o fresno (cuerpo) y arce (mástil)',
    estiloIdeal: 'Rock, blues, pop y metal',
    datoCurioso:
        'Sin amplificador casi no se escucha, porque no tiene caja de '
        'resonancia.',
  ),
  Guitarra(
    nombre: 'Semihueca',
    categoria: 'Eléctricas',
    descripcionCorta: 'Calidez de caja con la fuerza de una eléctrica.',
    descripcionLarga:
        'Combina un cuerpo con cámaras de aire y orificios en forma de f con '
        'pastillas eléctricas. El resultado es un tono dulce, redondo y '
        'con cuerpo, muy buscado en jazz y blues. Un bloque central de madera '
        'ayuda a controlar la retroalimentación.',
    imagen: 'assets/images/semihueca.jpg',
    cuerdas: '6 de acero',
    origen: 'EE. UU., década de 1950',
    precio: '\$6,000 – \$40,000 MXN',
    dificultad: 3,
    maderas: 'Arce y álamo laminados',
    estiloIdeal: 'Jazz, blues y rock clásico',
    datoCurioso:
        'El bloque macizo del centro reduce los silbidos cuando se sube el '
        'volumen.',
  ),
  Guitarra(
    nombre: 'Guitarra de Doce Cuerdas',
    categoria: 'Acústicas',
    descripcionCorta: 'Un sonido cristalino que parece un coro de guitarras.',
    descripcionLarga:
        'Tiene seis pares de cuerdas: los pares graves van en octavas y los '
        'agudos en unísono. Eso crea un efecto brillante y envolvente, como si '
        'tocaran dos guitarras a la vez. Requiere más fuerza en la mano '
        'izquierda y afinar con paciencia.',
    imagen: 'assets/images/doce_cuerdas.jpg',
    cuerdas: '12 (6 pares)',
    origen: 'EE. UU., siglo XX',
    precio: '\$5,000 – \$25,000 MXN',
    dificultad: 4,
    maderas: 'Abeto (tapa) y caoba (aros y fondo)',
    estiloIdeal: 'Folk rock, baladas y pop acústico',
    datoCurioso:
        'Su clavijero es más largo que el de una guitarra normal para '
        'alojar doce clavijas.',
  ),
  Guitarra(
    nombre: 'Bajo Eléctrico',
    categoria: 'Eléctricas',
    descripcionCorta: 'El latido grave que sostiene toda la banda.',
    descripcionLarga:
        'Es más largo que una guitarra y tiene cuatro cuerdas gruesas que '
        'suenan una octava más abajo que las cuatro cuerdas graves de la '
        'guitarra. Marca el ritmo y la armonía, uniendo la batería con el '
        'resto de los instrumentos.',
    imagen: 'assets/images/bajo_electrico.jpg',
    cuerdas: '4 de acero',
    origen: 'EE. UU., década de 1950',
    precio: '\$4,000 – \$25,000 MXN',
    dificultad: 2,
    maderas: 'Aliso (cuerpo) y arce (mástil)',
    estiloIdeal: 'Funk, rock, jazz y reggae',
    datoCurioso:
        'Se afina igual que las cuatro cuerdas graves de la guitarra, pero '
        'una octava abajo.',
  ),
  Guitarra(
    nombre: 'Ukelele',
    categoria: 'Otros',
    descripcionCorta: 'Pequeño, alegre y muy fácil de llevar a todos lados.',
    descripcionLarga:
        'Aunque no es una guitarra, es su primo ligero. Tiene solo cuatro '
        'cuerdas de nylon y un cuerpo diminuto, así que se aprende rápido y '
        'cabe en cualquier mochila. Su timbre luminoso lo vuelve ideal para '
        'canciones alegres.',
    imagen: 'assets/images/ukelele.jpg',
    cuerdas: '4 de nylon',
    origen: 'Hawái, siglo XIX',
    precio: '\$800 – \$5,000 MXN',
    dificultad: 1,
    maderas: 'Caoba, koa o abeto',
    estiloIdeal: 'Música hawaiana, pop ligero y canto en grupo',
    datoCurioso:
        'En hawaiano suele traducirse como "pulga saltarina", por la '
        'rapidez de los dedos al tocarlo.',
  ),
];
