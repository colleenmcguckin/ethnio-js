json.songs @songs do |song|
  json.id song.id
  json.title song.name
  json.time_signature song.time_signature.name
  json.key_signature song.key.tonic
  json.tempo song.tempo
  json.structure song.structures
  json.lyrics song.lyrics
  json.created_at song.created_at
  
end

json.keys @keys do |key|
  json.id key.id
  json.name key.tonic
end

json.time_signatures @time_signatures do |time_signature|
  json.id time_signature.id
  json.name time_signature.name
  json.beat_unit time_signature.beat_unit
  json.bar time_signature.bar
end

json.tempos @tempos do |tempo|
  json.id  tempo.id
  json.bpm tempo.bpm
end

json.element_names @elements do |element|
  json.id element.id
  json.element_name element.name
end