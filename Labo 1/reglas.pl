:- consult('hechos.pl').

jefe_recompensa_alta(Jefe) :-
    jefe(Jefe, Bioma),
    dificultad(Bioma, Nivel),
    (Nivel == alto ; Nivel == muy_alto).

peligro_nocturno(Bioma) :-
    bioma(Bioma),
    ( (jefe(Ent, Bioma), aparece_de_noche(Ent))
    ; (enemigo(Ent, Bioma), aparece_de_noche(Ent))
    ).

requiere_preparacion_especial(Bioma) :-
    bioma(Bioma),
    ( requiere_resistencia_fuego(Bioma)
    ; dificultad(Bioma, alto)
    ; dificultad(Bioma, muy_alto)
    ).

puede_craftearse_en(Item, Bioma) :-
    craftea(Item, Material, _),
    obtenido_en(Material, Bioma).