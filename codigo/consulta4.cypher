MATCH (a:Artista {nome: 'eddie vedder'})-[:GRAVOU]->(m:Faixa)
RETURN m.nome AS TrackName,
       toFloat(m.valence) AS Valence,
       toFloat(m.energy) AS Energy
ORDER BY Valence DESC, Energy DESC