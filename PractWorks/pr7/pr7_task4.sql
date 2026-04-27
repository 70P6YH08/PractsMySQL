SELECT *, match(description, name) AGAINST ('asdaas') AS relevance
from games
order by match(description, name) AGAINST ('asdaas') desc;

SELECT *, match(description, name) AGAINST ('FIFA') AS relevance
from games
order by match(description, name) AGAINST ('FIFA') desc;

SELECT *, match(description, name) AGAINST ('ЕГОР') AS relevance
from games
order by match(description, name) AGAINST ('ЕГОР') desc;

SELECT *, match(description, name) AGAINST ('Забудьте игра') AS relevance
from games
order by match(description, name) AGAINST ('Забудьте игра') desc;