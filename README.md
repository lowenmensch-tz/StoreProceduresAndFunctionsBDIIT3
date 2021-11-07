# Ejercicios sobre PL/SQL Unidad II
---

**NOTA**: Esta tarea se debe realizar en grupos, con los mismos integrantes que se conformó el grupo para el proyecto. Para realizar esta tarea deben trabajar con la base de datos *dietas_ganaderas*, la cual se encuentra en el campus virtual en los scripts que se han proporcionado para el desarrollo de la asignatura.  
Para cada ejercicio deben de entregar los comandos que utilizaron para corroborar el funcionamiento del procedimiento almacenado, de la función o del paquete, ya sea el bloque anónimo o las instrucciones utilizadas para comprobar el funcionamiento, además, de lo ya estipulado en la planificación didáctica de la asignatura.  
La tarea se debe entregar el martes 16 de noviembre a las 2:30 pm por tarde, mediante el campus virtual. Solamente un integrante del grupo debe entregar la solución.



### VALOR TOTAL DE LA TAREA 15%
1. Crear un procedimiento almacenado que guarde la información de una nueva toma.
Este procedimiento debe verificar que los valores de las llaves foráneas existan y en caso
de existir, se procederá a insertar la nueva toma. El procedimiento recibirá como
parámetros los valores que se desean insertar. El procedimiento debe informar o mostrar
si se pudo insertar o no el registro para la nueva toma.
2. Crear una función que retorne los datos de todos los animales que se tienen
almacenados en la base de datos. .
3. Crear un procedimiento almacenado que llame a la función del inciso 2 y que se
encargue de imprimir toda la información que retorna la función.
4. Crear un paquete que tenga una función, esta función retornará la cantidad de dietas
almacenadas en la base de datos. Luego el paquete también debe contener una función
que retorne la descripción de una dieta en específico, el código de la dieta se enviará
como parámetro de la función.
