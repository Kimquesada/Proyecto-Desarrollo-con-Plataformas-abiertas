-- Creación de la base de datos 
CREATE DATABASE TiendaRopa;
USE TiendaRopa;

-- Tabla Marca
CREATE TABLE Marca (
    ID_Marca INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Descripción VARCHAR(70),
    País_de_origen VARCHAR(20),
    Categoría VARCHAR(20),
    Contacto VARCHAR(30)
);

-- Tabla Prenda
CREATE TABLE Prenda (
    ID_Prenda INT AUTO_INCREMENT PRIMARY KEY,
    ID_Marca INT,
    Tipo_de_prenda VARCHAR(20) NOT NULL,
    Material VARCHAR(20),
    Talla VARCHAR(5),
    Color VARCHAR(20),
    Precio DECIMAL(6, 2) NOT NULL,
    Stock INT DEFAULT 0,
    FOREIGN KEY (ID_Marca) REFERENCES Marca(ID_Marca)
);

-- Tabla Ventas
CREATE TABLE Ventas (
    ID_venta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Metodo_pago VARCHAR(30),
    Total_venta DECIMAL(6, 2)
);

-- Tabla Detalle_Venta (tabla intermedia para evitar relación muchos a muchos entre Ventas y Prenda)
CREATE TABLE Detalle_Venta (
    ID_detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_prenda INT NOT NULL,
    ID_venta INT NOT NULL,
    Cantidad INT NOT NULL,
    Subtotal DECIMAL(6, 2),
    FOREIGN KEY (ID_prenda) REFERENCES Prenda(ID_Prenda),
    FOREIGN KEY (ID_venta) REFERENCES Ventas(ID_venta)
);

USE TiendaRopa;
-- Insertar datos en la tabla Marca
INSERT INTO Marca (Nombre, Descripción, País_de_origen, Categoría, Contacto)
VALUES
('Nike', 'Marca de ropa deportiva y accesorios', 'EE.UU.', 'Deportiva', 'contact@nike.com'),
('Adidas', 'Marca de calzado y ropa deportiva', 'Alemania', 'Deportiva', 'info@adidas.com'),
('Zara', 'Ropa de moda y accesorios', 'España', 'Casual', 'zara@zara.com'),
('H&M', 'Ropa de moda a precios asequibles', 'Suecia', 'Casual', 'support@hm.com'),
('Levis', 'Ropa de mezclilla y jeans', 'EE.UU.', 'Casual', 'levis@levis.com');

-- Insertar datos en la tabla Prenda
INSERT INTO Prenda (ID_Marca, Tipo_de_prenda, Material, Talla, Color, Precio, Stock)
VALUES
(1, 'Camiseta', 'Algodón', 'M', 'Blanco', 19.99, 50),
(2, 'Zapatillas', 'Sintético', '42', 'Negro', 59.99, 30),
(3, 'Chaqueta', 'Poliéster', 'L', 'Azul', 79.99, 20),
(4, 'Vestido', 'Seda', 'S', 'Rojo', 49.99, 15),
(5, 'Jeans', 'Denim', '32', 'Azul', 39.99, 25);

-- Insertar datos en la tabla Ventas
INSERT INTO Ventas (Fecha_venta, Metodo_pago, Total_venta)
VALUES
('2024-10-05 10:30:00', 'Tarjeta de crédito', 39.98),
('2024-10-06 14:15:00', 'Efectivo', 59.99),
('2024-10-07 11:00:00', 'PayPal', 79.99),
('2024-10-08 09:45:00', 'Tarjeta de débito', 49.99),
('2024-10-08 16:20:00', 'Transferencia bancaria', 119.97);

-- Insertar datos en la tabla Detalle_Venta
INSERT INTO Detalle_Venta (ID_prenda, ID_venta, Cantidad, Subtotal)
VALUES
(1, 1, 2, 39.98),  -- 2 Camisetas en la venta 1
(2, 2, 1, 59.99),  -- 1 Par de zapatos en la venta 2
(3, 3, 1, 79.99),  -- 1 Chaqueta en la venta 3
(4, 4, 1, 49.99),  -- 1 Vestido en la venta 3
(5, 5, 3, 119.97); -- 3 Jeans en la venta 5
