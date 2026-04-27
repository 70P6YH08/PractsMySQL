SELECT *, match(genres) AGAINST ('Action+Simulation-Strategy') AS relevance
from video_games
where match(genres) against ('Action+Simulation-Strategy' in boolean mode);