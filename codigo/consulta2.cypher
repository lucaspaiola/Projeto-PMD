MATCH (a:Album {album_name: 'when the morning comes'})<-[:PERTENCE_A]-(m:Faixa)
WITH avg(toFloat(m.danceability)) AS mediaDanceability, 
     avg(toFloat(m.energy)) AS mediaEnergy
MATCH (a2:Album)<-[:PERTENCE_A]-(m2:Faixa)
WHERE a2.album_name <> 'when the morning comes'
WITH a2,
     mediaDanceability, mediaEnergy,
     avg(toFloat(m2.danceability)) AS albumMediaDanceability,
     avg(toFloat(m2.energy)) AS albumMediaEnergy
WITH a2.album_name AS AlbumName,
     albumMediaDanceability,
     albumMediaEnergy,
     abs(albumMediaDanceability - mediaDanceability) AS DiferencaDanceability,
     abs(albumMediaEnergy - mediaEnergy) AS DiferencaEnergy,
     (abs(albumMediaDanceability - mediaDanceability) + abs(albumMediaEnergy - mediaEnergy)) AS similaridade
ORDER BY similaridade ASC
LIMIT 3
RETURN AlbumName AS Album_recomendado,
       albumMediaDanceability AS AlbumDanceability,
       albumMediaEnergy AS AlbumEnergy