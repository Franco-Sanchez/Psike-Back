users = User.all

users.last(9).each do |user|
  Psychologist.create(biography: Faker::Lorem.paragraph, price: rand(50..120),
                      linkedIn: Faker::Internet.domain_name(domain: "linkedIn"), user: user)
end

# Ana
p6 = users.find{|x| x.id == 6 } 
Psychologist.create(biography: "Licenciada en Psicología Clínica por la Pontificia Universidad Católica del Perú. Psicoterapeuta humanista con formación en Terapia Gestalt para adultos y especialidad en psicoterapia infantojuvenil
  Trabajo con adultos jóvenes, niños y adolescentes.
  Mi intervención propone una mirada integral de la salud mental, con la cual elijo herramientas terapéuticas según la necesidad de cada persona, tomando siempre en cuenta tres ejes principales: mente, cuerpo y emociones. Además, implemento el modelo centrado en la familia o en la comunidad, dándole relevancia a la red de apoyo en el bienestar del o la paciente.",
  price:100,
  linkedIn: "https://www.linkedin.com/in/ana-luc%C3%ADa-p%C3%A9rez-de-velasco-geldres-8a13b463/", 
  user: p6)

p7 = users.find{|x| x.id == 7 } 
Psychologist.create(biography: "Lic. en psicología de la Universidad de Lima con perspectiva dialéctica. Terapia individual y consejería
  Mi nombre es Valeria Naito, soy licenciada en psicología por la Universidad de Lima. Mi enfoque en la terapia se basa principalmente en la Terapia Dialéctica Conductual (DBT) - terapia con más evidencia de efectividad en el Trastorno Límite de Personalidad y conducta suicida, en sus modalidades individual y grupal. Asimismo, trabajo con el abordaje EMDR para ayudar a personas que han pasado por experiencias traumáticas de diversa índole.
  Tengo experiencia en terapia individual, especialmente, con adolescentes y adultos jóvenes, además de consejería con padres. Busco brindar un soporte emocional de acuerdo a las necesidades de cada persona y enseñar distintas habilidades para el manejo y expresión de emociones con el fin de promover relaciones sociales armoniosas y el bienestar en ellas para que puedan continuar con su los objetivos de su desarrollo personal.
  Atiendo en San Borja y en Miraflores.",
  price:150,
  linkedIn: "https://www.linkedin.com/in/valeria-naito-96589056/", 
  user: p7)

  p8 = users.find{|x| x.id == 8 } 
Psychologist.create(biography: "Hola, mi nombre es Alberto Pacheco Araoz. Soy psicoterapeuta con certificación internacional, y en la actualidad atiendo especialmente a adultos y adolescentes. Me desempeño bajo un enfoque cognitivo conductual, pero también cuento con entrenamientos en terapias de tercera generación tales como: Terapia dialéctica conductual (DBT), Terapia de Aceptación y Compromiso (ACT), Mindfulness, Terapia Integral de Pareja (TIP) y Activación conductual; lo cual me otorga un repertorio más amplio de herramientas para adaptar mi intervención a las necesidades del consultante. Mi objetivo es promover el sentido de conciencia y libertad en las personas para que puedan aproximarse a sus metas de vida",
  price:150,
  linkedIn: "https://www.linkedin.com/in/alberto-pacheco-araoz-7b444178/", 
  user: p8)

  p9 = users.find{|x| x.id == 9 } 
  Psychologist.create(biography: "¡Hola! Mi nombre es Daniela y me gustaría contarte un poco de mi historia. Me licencié en Psicología en la Universidad de Lima y, al terminar mi carrera, me formé como Psicoterapeuta Cognitivo Conductual. Luego, estudié una maestría en Psicología Clínica en la Universidad de Utrecht, Países Bajos. Tengo experiencia en brindar terapia a adultos, apoyándolos con las dificultades que deseen compartir en el espacio terapéutico. Estas dificultades pueden ser desde simples áreas de mejora hasta indicios de alguna psicopatología. Juntos conceptualizamos cuál es el problema y por dónde sería mejor empezar.
    Mi principal propósito es crear un espacio de confianza con la persona que busca ayuda. La idea es combinar mi experiencia en brindar tratamientos con evidencia científica y tu conocimiento sobre tus propios pensamientos y emociones. Trabajaremos en equipo para acercarte a tus objetivos",
    price:150,
    linkedIn: "https://www.linkedin.com/in/daniela-del-carpio-carrizales-515220a2/", 
    user: p9)

p10 = users.find{|x| x.id == 10 } 
Psychologist.create(biography: "Hola, mi nombre es Rafael Aramburú. Soy psicoterapeuta y actualmente me dedico a ayudar tanto a adultos y adolescentes. Trabajo bajo un enfoque cognitivo conductual, pero también cuento formaciones en terapias de tercera generación (ACT, DBT, BADT, Mindfulness) y experiencia en neuropsicología, que me permiten incorporar diversas técnicas de otros enfoques para brindar un mejor servicio y potenciar el apoyo al consultante. Mi objetivo es ayudar a las personas a construir una vida valiosa y cada vez más cercana a la vida que quisieran tener.",
  price:150,
  linkedIn: "https://www.linkedin.com/in/rafael-arambur%C3%BA-umbert-2952a844/", 
  user: p10)

