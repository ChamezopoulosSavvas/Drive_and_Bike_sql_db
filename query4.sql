SELECT Make,Model,Date,Price	
FROM car
JOIN carsale ON Car.Owner=carsale.Client
WHERE car.Price > 100000 AND carsale.Date > ADDDATE(CURDATE(), INTERVAL -2 YEAR)

UNION

SELECT Make,Model,Date,Price	
FROM moto
JOIN motosale ON moto.Owner=motosale.Client
WHERE moto.Price >= 20000 AND motosale.Date > ADDDATE(CURDATE(), INTERVAL -2 YEAR)