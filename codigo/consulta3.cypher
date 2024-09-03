MATCH (a:Artista)-[:GRAVOU]->(m:Faixa)
WHERE a.nome IN ['angelina cruz', 'jason mraz', 'andrew foy']
WITH a.nome AS ArtistName,
     avg(toFloat(m.danceability)) AS AvgDanceability,
     avg(toFloat(m.popularity)) AS AvgPopularity
RETURN ArtistName AS Artist,
       AvgDanceability AS MediaDanceabilty,
       AvgPopularity AS MediaPopularity
ORDER BY AvgDanceability DESC, AvgPopularity DESC