p11 = users.find{|x| x.id == 11 } 
Psychologist.create(biography: "Hola! Soy Psicóloga Licenciada de la Universidad de Lima. Brindo psicoterapia individual utilizando herramientas desde el enfoque DBT (Terapia dialéctica conductual), ACT (Terapia de Aceptación y Compromiso) y TRE (Terapia racional emotiva), en función a los objetivos de cada consultante. Disfruto trabajar con distintas personas de una manera horizontal, buscando cumplir sus metas trazadas por medio de la reflexión y el trabajo continuo.
Me enfoco en el desarrollo integral desde el autoconocimiento. Trabajo el manejo de ansiedad, del estrés, en cómo tener una mayor efectividad en las relaciones interpersonales, entre otros temas.
Tengo experiencia en manejo de grupos de reflexión académica y capacitaciones relacionadas a la docencia. Asimismo, he participado en una propuesta de aprendizaje autónomo con niños de 3 a 9 años, donde cumplía con la labor de acompañar sus distintos procesos educativos y emocionales durante su recorrido de aprendizaje.
Actualmente atiendo online.
Consultorios en los que atiendo normalmente:
- Por las mañanas y tardes: San Borja
- Por las noches: Surco (límite con Barranco)",
  price:100,
  linkedIn: "https://www.linkedin.com/in/andrea-bonilla-baa509128/", 
  user: p11)

p12 = users.find{|x| x.id == 12 } 
Psychologist.create(biography: "En lugar de hablar de “trastornos” por “curar” mi trabajo está basado en comprender genuinamente a las personas en relación a su historia personal.
  Las problemáticas o dificultades que nos dificultan vivir plenamente no son únicamente individuales; no surgen porque hay algo mal particularmente en uno; sino porque hemos tenido relaciones o experiencias que necesitan mirarse y entenderse de una manera distinta.
  Ofrezco un espacio de contención, apoyo, diálogo y sanación para mirar esos aspectos que evitamos o que nos incomodan",
price:150,
linkedIn: "https://www.linkedin.com/in/michelperezosores/", 
user: p12)


p13 = users.find{|x| x.id == 13 } 
Psychologist.create(biography: "Psicoterapeuta de niños, adolescentes y adultos.
  He llevado cursos de psicoterapia en la Asociación Psicoanalítica de Buenos Aires (Argentina). He participado del seminario de Relaciones Grupales en “The Grubb Institute” (Londres). Continúo mis estudios en Inter-Cambio, Instituto de Psicoterapia Psicoanalítica (Perú).
  Además, soy especialista en desarrollo de habilidades blandas en contextos educativos y organizacionales. Trabajo con grupos en la formación de liderazgo y competencias de equipos. Coordino y dicto talleres en la Universidad del Pacífico y soy miembro de la plana docente en la Universidad Peruana de Ciencias Aplicadas, donde dicto cursos de coaching y facilito en el Programa de Liderazgo.
  Realizo evaluaciones psicológicas, informes psicológicos, psicoterapia breve, psicoterapia psicoanalítica",
price:150,
linkedIn: "https://www.linkedin.com/in/lucianagarcia/", 
user: p13)


p14 = users.find{|x| x.id == 14 } 
Psychologist.create(biography: "Dentro de los servicios psicológicos, se ofrecen sesiones de evaluación, consejería, orientación y psicoterapia online para adolescentes, adultos y parejas en las siguientes problemáticas:
  - Ansiedad y manejo de estrés.
  - Problemas del estado de ánimo (depresión, desmotivación, entre otros.
  - Problemas relacionados al bajo rendimiento académico y desmotivación académica.
  - Orientación Vocacional (5 sesiones) – Método garantizado.
  - Técnicas de estudio para prepararte para ingresar a la universidad o mejorar tu rendimiento académico en la escuela – - Método garantizado.
  - Conductas de riesgo relacionados a la sexualidad (métodos anticonceptivos, enamoramiento y vínculos afectivos, orientación sexual, género, embarazo no deseado).
  - Acoso escolar (bullying) y acoso en las redes sociales (ciberbullying).
  - Evaluación psicológica integral (cognitiva, emocional, personalidad, familiar, etc.)
  - Problemas relacionados a la valoración personal (autoestima).
  - Soporte emocional y apoyo psicológico frente al duelo y enfermedad.
  - Orientación a padres de familia respecto a problemas de conducta (niños y adolescentes)
  - Psicoterapia de pareja, en problemas como: comunicación, celos, infidelidad, sexualidad, etc.
  - Inadecuado manejo del enojo y conducta agresiva.
  - Inadecuadas habilidades sociales.
  - Dificultades para la toma de decisiones y solución de conflictos",
price:50,
linkedIn: "https://www.linkedin.com/in/jeancarlo-joel-bola%C3%B1os-rueda-08989a6b/", 
user: p14)