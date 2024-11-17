(deftemplate Smartphone
    "Información sobre smartphones disponibles"
    (slot marca (type SYMBOL))
    (slot modelo (type STRING))
    (slot almacenamiento (type INTEGER))  ;; en GB
    (slot ram (type INTEGER))             ;; en GB
    (slot precio (type FLOAT))
    (slot cantidad (type INTEGER))        ;; Número de unidades disponibles
)

(deftemplate Computador
    "Información sobre computadores disponibles"
    (slot marca (type SYMBOL))
    (slot modelo (type STRING))
    (slot tipo (type SYMBOL))             ;; Ej: Laptop, Desktop
    (slot almacenamiento (type INTEGER))  ;; en GB
    (slot ram (type INTEGER))             ;; en GB
    (slot procesador (type STRING))
    (slot precio (type FLOAT))
    (slot cantidad (type INTEGER))        ;; Número de unidades disponibles
)

(deftemplate Accesorio
    "Información sobre accesorios disponibles"
    (slot tipo (type SYMBOL))             ;; Ej: Cargador, Audífonos
    (slot marca (type SYMBOL))
    (slot compatible-con (type STRING))   ;; Modelo(s) o marcas compatibles
    (slot precio (type FLOAT))
    (slot cantidad (type INTEGER))        ;; Número de unidades disponibles
)

(deftemplate Cliente
    "Información sobre los clientes"
    (slot nombre (type STRING))
    (slot id (type INTEGER))              ;; ID único del cliente
    (slot correo (type STRING))
    (slot telefono (type STRING))
    (slot direccion (type STRING))
)

(deftemplate OrdenDeCompra
    "Información sobre las órdenes de compra"
    (slot id-orden (type INTEGER))        ;; ID único de la orden
    (slot cliente-id (type INTEGER))      ;; ID del cliente que realiza la orden
    (slot fecha (type STRING))            ;; Fecha de la orden
    (multislot items)                     ;; Lista de items (Smartphones, Computadores, etc.)
    (slot total (type FLOAT))             ;; Total de la compra
    (slot estado (type SYMBOL))           ;; Ej: Procesando, Completado, Cancelado
)

(deftemplate TarjetaDeCredito
    "Información sobre las tarjetas de crédito de los clientes"
    (slot cliente-id (type INTEGER))      ;; ID del cliente
    (slot numero (type STRING))           ;; Número de tarjeta (cifrado en práctica real)
    (slot banco (type SYMBOL))
    (slot fecha-expiracion (type STRING))
    (slot limite (type FLOAT))
    (slot disponible (type FLOAT))        ;; Monto disponible
)

(deftemplate Vale
    "Información sobre vales o cupones de descuento"
    (slot codigo (type STRING))           ;; Código del vale
    (slot descuento (type FLOAT))         ;; Monto de descuento o porcentaje
    (slot fecha-expiracion (type STRING))
    (slot cliente-id (type INTEGER))      ;; ID del cliente (si aplica)
    (slot condiciones (type STRING))      ;; Descripción de las condiciones de uso
)

