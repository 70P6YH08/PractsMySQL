SELECT *, match(description) AGAINST ('фывфыв') AS relevance
from games;

SELECT *, match(description) AGAINST ('Battlefield') AS relevance
from games;

SELECT *, match(description) AGAINST ('ЕГОР') AS relevance
from games;

SELECT *, match(description) AGAINST ('ЕГОР это') AS relevance
from games