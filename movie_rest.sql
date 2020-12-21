-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-07-2020 a las 15:35:18
-- Versión del servidor: 8.0.15
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `movie_rest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api`
--

CREATE TABLE `api` (
  `api_id` int(11) NOT NULL,
  `type` enum('text','image','number') NOT NULL,
  `tag` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `api`
--

INSERT INTO `api` (`api_id`, `type`, `tag`, `value`) VALUES
(1, 'image', 'IMAGE_PROMOTIONAL', 'avengers_endgame.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('1bca2f528be0915c54c327002e2dbfa04ffddf6f', '::1', 1568978622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383937383632323b),
('85af4c50cc1c6d2a90ebcb1e63e97cbbeca02a9e', '::1', 1568978278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383937383237383b),
('a684a3cafd9fa43008b0eb17dbbe150d052a984a', '::1', 1568977819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383937373831393b),
('613e1c278285ff5ee091c7ea7bc90b03b20b65bc', '::1', 1568977331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383937373333313b),
('4a602d10fad20bd7a2a064098e18463ee2bf17ac', '::1', 1568977016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383937373031363b),
('2435a876087777c7d9ab833671cd2706723b214d', '::1', 1568976643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383937363634333b),
('9b0b7226ca4b6529956d8299ebf3638d6ee96ae6', '192.168.100.108', 1569354170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393335343137303b),
('d31095af7ca151a411b45c62be41cc38b683bf53', '127.0.0.1', 1570363920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303336333932303b),
('d882a792e4aa34c72b5f3c43815378556d8ae047', '127.0.0.1', 1570363955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303336333935353b),
('5450806b16758738fb1e1699f78c9185cb30edbc', '127.0.0.1', 1570364025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303336343032353b),
('ec8c91111d79bc8434fd3f6af8e59aeffe2dd455', '::1', 1577193179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373139333130333b),
('e01b796e493849c5b422d7d0c4caaa67ebb38c7c', '::1', 1590943017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303934333031373b757365725f69647c733a313a2231223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b6e616d657c733a373a22416e6472c3a973223b),
('61540d5038c18befe48b86021a3c8eacf9298031', '::1', 1590943017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303934333031373b757365725f69647c733a313a2231223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b6e616d657c733a373a22416e6472c3a973223b),
('8082aae14fbe9415a33046780d89a0f240a6f1bf', '::1', 1593100587, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333130303536373b),
('aef9c2a88feafc5f1db6fb0efa4a9a5448de541d', '::1', 1593100627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333130303632373b),
('f9b8f03e7cd3c5a31d983e6aac6d204dd78601d0', '192.168.100.108', 1569354150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393335343135303b),
('46c08399ff45be51909bf0e65f309287568a673f', '192.168.100.108', 1569354160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393335343136303b),
('331a7835de80941730158a39b4bce9fe26f83c48', '192.168.100.108', 1569353856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393335333835363b),
('df5a8fa134ee7efc16f0e942f8dd541f6f01a203', '192.168.100.108', 1569354142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393335343134323b),
('f93d06ff22267845ca8cf9229cd23b57dd408b16', '192.168.100.108', 1569353857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393335333835373b),
('ae1231a8093327949c05c18e503366fa0d481f15', '192.168.100.108', 1569353856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393335333835363b),
('f71feb666292abc0c1f472db9e37e39cc84f14d1', '::1', 1569078531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393037383531343b),
('8c69a23e9c0a9c5d4ea4bb114d799536a0335121', '::1', 1568987201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383938373137393b),
('e84db2d879f0ccc161579580efc0447324034f67', '::1', 1568987179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383938373137393b),
('4b4c8cf87108ce885d086f9910c4cefa8ba1e585', '::1', 1568986872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383938363837323b),
('6090b17281b661fe4ec006c477f8c59de91f9d61', '::1', 1568986460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383938363436303b),
('29b2a3e82b18b842ce59c44aed6db9a946d1ba7a', '::1', 1568979772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383937393737323b),
('2f07261857ec2016df72c56904f4afaebf711bfd', '::1', 1568978924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383937383932343b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `year` int(11) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `type_movie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`movie_id`, `name`, `year`, `description`, `image`, `type_movie_id`) VALUES
(1, 'Avengers Endgame', 2019, 'Avengers: Endgame (Vengadores: Endgame en España1?) es una futura película de superhéroes basada en el grupo los Vengadores de Marvel Comics, producida por Marvel Studios y distribuida por Walt Disney Studios Motion Pictures, a ser estrenada en 2019. Es una secuela directa de la película de 2018 Avengers: Infinity War y una continuación de The Avengers (2012) y Avengers: Age of Ultron (2015), siendo la vigésimo segunda película del Universo cinematográfico de Marvel (MCU, por sus siglas en inglés). La cinta está dirigida por Anthony y Joe Russo, con un guion escrito por el equipo conformado por Christopher Markus y Stephen McFeely, y contando con la aparición de múltiples actores de películas anteriores del Universo cinematográfico de Marvel.\r\n\r\nLa película fue anunciada en octubre de 2014 como «Avengers: Infinity War – Part 2». Los Hermanos Russo se unieron para dirigir la película en abril de 2015 y en mayo, Markus y McFeely firmaron para escribir el guion. En julio de 2016, Marvel quitó el nombre de la película, refiriéndose a ella simplemente como Película sin título de Avengers. La filmación comenzó en agosto de 2017 en Pinewood Studios en el Condado de Fayette, Georgia, al mismo tiempo de la grabación de Avengers: Infinity War, y concluyó en enero de 2018. La grabación de algunas escenas adicionales tuvo lugar en el centro y la zona metropolitana de la ciudad de Atlanta.\r\n\r\nLa cinta está programada para ser lanzada en Estados Unidos el 26 de abril de 2019, en formato IMAX y 3D.\r\n\r\nCon el teaser tráiler lanzado el 7 de diciembre de 2018 se reveló que la fecha de estreno se había adelantado para el 26 abril del 2019.2?', '1561833444_avengers_endgame.jpg', 1),
(2, 'Shazam!', 2019, 'Shazam es una aplicación para telefonía móvil que incorpora un servicio que permite la identificación de música. La empresa tiene su sede en Londres y fue fundada por Chris Barton, Philip Inghelbrecht, Dhiraj Mukherjee y Avery Wang en 1999.1?Shazam aprovecha el micrófono que llevan incorporados la mayoría de teléfonos móviles para poder grabar una muestra de música que se esté reproduciendo. Una huella digital acústica se crea a partir de la muestra y se compara con una base de datos para encontrar coincidencias. Una vez hecha la relación, el usuario puede recibir información tal como el título de la canción, artista, álbum, enlaces de interés a servicios como iTunes, Youtube, Spotify o Groove Música, así como también sugerencias de otras canciones relacionadas.\r\n\r\nEn febrero de 2014 expertos de IT descubrieron que la versión de Shazam para Android enviaba de manera oculta datos personales a, al menos, dos portales de publicidad.2?\r\n\r\nEn diciembre de 2017, Shazam Entertainment Ltd. es comprada por Apple Inc.', 'shazam.jpg', 1),
(3, 'Joker', 2019, 'El Joker (a veces traducido como Comodín o Guasón) es un personaje ficticio, un supervillano que aparece en los cómics publicados por la editorial estadounidense DC Comics. Su nombre en español quiere decir Bromista, aunque también hace referencia a un naipe de la baraja inglesa, equivalente al comodín. No se sabe nada de su pasado;7? él mismo ha dicho que está confundido con lo que realmente pasó, reinventando siempre el hecho que hizo cambiar su apariencia.\r\n\r\nEs enemigo y archirrival de Batman; una de las razones para considerarlo así es que ha sido responsable de numerosas tragedias en su vida, como la parálisis de Barbara Gordon y la muerte de Jason Todd, quien fue el segundo Robin. Fue creado por Jerry Robinson, Bill Finger y Bob Kane,8? como un psicópata asesino, pero debido a los límites establecidos por la Comics Code Authority, su personalidad fue cambiada a la de un simple bufón inofensivo, al cual le gustaba molestar a los policías. Sin embargo, en el «renacimiento de los cómics de Batman» recuperó su antigua personalidad de maníaco homicida y, a lo largo de los años, ha ido volviéndose más oscuro a tal grado de ser capaz de asesinar niños indefensos, como es descrito en la película The Dark Knight, donde lo único que busca es ver arder el mundo.9? Su primera aparición fue en 1940 para el Batman n.º 1.1?\r\n\r\nSu apariencia es la de un payaso con piel de color blanco, pelo verde y una egocéntrica sonrisa en su rostro. Todos estos rasgos son dados por un accidente que tuvo en su juventud. Aunque es un misterio incluso para el mismo Joker, ya que cada vez que cuenta la historia es diferente, lo más aceptado es el accidente que ocurre en la novela gráfica de Alan Moore Batman: The Killing Joke.10? Ha sido repetidamente analizado por los críticos como el adversario perfecto de Batman, cuya larga relación, a menudo es paralela al concepto del yin y yang: Batman es un personaje serio, con un traje de colores oscuros y el Joker es colorido y alocado.\r\n\r\nFue interpretado por César Romero en la serie de televisión de los años 1960, por Jack Nicholson en Batman de Tim Burton,11? por Cameron Monaghan en \"Gotham\", Mark Hamill en Batman: The Animated Series, por Heath Ledger en The Dark Knight de Christopher Nolan.11? (interpretación que le valió el Óscar Póstumo a mejor actor de reparto en la gala de los Óscar de 2009)12?, por Jared Leto para la película Escuadrón suicida de la compañía Warner Bros. y DC Comics (2016), y por Joaquin Phoenix en Joker, película que se estrenará en 2019.\r\n\r\nEs uno de los villanos de género superheroico más icónicos y reconocidos, ocupa el puesto número uno de los 100 mejores de todos los tiempos según el sitio web de The Wizard.13? También fue nombrado el segundo mejor villano de la lista de IGN,14? así como el puesto número ocho de los mejores personajes de cómics según la revista Empire,15? y fue catalogado como el quinto mejor personaje en la revista Wizard.16?17? En la serie de televisión Batman del futuro, este personaje está muerto (su muerte se cuenta en la película Batman del futuro: el regreso del Joker), pero existe una banda de criminales que sigue la estela del personaje, conocida como Los Jokerz.', 'joker.jpg', 1),
(5, 'Viuda Negra', 2020, 'Para los otros personajes del Universo Marvel conocidos como Viuda Negra, véase Viuda Negra (personajes de Marvel).\r\nPara la actriz estadounidense, véase Natalie Rushman.\r\nPara otros usos de este término, véase Viuda negra (desambiguación).\r\nViuda Negra\r\nPersonaje de Marvel Comics\r\nBlack Widow Comic Con.jpg\r\nPrimera aparición	Tales of Suspense #52 (abril de 1964)\r\nCreador(es)	Stan Lee \r\nDon Rico \r\nDon Heck\r\nInterpretado por	Scarlett Johansson (2010-presente)\r\nInformación\r\nNombre original	Natalia Alianovna Romanova\r\nNatasha Romanoff\r\nEstatura	1,70 m (5 ft 7 in)\r\nPeso	59 kg (130 lb)\r\nColor de pelo	Rojo\r\nColor de ojos	Verdes\r\nEspecialidad	Amplia formación en operaciones militares, combatiente cuerpo a cuerpo, experta en artes marciales, envejecimiento lento, condición atlética, defensas psicológicas y el sistema inmunológico anormalmente superiores, hipnosis\r\nAliados	Capitán América, Ojo de Halcón, Falcon, Iron Man, Hulk, Bruja Escarlata, Visión, Pantera Negra, Spider-Man, Thor, Nick Fury\r\nAfiliaciones actuales	Vengadores Secretos, Los Vengadores, Los Poderosos Vengadores, Liberadoras, Agente de S.H.I.E.L.D., Los Campeones\r\nAfiliaciones anteriores	KGB\r\nPareja(s)	Drakeov Romanoff (padre, fallecido)\r\nAlexi Shostakov (ex-esposo, fallecido)\r\nDaredevil (ex-novio)\r\nEstatus actual	Activa\r\nPerfil en IMDb\r\n[editar datos en Wikidata]\r\nNatalia Alianovna Romanova,1?(Ruso: ??????? ????????? \"??????\" ????????; alias: Natasha Romanoff; Ruso: ?????? ????????), coloquial: Viuda Negra (en inglés: Black Widow) (en ruso: ?????? ?????; transcrito Chyornaya Vdova) es una superheroína ficticia que aparece en el cómic estadounidense y libros publicados por Marvel Comics. Creado por el editor y trazador Stan Lee, el guionista Don Rico y el artista Don Heck, el personaje debutó en Tales of Suspense # 52 (abril de 1964). El personaje fue presentado como una espía rusa, una antagonista del superhéroe Iron Man. Más tarde, desertó a los Estados Unidos, convirtiéndose en una agente de la organización ficticia S.H.I.E.L.D., y miembro del equipo de superhéroes, Los Vengadores.\r\n\r\nScarlett Johansson retrató el personaje en las películas Iron Man 2 (2010), The Avengers (2012), Captain America: The Winter Soldier (2014), Avengers: Age of Ultron (2015), Capitán América: Civil War (2016), Avengers: Infinity War (2018), Capitana Marvel (2019) y Avengers: Endgame (2019) como parte de la franquicia de Marvel Cinematic Universe.', 'viuda_negra.jpg', 1),
(7, 'Superman 2', 2030, 'Superman (cuyo nombre kryptoniano es Kal-El y su nombre terrestre es Clark Kent) es un personaje ficticio, un superhéroe de los cómics que aparece en las publicaciones de DC Comics.1? 2? 3? 4? Creado por el escritor estadounidense Jerry Siegel y el artista canadiense Joe Shuster en 1933 cuando ambos se encontraban viviendo en Cleveland, Ohio; lo vendieron a Detective Comics, Inc. en 1938 por 130  dólares estadounidenses5? y la primera aventura del personaje fue publicada en Action Comics #1 (junio de 1938), para luego aparecer en varios seriales de radio, programas de televisión, películas, tiras periódicas y videojuegos. Con el éxito de sus aventuras, Superman ayudó a crear el género del superhéroe y estableció su primacía dentro del cómic estadounidense.1? La apariencia del personaje es distintiva e icónica: un traje azul y rojo, con una capa y un escudo de “S” estilizado en su pecho,6? 7? 8? escudo que se ha convertido en un símbolo del personaje en todo tipo de medios de comunicación.9?\r\n\r\nLa historia original de Superman relata que nació con el nombre de Kal-El en el planeta Krypton; su padre, el científico Jor-El, y su madre Lara Lor-Van, lo enviaron en una nave espacial con destino a la Tierra cuando era un niño, momentos antes de la destrucción de su planeta. Fue descubierto y adoptado por Jonathan Kent y Martha Kent, una pareja de granjeros de Smallville, Kansas, que lo criaron con el nombre de Clark Kent y le inculcaron un estricto código moral. El joven Kent comenzó a mostrar habilidades superhumanas, las mismas que al llegar a su madurez decidiría usar para el beneficio de la humanidad.\r\n\r\nAunque denominado, algunas veces, de manera poco halagadora, como «el gran Boy Scout azul» por otros superhéroes, Superman también es conocido como «El Hombre de Acero», «El Hombre del Mañana» y «El Último Hijo de Krypton» por el público general de los cómics. Bajo la identidad de Clark Kent, Superman vive en medio de los humanos como un «tímido reportero» del diario Daily Planet de Metrópolis. Ahí trabaja junto a la reportera Lois Lane, con la cual ha sido vinculado románticamente.\r\n\r\nDC Comics/Warner Bros. expandió lentamente el reparto de personajes secundarios, poderes y símbolos de Superman a través de los años. Se modificó su pasado para permitir sus aventuras como Superboy y se crearon otros supervivientes de Krypton, incluyendo a Supergirl y Krypto, el Superperro. Además, Superman fue licenciado y adaptado a una gran variedad de medios, desde la radio a la televisión y el cine. En este último se dio la que quizás sea su interpretación más notable: Christopher Reeve tanto en Superman: la película (1978) como en su secuela Superman II (1981), películas de Richard Donner que recibieron la aclamación unánime de la crítica y se volvieron las películas más exitosas de Warner Bros. en su momento. No obstante, las dos siguientes secuelas, Superman III y Superman IV: The Quest for Peace no tuvieron tanto éxito a nivel de recaudación. La película Superman Returns, que fue estrenada en 2006, fue poco exitosa dentro de los Estados Unidos pero en el resto del mundo sobrepasó las expectativas iniciales de sus creadores.10?\r\n\r\nDesde el debut de Superman han transcurrido siete décadas, durante las cuales el personaje ha sido recreado y renovado en múltiples ocasiones. Una modificación mayor y significativa ocurrió en 1986, cuando el autor John Byrne modernizó y realizó un masivo retcon al personaje, reduciendo los poderes de Superman y eliminando varios personajes del canon, en una estrategia que atrajo mucha atención de los medios. Volvió a aparecer en la prensa en la década de 1990, cuando DC Comics publicó La Muerte de Superman, una historia en la que el personaje falleció y luego revivió.\r\n\r\nSuperman ha resultado fascinante para los académicos y tanto tesistas culturales como comentaristas y críticos han explorado el impacto del personaje y su rol en los Estados Unidos y en el resto del mundo. Umberto Eco discutió las cualidades mitológicas del personaje a inicios de los años 1960 y Larry Niven escribió sobre las características de una hipotética relación sexual entre el personaje y Lois Lane.11?', 'superman.jpg', 1),
(8, 'Alita: Battle Angel', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568639460_angel.jpg', 1),
(9, 'Aladdin', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568639484_aladin.jpg', 1),
(10, 'Spiderman', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568639953_spiderman.jpg', 1),
(11, 'Sonic', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568640241_sonic.jpg', 1),
(12, 'Rey León', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568805970_rey_leon.jpg', 1),
(13, 'El Conjuro', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568806090_conjuto.jpg', 2),
(14, 'Espace Room', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568806124_escape_room.jpg', 2),
(15, 'It capítulo 2', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568806203_it.jpg', 2),
(16, 'Ma!', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568806262_ma.jpg', 3),
(17, 'Hole', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568806361_hole.jpg', 2),
(18, 'Us!', 2019, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1568806458_us2.png', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie_favorites`
--

CREATE TABLE `movie_favorites` (
  `movie_favorite_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movie_favorites`
--

INSERT INTO `movie_favorites` (`movie_favorite_id`, `movie_id`, `user_id`) VALUES
(1, 2, 3),
(10, 17, 4),
(11, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie_qualifications`
--

CREATE TABLE `movie_qualifications` (
  `movie_qualification_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qualification` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movie_qualifications`
--

INSERT INTO `movie_qualifications` (`movie_qualification_id`, `movie_id`, `user_id`, `qualification`) VALUES
(6, 2, 3, 3),
(7, 2, 4, 5),
(8, 2, 1, 4),
(9, 2, 5, 5),
(10, 11, 4, 3),
(11, 3, 4, 5),
(12, 7, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types_movie`
--

CREATE TABLE `types_movie` (
  `type_movie_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `types_movie`
--

INSERT INTO `types_movie` (`type_movie_id`, `name`) VALUES
(1, 'Acción'),
(2, 'Terror'),
(3, 'Suspenso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('admin','regular') NOT NULL DEFAULT 'regular',
  `avatar` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `name`, `type`, `avatar`, `token`) VALUES
(1, 'admin@admin.com', '$2y$10$quZRy8IZXHr9iZtnSLbrg.2wKj8cb1SFZEs8mwXa54XrvokxW67RO', 'Andrés', 'admin', 'image_3.jpg', ''),
(3, 'andres20@gmail.com', '$2y$10$kOUovWnWFoJcrqBjh/iHuubcMc3BEUwO1v3qn7TP5fgYD7cloR7X.', 'Andres', 'regular', 'image_3.jpg', ''),
(4, 'andres@gmail.com', '$2y$10$RFqha0YtFfvsfwmTNMLT/.N.nxdlw9TB58Jzbd56E59AQ0l9tPPAC', 'Tony', 'regular', 'image_4.jpg', ''),
(5, 'andres21@gmail.com', '$2y$10$5AQk6kqPdp0NTlDed2b2sevZkhFXlPBEgQ5IFqt7msukwtvZ/SQhu', 'Thanos', 'regular', 'image_5.jpg', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_tokens`
--

CREATE TABLE `user_tokens` (
  `user_id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_tokens`
--

INSERT INTO `user_tokens` (`user_id`, `token`) VALUES
(4, 'ed5a17b9e6ea9a8efba7bddbc7fdfbb041be8a589ed6c5e1a1fa0e96bb28d34b82ce848cd47e5e38dcf0eb1cb4b2251549b5'),
(4, '76bbaafeb1e30debd965608d9f90839219472be707bec762863848c58bd8be0ef61beafed10580fec6a6592f90fcb280ff6f'),
(4, '7bd2e7adfd0aeb8da270b49dce4c33726657ca9f87a41192634666b0fae09d662233abf8152f1d54675dfadafd2877334ad4');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`api_id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indices de la tabla `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `type_movie_id` (`type_movie_id`);

--
-- Indices de la tabla `movie_favorites`
--
ALTER TABLE `movie_favorites`
  ADD PRIMARY KEY (`movie_favorite_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `movie_qualifications`
--
ALTER TABLE `movie_qualifications`
  ADD PRIMARY KEY (`movie_qualification_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `types_movie`
--
ALTER TABLE `types_movie`
  ADD PRIMARY KEY (`type_movie_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`token`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `api`
--
ALTER TABLE `api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `movie_favorites`
--
ALTER TABLE `movie_favorites`
  MODIFY `movie_favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `movie_qualifications`
--
ALTER TABLE `movie_qualifications`
  MODIFY `movie_qualification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `types_movie`
--
ALTER TABLE `types_movie`
  MODIFY `type_movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`type_movie_id`) REFERENCES `types_movie` (`type_movie_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `movie_favorites`
--
ALTER TABLE `movie_favorites`
  ADD CONSTRAINT `movie_favorites_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_favorites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `movie_qualifications`
--
ALTER TABLE `movie_qualifications`
  ADD CONSTRAINT `movie_qualifications_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_qualifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
