// (1) Показать ноту, которая может называться Си бемоль
MATCH 
  (note: Note) WHERE note.alter_ego = "Сиb"
RETURN note
// (2) Показать аккорды, в которых есть нота До
MATCH
  (chord: Chord) -[:NOTE]-> (:Note{ name: "До" })
RETURN DISTINCT chord.name, chord.lad
// (3) Показать субдоминанту тональности  До Мажор
MATCH
  (key: Key { name: "До", ton_lad: "Мажор" }) -[:SUBDOMINANT]-> (note)
RETURN note.name
// (4) Найти ноту, входящую в аккорд Dsus4 и являющуюся тоникой тональности Ля Минор
MATCH
  (note) <-[:NOTE]- (:Chord { name: "Ре", lad: "Сус4" }),
  (key: Key { name: "Ля", ton_lad: "Минор" }) -[:TONIC]-> (note)
RETURN note.name
// (5) Найти ноту, которая не является доминантой ни одной из введенных тональностей
MATCH (note: Note)
  WHERE NOT ((note: Note) <-[:DOMINANT]- (:Key))
RETURN note.name
// (6) Найти аккорд, в который входят ноты Соль, Ре, Ля#
MATCH
  (chord: Chord) -[:NOTE]-> (:Note { name: "До" }), 
  (chord) -[:NOTE]-> (:Note { name: "Ре" }),
  (chord) -[:NOTE]-> (:Note { name: "Ля#" })
RETURN DISTINCT chord.name, chord.lad
// (7) Найти песни Цоя в тональности До Мажор
MATCH
  (song: Song) WHERE song.author = "Цой" AND (song) -[:KEY]-> (:Key { name: "До", lad: "Мажор" })
RETURN song.name
// (8) Найти тонику песни исполнителя Freddie Mercury
MATCH   
  (key: Key) <-[:KEY]- (song :Song), 
  (key) -[:TONIC]-> (note: Note) WHERE (song.singer = "Freddie Mercury") 
RETURN note.name
// (9) Найти аккорды песен автора Brian May
MATCH 
  (song: Song) -[:CHORD]-> (chord) WHERE song.author = "Brian May"
RETURN chord.name, chord.lad
// (10) Найти все ноты со знаками понижения/повышения
MATCH
  (note: Note) WHERE note.alter_ego <> ""
RETURN note