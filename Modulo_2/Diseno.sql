-- Tabla de clientes
CREATE TABLE clientes (
    -- INTEGER porque el identificador es un número entero
    id_cliente INTEGER,

    -- VARCHAR(100) porque el nombre es texto de hasta 100 caracteres
    nombre VARCHAR(100),

    -- TEXT porque permite almacenar una biografía o notas de longitud variable
    perfil_bio TEXT,

    -- DATE porque solo necesitamos almacenar la fecha
    fecha_registro DATE
);

-- Tabla de productos
CREATE TABLE productos (
    -- INTEGER porque el identificador es un número entero
    id_producto INTEGER,

    -- VARCHAR(255) porque la descripción puede tener hasta 255 caracteres
    descripcion VARCHAR(255),

    -- DECIMAL(10,2) porque representa dinero con dos decimales
    precio DECIMAL(10,2),

    -- BOOLEAN para indicar si el producto está activo o no
    esta_activo BOOLEAN
);
