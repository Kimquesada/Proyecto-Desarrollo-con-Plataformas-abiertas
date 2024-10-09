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

