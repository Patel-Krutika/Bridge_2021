# Krutika Patel

#1. Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.
	SELECT MAX(dest)
	FROM flights;
    #The furthest destination is "XNA".

#2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result.
	SELECT DISTINCT(engines)
    FROM planes
    GROUP BY engines;
    # 2, 1, 4, 3
    
    SELECT DISTINCT(engines), manufacturer, MAX(seats)
    FROM planes 
    GROUP BY engines;
	# '2', 'EMBRAER', '400'
	# '1', 'CESSNA', '16'
	# '4', 'AIRBUS INDUSTRIE', '450'
	# '3', 'AIRBUS', '379'
    
#3. Show the total number of flights.
	SELECT COUNT(*)
    FROM flights;
    #'336776'
    
#4. Show the total number of flights by airline (carrier).
	SELECT DISTINCT(carrier), COUNT(*) 
	FROM flights
    GROUP BY carrier;
    # UA	58665, AA	32729, B6	54635, DL	48110, EV	54173, MQ	26397, US	20536, WN	12275, VX	5162,
    #FL	3260, AS	714, 9E	18460, F9	685, HA	342, YV	601, OO	32
    
#5. Show all of the airlines, ordered by number of flights in descending order.
	SELECT DISTINCT(carrier), COUNT(*) AS NUM_FLIGHTS
	FROM flights
    GROUP BY carrier
    ORDER BY num_flights DESC;
    
    # UA	58665, B6	54635, EV	54173, DL	48110, AA	32729, MQ	26397, US	20536, 9E	18460, WN	12275,
    #VX	5162, FL	3260, AS	714, F9	685, YV	601, HA	342, OO	32
    
#6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
	SELECT DISTINCT(carrier), COUNT(*) AS Num_Flights
	FROM flights
    GROUP BY carrier
	ORDER BY Num_Flights DESC
    LIMIT 5;
    # UA	58665, B6	54635, EV	54173, DL	48110, AA	32729
    
#7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.
	SELECT DISTINCT(carrier), COUNT(*) AS Num_Flights
	FROM flights
    WHERE distance >=1000
    GROUP BY carrier
	ORDER BY Num_Flights DESC
    LIMIT 5;
    # UA	41135, B6	30022, DL	28096, AA	23583, EV	6248
#8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.

# What is the most popular destination
	SELECT DISTINCT(dest), COUNT(*) AS NUM_FLIGHTS
	FROM flights
    GROUP BY dest
    ORDER BY NUM_FLIGHTS DESC
    LIMIT 1;
    # ORD	17283
