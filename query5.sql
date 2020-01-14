SELECT carsale.Date, car.Price, car.Make , car.Model
FROM staff
JOIN  carsale ON staff.TRN=carsale.SalesmanID
JOIN car ON carsale.VehicleID=car.carID

WHERE staff.TRN=748541222  AND carsale.Date >  ADDDATE(CURDATE(), INTERVAL -2 YEAR)

UNION

SELECT motosale.Date, moto.Price,moto.Make, moto.Model
FROM staff
JOIN  motosale ON staff.TRN=motosale.SalesmanID
JOIN moto ON motosale.VehicleID=moto.MotoID

WHERE staff.TRN=748541222  AND motosale.Date >  ADDDATE(CURDATE(), INTERVAL -2 YEAR)