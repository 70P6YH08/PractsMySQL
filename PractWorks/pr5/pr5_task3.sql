update tempbooks
set price_book = 
case
    when surname = 'Пушкин' then price_book * 2
    when surname = 'Иванова' then price_book - 50
    else price_book
end
LIMIT 1000;
select * from tempbooks