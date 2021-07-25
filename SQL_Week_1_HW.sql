#1. Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.
	SELECT MAX(dest)
	FROM flights;
    #The furthest destination is "XNA".
#2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result.
	SELECT DISTINCT(engine)
    FROM planes
    GROUP BY engine;
    
    SELECT engines, manufacturer, MAX(seats)
    FROM planes 
    GROUP BY engines;
#3. Show the total number of flights.
	SELECT DISTINCT engine
	FROM planes;
#4. Show the total number of flights by airline (carrier).
	SELECT DISTINCT(carrier), COUNT(*) 
	FROM flights
    GROUP BY carrier;
#5. Show all of the airlines, ordered by number of flights in descending order.
	SELECT DISTINCT(carrier), COUNT(*) AS num_flights 
	FROM flights
    GROUP BY carrier
    ORDER BY num_flights DESC;
#6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
	SELECT DISTINCT(carrier), COUNT(*) AS Num_Flights
	FROM flights
    GROUP BY carrier
	ORDER BY Num_Flights DESC
    LIMIT 5;
#7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.
	SELECT DISTINCT(carrier), COUNT(*) AS Num_Flights
	FROM flights
    WHERE distance >=1000
    GROUP BY carrier
	ORDER BY Num_Flights DESC
    LIMIT 5;
#8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.
# What is the highest departure delay for each carrier
	SELECT DISTINCT(carrier), MAX(dep_delay) AS DELAY
	FROM flights
	GROUP BY carrier
	ORDER BY Delay DESC;