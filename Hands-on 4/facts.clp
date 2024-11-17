(deffacts smartphones-iniciales
    "Hechos iniciales sobre smartphones disponibles"

    (Smartphone 
        (marca Apple) 
        (modelo "iPhone 14") 
        (almacenamiento 128) 
        (ram 4) 
        (precio 999.99) 
        (cantidad 10))

    (Smartphone 
        (marca Samsung) 
        (modelo "Galaxy S23") 
        (almacenamiento 256) 
        (ram 8) 
        (precio 899.99) 
        (cantidad 5))

    (Smartphone 
        (marca Google) 
        (modelo "Pixel 8") 
        (almacenamiento 128) 
        (ram 6) 
        (precio 799.99) 
        (cantidad 7))

    (Smartphone 
        (marca Xiaomi) 
        (modelo "Redmi Note 12") 
        (almacenamiento 64) 
        (ram 4) 
        (precio 299.99) 
        (cantidad 15))

    (Smartphone 
        (marca OnePlus) 
        (modelo "OnePlus 11") 
        (almacenamiento 512) 
        (ram 12) 
        (precio 1099.99) 
        (cantidad 3))
)

(deffacts computadoras-iniciales
    "Hechos iniciales sobre computadores disponibles"

    (Computador 
        (marca Dell) 
        (modelo "XPS 15") 
        (tipo Laptop) 
        (almacenamiento 512) 
        (ram 16) 
        (procesador "Intel Core i7") 
        (precio 1499.99) 
        (cantidad 8))

    (Computador 
        (marca HP) 
        (modelo "Pavilion 24") 
        (tipo Desktop) 
        (almacenamiento 1024) 
        (ram 16) 
        (procesador "AMD Ryzen 5") 
        (precio 1099.99) 
        (cantidad 5))

    (Computador 
        (marca Apple) 
        (modelo "MacBook Pro 16") 
        (tipo Laptop) 
        (almacenamiento 1024) 
        (ram 32) 
        (procesador "Apple M2 Pro") 
        (precio 2499.99) 
        (cantidad 3))

    (Computador 
        (marca Lenovo) 
        (modelo "ThinkPad X1 Carbon") 
        (tipo Laptop) 
        (almacenamiento 512) 
        (ram 16) 
        (procesador "Intel Core i5") 
        (precio 1299.99) 
        (cantidad 10))

    (Computador 
        (marca ASUS) 
        (modelo "ROG Strix") 
        (tipo Desktop) 
        (almacenamiento 2048) 
        (ram 32) 
        (procesador "AMD Ryzen 7") 
        (precio 1999.99) 
        (cantidad 4))
)

(deffacts accesorios-iniciales
    "Hechos iniciales sobre accesorios disponibles"

    (Accesorio 
        (tipo Cargador) 
        (marca Apple) 
        (compatible-con "iPhone 14, iPhone 13, iPhone 12") 
        (precio 29.99) 
        (cantidad 50))

    (Accesorio 
        (tipo Audífonos) 
        (marca Sony) 
        (compatible-con "Bluetooth") 
        (precio 199.99) 
        (cantidad 30))

    (Accesorio 
        (tipo Funda) 
        (marca Samsung) 
        (compatible-con "Galaxy S23, Galaxy S22") 
        (precio 29.99) 
        (cantidad 70))

    (Accesorio 
        (tipo Cargador) 
        (marca Anker) 
        (compatible-con "Android, iPhone") 
        (precio 15.99) 
        (cantidad 100))

    (Accesorio 
        (tipo Mouse) 
        (marca Logitech) 
        (compatible-con "Windows, macOS") 
        (precio 49.99) 
        (cantidad 40))

    (Accesorio 
        (tipo Teclado) 
        (marca Corsair) 
        (compatible-con "Windows, macOS") 
        (precio 129.99) 
        (cantidad 25))
)

(deffacts clientes-iniciales
    "Hechos iniciales sobre los clientes"

    (Cliente 
        (nombre "Juan Pérez") 
        (id 1) 
        (correo "juan.perez@example.com") 
        (telefono "555-1234") 
        (direccion "Calle Principal #123, Ciudad A"))

    (Cliente 
        (nombre "María López") 
        (id 2) 
        (correo "maria.lopez@example.com") 
        (telefono "555-5678") 
        (direccion "Avenida Central #45, Ciudad B"))

    (Cliente 
        (nombre "Carlos García") 
        (id 3) 
        (correo "carlos.garcia@example.com") 
        (telefono "555-9876") 
        (direccion "Colonia Verde #89, Ciudad C"))

    (Cliente 
        (nombre "Ana Torres") 
        (id 4) 
        (correo "ana.torres@example.com") 
        (telefono "555-4321") 
        (direccion "Boulevard Norte #12, Ciudad D"))

    (Cliente 
        (nombre "Luis Martínez") 
        (id 5) 
        (correo "luis.martinez@example.com") 
        (telefono "555-8765") 
        (direccion "Barrio Azul #34, Ciudad E"))
)

(deffacts tarjetas-de-credito-iniciales
    "Hechos iniciales sobre las tarjetas de crédito de los clientes"

    (TarjetaDeCredito 
        (cliente-id 1) 
        (numero "1234-5678-9012-3456") 
        (banco BBVA) 
        (fecha-expiracion "2026-08") 
        (limite 5000.00) 
        (disponible 3000.00))

    (TarjetaDeCredito 
        (cliente-id 2) 
        (numero "2345-6789-0123-4567") 
        (banco HSBC) 
        (fecha-expiracion "2025-11") 
        (limite 10000.00) 
        (disponible 7500.00))

    (TarjetaDeCredito 
        (cliente-id 3) 
        (numero "3456-7890-1234-5678") 
        (banco Citibanamex) 
        (fecha-expiracion "2027-03") 
        (limite 15000.00) 
        (disponible 15000.00))

    (TarjetaDeCredito 
        (cliente-id 4) 
        (numero "4567-8901-2345-6789") 
        (banco Santander) 
        (fecha-expiracion "2026-01") 
        (limite 8000.00) 
        (disponible 5000.00))

    (TarjetaDeCredito 
        (cliente-id 5) 
        (numero "5678-9012-3456-7890") 
        (banco Scotiabank) 
        (fecha-expiracion "2024-12") 
        (limite 6000.00) 
        (disponible 2500.00))
)

(deffacts vales-iniciales
    "Hechos iniciales sobre vales o cupones de descuento"

    (Vale 
        (codigo "VALE10") 
        (descuento 10.00) 
        (fecha-expiracion "2024-12-31") 
        (cliente-id 1) 
        (condiciones "Descuento aplicable en compras mayores a $100.00"))

    (Vale 
        (codigo "PRIME20") 
        (descuento 20.00) 
        (fecha-expiracion "2024-11-30") 
        (cliente-id 2) 
        (condiciones "Solo válido para smartphones de la marca Apple"))

    (Vale 
        (codigo "FREESHIP") 
        (descuento 0.00) 
        (fecha-expiracion "2024-12-15") 
        (cliente-id 3) 
        (condiciones "Envío gratis en cualquier compra superior a $50.00"))

    (Vale 
        (codigo "BLACKFRIDAY50") 
        (descuento 50.00) 
        (fecha-expiracion "2024-11-29") 
        (cliente-id -1) 
        (condiciones "Válido para todos los clientes en compras mayores a $500.00"))

    (Vale 
        (codigo "WELCOME15") 
        (descuento 15.00) 
        (fecha-expiracion "2024-12-31") 
        (cliente-id 4) 
        (condiciones "Descuento único por primera compra"))
)
