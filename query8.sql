SELECT carservice.Date, staff.Name
FROM client
JOIN car ON car.Owner = Client.ClientID 
JOIN carservice ON carservice.VehicleID=car.CarID 
JOIN staff ON staff.TRN=carservice.EngineerID
WHERE client.Name='Dan Bilzerian' AND car.Make='BUGATTI' AND car.Model='Chirron';