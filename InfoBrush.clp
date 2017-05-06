
;******************************************* INICIO INFOBRUSH: Distinguir pintor *******************************************

(defrule p-predominio
=>
   (printout t "Que predomina mas en la obra: el dibujo detallista sobre
   el color o el color sobre el dibujo?" crlf)
   (assert (respuesta(read))))

    (defrule r-dibujo
       ?respuesta <- (respuesta ?respuesta0-read&color)
    =>
       (retract ?respuesta)
       (assert(color-sobre-dibujo)))

    (defrule r-color
       ?respuesta <- (respuesta ?respuesta-read&dibujo)
    =>
       (retract ?respuesta)
       (assert(goya)))

(defrule p-concepto-interior
   (color-sobre-dibujo)
=>
   (printout t "El concepto y expresion del cuadro destacan sin fijarse en los detalles?" crlf)
   (assert (respuesta1(read))))

    (defrule r-concepto
       ?respuesta1 <- (respuesta1 ?respuesta1-read&si)
    =>
       (retract ?respuesta1)
       (assert(picasso)))

    (defrule r-detallista
       ?respuesta1 <- (respuesta1 ?respuesta1-read&no)
    =>
       (retract ?respuesta1)
       (assert(velazquez)))

;******************************************* ARTISTA: Francisco de Goya *******************************************

(defrule p-oscuridad
   (goya)
=>
   (printout t "Se trata de una obra oscura, de gama de colores triste?" crlf)
   (assert (respuesta2(read))))

    (defrule r-oscuridad
       ?respuesta2 <- (respuesta2 ?respuesta2-read&si)
    =>
       (retract ?respuesta2)
       (assert(obra-oscura)))

    (defrule r-aus-oscuridad
       ?respuesta2 <- (respuesta2 ?respuesta2-read&no)
    =>
       (retract ?respuesta2)
       (assert(ausencia-oscura)))

(defrule p-tematica-guerra
   (goya)
   (obra-oscura)
=>
   (printout t "Representa una tematica de guerra (Guerra de la Independencia)?" crlf)
   (assert (respuesta3(read))))

    (defrule r-tematica-guerra
       ?respuesta3 <- (respuesta3 ?respuesta3-read&si)
    =>
       (retract ?respuesta3)
       (assert(tematica-guerra)))

    (defrule r-ausencia-guerra
      ?respuesta3 <- (respuesta3 ?respuesta3-read&no)
    =>
      (retract ?respuesta3)
      (assert(ausencia-guerra)))

(defrule p-escena-cotidiana
  (goya)
  (ausencia-oscura)
=>
  (printout t "Describe una situacion cotidiana o de diversion de la nobleza de la epoca?" crlf)
  (assert (respuesta4(read))))

    (defrule r-escena-cotidiana
      ?respuesta4 <- (respuesta4 ?respuesta4-read&si)
    =>
      (retract ?respuesta4)
      (assert(escena-cotidiana)))

    (defrule r-ausencia-cotidiana
      ?respuesta4 <- (respuesta4 ?respuesta4-read&no)
    =>
      (retract ?respuesta4)
      (assert(ausencia-cotidiana)))

(defrule p-nobleza-realeza
  (goya)
  (ausencia-oscura)
  (ausencia-cotidiana)
=>
  (printout t "Las personas que aparecen en el cuadro pertenecen a la nobleza o a la monarquia?" crlf)
  (assert (respuesta5(read))))

    (defrule r-nobleza
      ?respuesta5 <- (respuesta5 ?respuesta5-read&nobleza)
    =>
      (retract ?respuesta5)
      (assert(retrato-nobleza)))

    (defrule r-monarquia
      ?respuesta5 <- (respuesta5 ?respuesta5-read&monarquia)
    =>
      (retract ?respuesta5)
      (assert(retrato-monarquia)))

;******************************************* ARTISTA: Pablo Ruiz Picasso *******************************************

(defrule p-figuras-geometricas
  (color-sobre-dibujo)
  (picasso)
=>
  (printout t "La obra se caracteriza por presentar figuras geometricas?" crlf)
  (assert (respuesta6(read))))

    (defrule r-figuras
      ?respuesta6 <- (respuesta6 ?respuesta6-read&si)
    =>
      (assert(cubismo)))

    (defrule r-ausencia-figuras
      ?respuesta6 <- (respuesta6 ?respuesta6-read&no)
    =>
      (assert(ausencia-cubismo)))

(defrule p-cubismo
  (color-sobre-dibujo)
  (picasso)
  (cubismo)
=>
  (printout t "Las figuras se descomponen en multiples figuras geometricas o se reducen a formas esenciales?" crlf)
  (assert(respuesta7(read))))

    (defrule r-multiples-figuras
      ?respuesta7 <- (respuesta7 ?respuesta7-read&multiples figuras)
    =>
      (assert(multiples-figuras)))

    (defrule r-formas-esenciales
      ?respuesta7 <- (respuesta7 ?respuesta7-read&formas esenciales)
    =>
      (assert(formas-esenciales)))

(defrule p-color-destacado
  (color-sobre-dibujo)
  (picasso)
  (ausencia-cubismo)
=>
  (printout t "Destaca algun color en la gama cromatica de la obra? Azul, Rosa o Neutral" crlf)
  (assert(respuesta8(read))))

    (defrule r-color-azul
      ?respuesta8 <- (respuesta8 ?respuesta8-read&azul)
    =>
      (assert(gama-azul)))

    (defrule r-color-rosa
      ?respuesta8 <- (respuesta8 ?respuesta8-read&rosa)
    =>
      (assert(gama-rosa)))

    (defrule r-color-neutral
      ?respuesta8 <- (respuesta8 ?respuesta8-read&neutral)
    =>
      (assert(gama-neutral)))

;******************************************* ARTISTA: Diego Velázquez *******************************************

(defrule p-tematica-mitologica
  (color-sobre-dibujo)
  (velazquez)
=>
  (printout t "Aparecen personajes mitologicos en la obra?" crlf)
  (assert(respuesta9(read))))

    (defrule r-mitologia
      ?respuesta9 <- (respuesta9 ?respuesta9-read&si)
    =>
      (assert(mitologia)))

    (defrule r-ausencia-mitologia
      ?respuesta9 <- (respuesta9 ?respuesta9-read&no)
    =>
      (assert(ausencia-mitologia)))

(defrule p-mundanos-epoca
  (color-sobre-dibujo)
  (velazquez)
  (mitologia)
=>
  (printout t "Estos personajes mitologicos aparecen junto a personas normales de la epoca?" crlf)
  (assert(respuesta10(read))))

    (defrule r-epoca
      ?respuesta10 <- (respuesta10 ?respuesta10-read&si)
    =>
      (assert(junto-mundanos)))

    (defrule r-ausencia-mundanos
      ?respuesta10 <- (respuesta10 ?respuesta10-read&no)
    =>
      (assert(ausencia-mundanos)))

(defrule p-influencia-clasica
  (color-sobre-dibujo)
  (velazquez)
  (mitologia)
  (ausencia-mundanos)
=>
  (printout t "Se influencia en obras clasicas? (Cuerpos esculturales, proporcion de belleza antigua...)" crlf)
  (assert(respuesta11(read))))

    (defrule r-influenciado
      ?respuesta11 <- (respuesta11 ?respuesta11-read&si)
    =>
      (assert(influencia-antigua)))

    (defrule r-ausencia-influencia
      ?respuesta11 <- (respuesta11 ?respuesta11-read&no)
    =>
      (assert(ausencia-influencia-antigua)))

(defrule p-deidades-mendigas
  (color-sobre-dibujo)
  (velazquez)
  (mitologia)
  (ausencia-mundanos)
  (ausencia-influencia-antigua)
=>
  (printout t "Aparecen representados como mendigos y rufianes en primer plano?" crlf)
  (assert(respuesta12(read))))

    (defrule r-rufianes
      ?respuesta12 <- (respuesta12 ?respuesta12-read&si)
    =>
      (assert(rufianes)))

    (defrule r-naturales
      ?respuesta12 <- (respuesta12 ?respuesta12-read&no)
    =>
      (assert(ausencia-rufianes)))

(defrule p-costumbrista
  (color-sobre-dibujo)
  (velazquez)
  (ausencia-mitologia)
=>
  (printout t "Dominan una idea natural y costumbrista en la obra?" crlf)
  (assert(respuesta13(read))))

(defrule r-genero
  ?respuesta13 <- (respuesta13 ?respuesta13-read&si)
=>
  (assert(obra-genero)))

(defrule r-ausencia-genero
  ?respuesta13 <- (respuesta13 ?respuesta13-read&no)
=>
  (assert(ausencia-genero)))

(defrule p-gama-terrosa
  (color-sobre-dibujo)
  (velazquez)
  (ausencia-mitologia)
  (obra-genero)
=>
  (printout t "La gama cromatica es oscura y de colores terrosos?" crlf)
  (assert(respuesta14(read))))

    (defrule r-oscura
      ?respuesta14 <- (respuesta14 ?respuesta14-read&si)
    =>
      (assert(gama-oscura)))

    (defrule r-costumbrista
      ?respuesta14 <- (respuesta14 ?respuesta14-read&no)
    =>
      (assert(ausencia-oscuridad)))

(defrule p-triunfo-monarquia
  (color-sobre-dibujo)
  (velazquez)
  (ausencia-mitologia)
  (ausencia-genero)
=>
  (printout t "Trata temas como la guerra y la victoria de la monarquia?" crlf)
  (assert(respuesta15(read))))

    (defrule r-guerra
      ?respuesta15 <- (respuesta15 ?respuesta15-read&si)
    =>
      (assert(guerra)))

    (defrule r-ausencia-guerra
      ?respuesta15 <- (respuesta15 ?respuesta15-read&no)
    =>
      (assert(ausencia-guerra)))

(defrule p-tipo-retratos
  (color-sobre-dibujo)
  (velazquez)
  (ausencia-mitologia)
  (ausencia-genero)
  (ausencia-guerra)
=>
  (printout t "Que tipo de personas y de que forma aparecen retratadas? A caballo, religiosas, bufones o enanos o familia real")
  (assert(respuesta16(read))))

    (defrule r-ecuestes
      ?respuesta16 <- (respuesta16 ?respuesta16-read&a caballo)
    =>
      (assert(ecueste)))

    (defrule r-vaticano
      ?respuesta16 <- (respuesta16 ?respuesta16-read&religiosa)
    =>
      (assert(vaticano)))

    (defrule r-bufones
      ?respuesta16 <- (respuesta16 ?respuesta16-read&bufon)
    =>
      (assert(bufones)))

    (defrule r-enanos
      ?respuesta16 <- (respuesta16 ?respuesta16-read&enano)
    =>
      (assert(enanos)))

    (defrule r-monarquia
      ?respuesta16 <- (respuesta16 ?respuesta16-read&familia real)
    =>
      (assert(monarquia)))

;******************************************* CONCLUSIONES: Francisco de Goya *******************************************

(defrule goya-guerra
   (goya)
   (obra-oscura)
   (tematica-guerra)
=>
   (printout t "Se trata de la epoca de guera de Goya, basada en la guerra de la independencia." crlf))

(defrule goya-pinturas-negras
  (goya)
  (obra-oscura)
  (ausencia-guerra)
=>
  (printout t "Se trata de las pinturas negras." crlf))

(defrule goya-primeros-encargos
  (goya)
  (ausencia-oscura)
  (escena-cotidiana)
=>
  (printout t "Se trata de los primeros encargos." crlf))

(defrule goya-retratistico
  (goya)
  (ausencia-oscura)
  (ausencia-cotidiana)
  (retrato-nobleza)
=>
  (printout t "Faceta retratistica." crlf))

(defrule goya-pintor-camara
  (goya)
  (ausencia-oscura)
  (ausencia-cotidiana)
  (retrato-monarquia)
=>
  (printout t "Goya nombrado pintor de camara de Carlos IV." crlf))

;******************************************* CONCLUSIONES: Pablo Ruiz Picasso *******************************************

(defrule cubismo-analitico
  (color-sobre-dibujo)
  (picasso)
  (cubismo)
  (multiples-figuras)
=>
  (printout t "Cubismo analitico." crlf))

(defrule cubismo-sintetico
  (color-sobre-dibujo)
  (picasso)
  (cubismo)
  (formas-esenciales)
=>
  (printout t "Cubismo sintetico." crlf))

(defrule epoca-azul
  (color-sobre-dibujo)
  (picasso)
  (ausencia-cubismo)
  (gama-azul)
=>
  (printout t "Epoca azul" crlf))

(defrule epoca-rosa
  (color-sobre-dibujo)
  (picasso)
  (ausencia-cubismo)
  (gama-rosa)
=>
  (printout t "Epoca rosa." crlf))

(defrule epoca-clasica
  (color-sobre-dibujo)
  (picasso)
  (ausencia-cubismo)
  (gama-neutral)
=>
  (printout t "Epoca clasica." crlf))

;******************************************* CONCLUSIONES: Diego Velázquez *******************************************

;Ejemplo de OR (mitologia|retratos-vaticano)

(defrule etapa-sevillana
  (color-sobre-dibujo)
  (velazquez)
  (ausencia-mitologia)
  (obra-genero)
  (gama-oscura)
=>
  (printout t "Etapa sevillana." crlf))

(defrule primera-madrileña
  (color-sobre-dibujo)
  (velazquez)
  (mitologia)
  (junto-mundanos)
=>
  (printout t "Primera etapa madrileña." crlf))

(defrule primer-viaje-italia
  (color-sobre-dibujo)
  (velazquez)
  (mitologia)
  (ausencia-mundanos)
  (influencia-antigua)
=>
  (printout t "Primer viaje a Italia." crlf))

;Segunda madrileña y segundo viaje a italia

(defrule segunda-madrileña
  (color-sobre-dibujo)
  (velazquez)
  (ausencia-mitologia|mitologia)
  (ausencia-genero|ausencia-mundanos)
  (guerra|ausencia-influencia-antigua&rufianes)
=>
  (printout t "Segunda etapa madriñela." crlf))

(defrule segundo-viaje-italia
  (color-sobre-dibujo)
  (velazquez)
  (ausencia-mitologia|mitologia)
  (ausencia-genero|ausencia-mundanos)
  (ausencia-guerra|ausencia-influencia-antigua)
  (vaticano|ausencia-rufianes)
=>
  (printout t "Segundo viaje a Italia." crlf))

(defrule tercera-madrileña
  (color-sobre-dibujo)
  (velazquez)
  (ausencia-mitologia)
  (obra-genero)
  (ausencia-oscuridad)
=>
  (printout t "Tercera etapa madrileña." crlf))
