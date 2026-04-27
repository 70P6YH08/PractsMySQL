SELECT *, match(genres) AGAINST ('Action Strategy') AS relevance
from video_games
where match(genres) against ('Action Strategy')
order by match(genres) AGAINST ('Action Strategy') desc;