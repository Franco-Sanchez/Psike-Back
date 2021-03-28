@specialtiesArr.each do |specialty|
  Specialty.create(name: specialty, category: 0)
end

@addiciones.each do |addicion|
  Specialty.create(name: addicion, category: 1, parent: Specialty.find_by(name: 'Adicciones') )
end

Specialty.create(name: @autoestima, category: 1, parent: Specialty.find_by(name: 'Autoestima') )

@trastornosAlimenticios.each do |trastorno|
  Specialty.create(name: trastorno, category: 1, parent: Specialty.find_by(name: 'Trastornos alimenticios'))
end

@relacionesFamiliares.each do |relacion|
  Specialty.create(name: relacion, category: 1, parent: Specialty.find_by(name: 'Relaciones Familiares'))
end

Specialty.create(name: @dueloLuto, category: 1, parent: Specialty.find_by(name: 'Duelo/Luto'))

Specialty.create(name: @angustia, category: 1, parent: Specialty.find_by(name: 'Angustia'))

Specialty.create(name: @ansiedad, category: 1, parent: Specialty.find_by(name: 'Ansiedad'))

Specialty.create(name: @depresion, category: 1, parent: Specialty.find_by(name: 'Depresión'))

@controlIra.each do |control|
  Specialty.create(name: control, category: 1, parent: Specialty.find_by(name: 'Control de Ira'))
end

@terapiaPareja.each do |terapia|
  Specialty.create(name: terapia, category: 1, parent: Specialty.find_by(name: 'Terapia de pareja'))
end

@trastornosDesarrollo.each do |trastorno|
  Specialty.create(name: trastorno, category: 1, parent: Specialty.find_by(name: 'Trastornos de desarrollo'))
end

@controlMiedos.each do |control|
  Specialty.create(name: control, category: 1, parent: Specialty.find_by(name: 'Control de miedos'))
end

@estresTraumas.each do |estres|
  Specialty.create(name: estres, category: 1, parent: Specialty.find_by(name: 'Estrés & traumas'))
end

@timidezInhibicion.each do |timidez|
  Specialty.create(name: timidez, category: 1, parent: Specialty.find_by(name: 'Timidez e inhibición'))
end

@sexualidadIdentidad.each do |sexualidad|
  Specialty.create(name: sexualidad, category: 1, parent: Specialty.find_by(name: 'Sexualidad e indentidad'))
end

Specialty.create(name: @consejeria, category: 1, parent: Specialty.find_by(name: 'Consejería'))

@trastornosPersonalidad.each do |trastorno|
  Specialty.create(name: trastorno, category: 1, parent: Specialty.find_by(name: 'Trastornos de personalidad'))
end

Specialty.create(name: @trastornosSueno, category: 1, parent: Specialty.find_by(name: 'Trastornos del sueño'))

Specialty.create(name: @trastornosAprendizaje, category: 1, parent: Specialty.find_by(name: 'Trastornos de aprendizaje'))

Specialty.create(name: @autolesion, category: 1, parent: Specialty.find_by(name: 'Autolesión'))