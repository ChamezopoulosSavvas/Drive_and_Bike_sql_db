SELECT Make, Model, Year
FROM car
JOIN carsale ON Car.Owner=carsale.Client
WHERE carsale.Date > ADDDATE(CURDATE(), INTERVAL -3 YEAR);

