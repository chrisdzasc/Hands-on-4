(defrule cust-not-buying
    (Cliente (id ?id) (nombre ?name))          ;; Usamos 'Cliente' en lugar de 'customer'
    (not (OrdenDeCompra (id-orden ?order) (cliente-id ?id)))  ;; Cambio 'order' por 'OrdenDeCompra'
    =>
    (printout t ?name " no ha comprado... nada!" crlf)
)

(defrule prods-bought
    (Cliente (id ?id) (nombre ?name))  ; Verificamos el cliente
    (OrdenDeCompra (cliente-id ?id) (items $?items) (total ?total) (estado Completado))
    (test (or (member$ Smartphone ?items) (member$ Computador ?items)))  ; Verificamos si hay Smartphone o Computador en la orden
    =>
    (printout t ?name " ha comprado un producto: " ?items crlf)
)

(defrule customer-shopping
   (Cliente (id ?id) (nombre ?cn))  ; Cambiar de 'customer' a 'Cliente' y 'name' a 'nombre'
   (OrdenDeCompra (id-orden ?order) (cliente-id ?id))  ; Cambiar 'order' a 'OrdenDeCompra'
   (Smartphone (modelo ?part) (precio ?price))  ; Asumimos que la línea de item es un producto de tipo Smartphone, adaptamos la plantilla 'Smartphone'
   =>
   (printout t ?cn " bought a product: " ?part crlf)) ; Imprimimos el nombre del cliente y el modelo del producto

(defrule promocion-iphone16-banamex
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (TarjetaDeCredito (cliente-id ?cliente-id) (banco Citibanamex) (numero ?numero) (limite ?limite))
   (test (and (member$ (Smartphone (modelo "iPhone 16")) ?items) (> ?limite 5000)))
   =>
   (printout t "¡Promoción! 24 meses sin intereses para el iPhone 16" crlf))

(defrule promocion-samsung-note21-liverpool
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (TarjetaDeCredito (cliente-id ?cliente-id) (banco Liverpool) (numero ?numero) (limite ?limite))
   (test (and (member$ (Smartphone (modelo "Samsung Note 21")) ?items) (> ?limite 3000)))
   =>
   (printout t "¡Promoción! 12 meses sin intereses para el Samsung Note 21" crlf))

(defrule promocion-macbook-iphone-al-contado
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (not (TarjetaDeCredito (cliente-id ?cliente-id)))
   (test (and (member$ (Smartphone (modelo "iPhone 16")) ?items) 
              (member$ (Computador (modelo "MacBook Air")) ?items)))
   =>
   (bind ?descuento (* 0.10 ?total))
   (printout t "Promoción: Obtienes " ?descuento " en vales por tu compra al contado." crlf))

(defrule promocion-accesorios-smartphone
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (test (exists (Smartphone (modelo ?modelo) (cantidad ?cantidad)) (member$ (Smartphone (modelo ?modelo)) ?items)))
   =>
   (bind ?descuento 0.15)
   (printout t "¡Promoción! 15% de descuento en accesorios para tu " ?modelo crlf))

(defrule promocion-iphone12-aceptacion
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo "iPhone 12") (precio ?precio))
   =>
   (printout t "¡Gracias por comprar el iPhone 12! Tu compra ha sido aceptada." crlf))

(defrule promocion-celulares-5g
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo ?modelo) (precio ?precio))
   (test (and (or (eq ?modelo "iPhone 16") (eq ?modelo "Samsung Galaxy 5G")) (> ?total 1000)))
   =>
   (printout t "Promoción: Elige tu accesorio con 20% de descuento para tu " ?modelo crlf))

(defrule promocion-celular-gama-alta
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo ?modelo) (precio ?precio))
   (test (and (member$ (Smartphone (modelo ?modelo)) ?items) (> ?total 5000)))
   =>
   (bind ?descuento (* 0.10 ?total))
   (printout t "¡Descuento de 10%! El total de tu compra es: " (- ?total ?descuento) crlf))

(defrule promocion-computadora-macbook-apple
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Computador (modelo "MacBook Pro") (precio ?precio))
   =>
   (printout t "¡Descuento especial en MacBook Pro por ser cliente habitual!" crlf))

(defrule promocion-smartphone-cargador
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo ?modelo) (precio ?precio))
   (Accesorio (tipo "Cargador") (precio ?precio-accesorio))
   =>
   (bind ?descuento (* 0.05 ?precio-accesorio))
   (printout t "¡Oferta! 5% de descuento en cargador por comprar un " ?modelo crlf))

(defrule oferta-smartphone-descontado
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo "iPhone 16") (precio ?precio))
   (test (> ?precio 5000))
   =>
   (bind ?descuento (* 0.10 ?precio))
   (printout t "¡Obtén un 10% de descuento por tu compra del iPhone 16!" crlf))

(defrule promocion-accesorios-gama-alta
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Accesorio (tipo ?tipo) (precio ?precio))
   (test (and (or (eq ?tipo "Audífonos") (eq ?tipo "Cargador")) (> ?precio 1000)))
   =>
   (bind ?descuento (* 0.15 ?precio))
   (printout t "¡Descuento del 15%! en accesorios premium." crlf))

(defrule promocion-laptop-compra
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Computador (tipo Laptop) (modelo ?modelo))
   =>
   (printout t "¡Compra una Laptop " ?modelo " y recibe un descuento en accesorios!" crlf))

(defrule promocion-orden-smartphone
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo ?modelo))
   =>
   (printout t "¡Gracias por comprar un " ?modelo "! Disfruta tu compra." crlf))

(defrule oferta-smartphone-gama-baja
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo ?modelo) (precio ?precio))
   (test (and (or (eq ?modelo "iPhone 12") (eq ?modelo "Samsung A50")) (< ?precio 4000)))
   =>
   (bind ?descuento (* 0.05 ?precio))
   (printout t "¡Obtén un 5% de descuento en tu " ?modelo "!" crlf))

(defrule promocion-combo-smartphone-computadora
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo ?modelo-smartphone))
   (Computador (modelo ?modelo-computadora))
   =>
   (printout t "¡Compra un " ?modelo-smartphone " y una " ?modelo-computadora "! Aprovecha descuentos combinados." crlf))

(defrule oferta-orden-completa
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   =>
   (printout t "¡Gracias por completar tu compra! Revisa nuestras ofertas de accesorios." crlf))

(defrule descuento-accesorio-smartphone
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo ?modelo) (precio ?precio))
   (Accesorio (tipo "Funda") (precio ?precio-accesorio))
   =>
   (bind ?descuento (* 0.15 ?precio-accesorio))
   (printout t "¡15% de descuento en fundas y accesorios con tu compra de " ?modelo crlf))

(defrule regalo-smartphone-iphone
   (OrdenDeCompra (id-orden ?orden-id) (cliente-id ?cliente-id) (items $?items) (total ?total) (estado Completado))
   (Smartphone (modelo "iPhone 16"))
   =>
   (printout t "¡Recibe un accesorio gratuito con la compra del iPhone 16!" crlf))
