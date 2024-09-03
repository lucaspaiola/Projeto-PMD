MATCH (a1:Artista {nome: 'bailey jehl'})-[:GRAVOU]->(m1:Faixa {nome: '21 guns'}),
      (a2:Artista {nome: 'the mayries'})-[:GRAVOU]->(m2:Faixa {nome: 'i will wait'}),
      (a3:Artista {nome: 'a great big world'})-[:GRAVOU]->(m3:Faixa {nome: 'say something'})
WITH avg(toFloat(m1.danceability)) AS mediaDanceability,
     avg(toFloat(m1.energy)) AS mediaEnergy,
     avg(toFloat(m1.valence)) AS mediaValence,
     avg(toFloat(m1.popularity)) AS mediaPopularity
MATCH (r:Faixa)
WHERE abs(toFloat(r.danceability) - mediaDanceability) < 0.3
  AND abs(toFloat(r.energy) - mediaEnergy) < 0.3
  AND abs(toFloat(r.valence) - mediaValence) < 0.3
  AND abs(toFloat(r.popularity) - mediaPopularity) < 0.3
RETURN r.nome AS Música, 
       r.danceability AS Danceability,
       r.energy AS Energy,
       r.valence AS Valence,
       r.popularity AS Popularity
LIMIT 10;
