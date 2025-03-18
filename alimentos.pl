es_un(alimento, superclase).

es_un(fruta, alimento).
es_un(verdura, alimento).
es_un(carne, alimento).
es_un(lacteo, alimento).
es_un(grano, alimento).
es_un(aceite, alimento).

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

es_un(lechuga, verdura).
es_un(zanahoria, verdura).
es_un(brocoli, verdura).
es_un(espinaca, verdura).
es_un(tomate, verdura).
es_un(papa, verdura).
es_un(cebolla, verdura).
es_un(pepino, verdura).
es_un(pimiento, verdura).
es_un(remolacha, verdura).

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

es_un(arroz, grano).
es_un(trigo, grano).
es_un(avena, grano).
es_un(maiz, grano).
es_un(cebada, grano).
es_un(centeno, grano).
es_un(quinua, grano).
es_un(amaranto, grano).
es_un(mijo, grano).
es_un(sorgo, grano).

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

% Macronutrientes por superclase
tiene(alimento, [carbohidratos, proteinas, grasas]).

tiene(fruta, [carbohidratos, bajas grasas, bajas proteinas]).
tiene(carne, [altas proteinas, bajas grasas, sin carbohidratos]).
tiene(aceite, [altas grasas, sin proteinas, sin carbohidratos]).
tiene(verdura, [carbohidratos, bajas proteinas, bajas grasas]).
tiene(grano, [altos carbohidratos, bajas grasas, bajas proteinas]).
tiene(lacteo, [proteinas, grasas, carbohidratos]).

% Reglas para asignar macronutrientes según categoría
tiene_macronutriente(Alimento, proteinas) :- es_un(Alimento, carne).
tiene_macronutriente(Alimento, carbohidratos) :- es_un(Alimento, grano).
tiene_macronutriente(Alimento, grasas) :- es_un(Alimento, aceite).
tiene_macronutriente(Alimento, carbohidratos) :- es_un(Alimento, fruta).
tiene_macronutriente(Alimento, carbohidratos) :- es_un(Alimento, verdura).
tiene_macronutriente(Alimento, proteinas) :- es_un(Alimento, lacteo).
tiene_macronutriente(Alimento, grasas) :- es_un(Alimento, lacteo).
no_tiene_macronutriente(Alimento, Nutriente) :- \+ tiene_macronutriente(Alimento, Nutriente).

% Reglas para heredar categorías
es_un_2(X, Y) :- es_un(X, Y).
es_un_2(X, Y) :- es_un(X, Z), es_un_2(Z, Y).
hereda_macronutriente(Instancia, Nutriente) :- es_un_2(Instancia, Categoria), tiene_macronutriente(Categoria, Nutriente).

%posibles busquedas
%?- es_un(pollo, carne).
%?- inst(parmesano, X).
%?- es_un_2(salmon, alimento).
%?- tiene(carne, X).
%?- tiene_macronutriente(pollo, proteinas).
%?- tiene_macronutriente(X, proteinas).
%?- no_tiene_macronutriente(pollo, carbohidratos).
%?- hereda_macronutriente(salmon, X).
%?- es_un(X, Y).
%?- es_un_2(X, alimento).
