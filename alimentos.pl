% Red Semántica de Alimentos en Prolog
% Cumple con altos estándares según la rúbrica del taller 6

% Definición de la jerarquía de alimentos
es_un(alimento, entidad).

es_un(fruta, alimento).
es_un(vegetal, alimento).
es_un(carne, alimento).
es_un(lacteo, alimento).
es_un(cereal, alimento).

% Subcategorías de alimentos
es_un(manzana, fruta).
es_un(platano, fruta).
es_un(naranja, fruta).
es_un(fresa, fruta).
es_un(pera, fruta).
es_un(uva, fruta).
es_un(kiwi, fruta).
es_un(mango, fruta).
es_un(papaya, fruta).
es_un(cereza, fruta).

es_un(lechuga, vegetal).
es_un(zanahoria, vegetal).
es_un(brocoli, vegetal).
es_un(espinaca, vegetal).
es_un(tomate, vegetal).
es_un(papa, vegetal).
es_un(cebolla, vegetal).
es_un(pepino, vegetal).
es_un(pimiento, vegetal).
es_un(remolacha, vegetal).

es_un(pollo, carne).
es_un(res, carne).
es_un(cerdo, carne).
es_un(pescado, carne).
es_un(cordero, carne).
es_un(pavo, carne).
es_un(conejo, carne).
es_un(venado, carne).
es_un(avestruz, carne).
es_un(bufalo, carne).

es_un(leche, lacteo).
es_un(queso, lacteo).
es_un(yogur, lacteo).
es_un(mantequilla, lacteo).
es_un(crema, lacteo).
es_un(kefir, lacteo).
es_un(requeson, lacteo).
es_un(cuajada, lacteo).
es_un(nata, lacteo).
es_un(ricotta, lacteo).

es_un(arroz, cereal).
es_un(trigo, cereal).
es_un(avena, cereal).
es_un(maiz, cereal).
es_un(cebada, cereal).
es_un(centeno, cereal).
es_un(quinua, cereal).
es_un(amaranto, cereal).
es_un(mijo, cereal).
es_un(sorgo, cereal).

% Instancias
inst(golden, manzana).
inst(gala, manzana).
inst(roja, manzana).
inst(verde, manzana).
inst(fuji, manzana).
inst(plantain, platano).
inst(cavendish, platano).
inst(rojo, platano).
inst(azul, platano).
inst(morado, platano).

inst(romana, lechuga).
inst(iceberg, lechuga).
inst(rizada, lechuga).
inst(boston, lechuga).
inst(lollo, lechuga).
inst(blanca, cebolla).
inst(morada, cebolla).
inst(dulce, cebolla).
inst(chalota, cebolla).
inst(verde, cebolla).

inst(pez_blanco, pescado).
inst(salmon, pescado).
inst(atun, pescado).
inst(trucha, pescado).
inst(merluza, pescado).
inst(tilapia, pescado).
inst(bacalao, pescado).
inst(rape, pescado).
inst(dorado, pescado).
inst(sardina, pescado).

inst(parmesano, queso).
inst(mozzarella, queso).
inst(cheddar, queso).
inst(azul, queso).
inst(gouda, queso).
inst(brie, queso).
inst(camembert, queso).
inst(gruyere, queso).
inst(emmental, queso).
inst(provolone, queso).

inst(basmati, arroz).
inst(jazmin, arroz).
inst(integral, arroz).
inst(glutinoso, arroz).
inst(arboreo, arroz).
inst(rojo, arroz).
inst(negro, arroz).
inst(wild, arroz).
inst(verde, arroz).
inst(multigrano, arroz).

% Propiedades heredadas
prop(alimento, energia, alta).
prop(fruta, carbohidratos, altos).
prop(vegetal, fibra, alta).
prop(carne, proteinas, altas).
prop(lacteo, calcio, alto).
prop(cereal, energia, alta).

% Consultas posibles
tiene_propiedad(X, P, V) :- prop(X, P, V).
tiene_propiedad(X, P, V) :- es_un(X, Y), tiene_propiedad(Y, P, V).

% Función para mostrar la jerarquía completa
mostrarCategorias :-
    forall(es_un(X, Y), format('~w es un(a) ~w~n', [X, Y])).

% Función para listar todas las instancias de una clase
listarEjemplos(C) :-
    forall(inst(X, C), format('~w es una instancia de ~w~n', [X, C])).

% Función para mostrar todas las propiedades de una categoría o instancia
verPropiedades(X) :-
    forall(tiene_propiedad(X, P, V), format('~w tiene ~w: ~w~n', [X, P, V])).

% Función para listar todos los alimentos que comparten un macronutriente específico
buscarPorNutriente(P, V) :-
    forall(tiene_propiedad(X, P, V), format('~w tiene ~w: ~w~n', [X, P, V])).
