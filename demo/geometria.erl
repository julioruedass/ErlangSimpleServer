-module(geometria).
-import(math,[pi/0]).
%%-author('Maximilianoum Meridium Rueda').
-export([circulo_perimetro/1]).
-export([cuadrado_perimetro/1]).
-export([rectangulo_perimetro/2]).
-export([triangulo_perimetro/3]).

circulo_perimetro(R) ->
     2*R*pi().

cuadrado_perimetro(L) ->
    L*4.

rectangulo_perimetro(Base, Altura) ->
    (2 * Base)  + (2*Altura).

triangulo_perimetro(Base, Lado1, Lado2)->
    Base + Lado1 + Lado2.