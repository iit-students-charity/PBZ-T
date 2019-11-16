// Показать ноту, которая может называться Си бемоль
MATCH 
  (note: Note) WHERE note.alter_ego = "Сиb"
RETURN note
// Показать аккорды, в которых есть нота До
MATCH
  (chord: Chord) -[:NOTE]-> (do)
RETURN chord.name