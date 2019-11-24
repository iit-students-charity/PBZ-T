// Показать ноту, которая может называться Си бемоль
MATCH 
  (note: Note) WHERE note.alter_ego = "Сиb"
RETURN note
// Показать аккорды, в которых есть нота До
MATCH
  (chord: Chord) -[:NOTE]-> (:Note{ name: "До" })
RETURN DISTINCT chord.name, chord.lad
// Показать субдоминанту тональности  До Мажор
MATCH
  (key: Key { name: "До", lad: "Мажор" }) -[:SUBDOMINANT]-> (note)
RETURN note.name
// Найти ноту, входящую в аккорд Dsus4 и являющуюся тоникой тональности Ля Минор
MATCH
  (note) <-[:NOTE]- (:Chord { name: "Ре", lad: "Сус4" }),
  (key: Key { name: "Ля", lad: "Минор" }) -[:TONIC]-> (note)
RETURN note.name
// Найти ноту, которая не является доминантой ни одной из введенных тональностей
MATCH (note: Note)
  WHERE NOT ((note: Note) <-[:DOMINANT]- (:Key))
RETURN note.name
// Найти аккорд, в который входят ноты Соль, Ре, Ля#
MATCH
  (chord: Chord) -[:NOTE]-> (do), (re), (lya_dies)
RETURN DISTINCT chord.name, chord.lad