USE `HotelDerTuin`;

INSERT INTO `Rooms` (`RoomNumber`, `Description`, `Price`, `Status`) VALUES
(101, 'Cozy single room with a garden view.', 75.00, 'available'),
(102, 'Modern double room with a balcony.', 120.00, 'available'),
(103, 'Spacious suite with a king-sized bed.', 200.00, 'available'),
(104, 'Single room with minimalist decor.', 80.00, 'available'),
(105, 'Double room with city view and a workspace.', 130.00, 'available'),
(106, 'Luxury suite with jacuzzi and private terrace.', 300.00, 'available'),
(107, 'Economy room with essential amenities.', 60.00, 'available'),
(108, 'Family room with two queen-sized beds.', 180.00, 'available'),
(109, 'Deluxe room with sea view and free minibar.', 250.00, 'available'),
(110, 'Penthouse suite with VIP services.', 500.00, 'available');

INSERT INTO `Users` (`Name`, `Email`, `PhoneNumber`, `Password`, `Role`) VALUES
('Alice Johnson', 'alice@example.com', '123-456-7890', '$2y$10$1aNvdT/kAKiR3OhmIwKFL.f2MhGJtMTSYncT7WrjRzOwQFgSRRQy2', 'Customer'), -- "password123"
('Bob Smith', 'bob@example.com', '234-567-8901', '$2y$10$UqCkDwDqZxO6sENrFyGVAu3rslOQ05huuMymVV4zy/.dDq0WvoS.6', 'Customer'), -- "securepass"
('Charlie Brown', 'charlie@example.com', '345-678-9012', '$2y$10$7FJAE1INjOT7sLj5ikQcX.y4ZRw4OBb1Hs0M4LZaiMEK5XFPu1I3m', 'Customer'), -- "mypassword"
('David Wilson', 'david@example.com', '456-789-0123', '$2y$10$6MqNVpCzdpdAeYp9BwnpEusIQf75oE/qHll5H2lHoP4ubM04G5C8q', 'Customer'), -- "letmein"
('Emma Davis', 'emma@example.com', '567-890-1234', '$2y$10$zKgxZxsb6vERyf2FKObFdeIcWp1L1P3ZTz1Mkgcz5scUHwDqCN6Ca', 'Customer'), -- "pass1234"
('Frank White', 'frank@example.com', '678-901-2345', '$2y$10$2Pb4mOXVcGQYhTiz9hHgN.Pebc6i0qVqkjWQRGHzEch9GkeXeZW6a', 'Customer'), -- "frankiepass"
('Grace Hall', 'grace@example.com', '789-012-3456', '$2y$10$5G3EJWFLjTj3Ow1mWmYxlO/bX1jv0y/FslxQuOydKq5lYhF3XyYmO', 'Customer'), -- "grace2024"
('Hannah Scott', 'hannah@example.com', '890-123-4567', '$2y$10$eF6M8.W4w0Hvz9vB.yEIAOjlEpzE3m.ZmYFV3yt5AlBOrImB5U3R.', 'Customer'), -- "hannahrules"
('Ian Thomas', 'ian@example.com', '901-234-5678', '$2y$10$ak1MPyMo/2Iofbrs.9f5/OAEX2b.WW8M7SlFBcYkXWr3NEPRzFRZ.', 'Employee'), -- "iansecure"
('Jane Miller', 'jane@example.com', '012-345-6789', '$2y$10$7muhEFmtEFPRCfMoDShIk.WuvOTh6tyCz1zt8KN/sK6bf80Q5n5ZK', 'Employee'); -- "janeadmin"

