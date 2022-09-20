<h1 align="center"> Laboratorio 2 Robótica industrial </h1>

## Universidad Nacional de Colombia
-------------------------------------------------------------
> ## Autores

  > - Carlos Mario Jiménez Novoa. [cajimn](https://github.com/cajimn)
  > - Ivanna Lisette Medina Cruz. [IvannaMedinac](https://github.com/IvannaMedinaC)
  > - Juan Sebastian Rangel Araque. [juanBananin](https://github.com/juanBananin)


## Procedimiento

> ## MATLAB

Para realizar la conexión con MATLAB se descargó el toolbox MATLAB ROS, luego se utilizaron las sigiuentes líneas de código: `roscore` en la primera terminal y `rosrun turtlesim turtlesim_node` en la segunda terminal, con esto ya se inicia el programa de turtlesim. 

![mat1](https://user-images.githubusercontent.com/51938754/191159316-b83342ee-dd84-4bd4-90d6-4a18f8050d39.png)


Para saber cuales son los nodes, topics y services del programa se introducen las siguientes líneas de código en un tercer terminal .


![mat5](https://user-images.githubusercontent.com/51938754/191159503-aa21de05-656b-44d0-a76c-2ba889d03193.png)

Primero se va a correr el programa [pruebatortuga](scripts/pruebatortuga.m) para obervar el resultado del movimiento de la tortuga haciendo uso del topic `turtle1/cmd_vel` y su respectivo publisher para enviar información, subscriber para recibirla y por ende cambiar el estado del topic.

![mat2](https://user-images.githubusercontent.com/51938754/191160162-ba412058-6894-47cb-995d-ac61213d503c.png)

Se observa que la tortuga se movió en X como se escribió en el código.

Luego, se procede a realizar la implementación del subscriber para el tópico `turtle1/pose`; para crear el subscriber se reciben dos argumentos: el tópico del cual se va a recibir información y el tipo de mensaje a recibir, en este caso se puede verificar el tipo de mensaje con el código.


![mat6](https://user-images.githubusercontent.com/51938754/191161123-b324b6dd-780c-4a07-8e67-0fa56981cceb.png)

Se observa la creación del subscriber y se accede al ùtimo mensaje con el comando `LatestMessage`

![mat7](https://user-images.githubusercontent.com/51938754/191161652-140778c3-5e53-4214-9584-b28b71f4dbed.png)

El tópico `turtle1/pose` solo tiene la posibilidad de suscribirse y por lo tanto no se le puede enviar información para mover la tortuga mediante un publisher. Por ende, se encuentra la opción de usar el servicio `/turtle1/teleport_absolute`, los servicios no funcionan mediante un subscriber y un publisher, estos funcionan por comunicación petición-respuesta, donde el cliente manda una petición de mensaje y espera la respuesta a través del servidor. 
El código completo se encuentra en [prueba2](scripts/prueba2.m) :

![mat3](https://user-images.githubusercontent.com/51938754/191162621-5d9412f9-5b0c-4b62-9c26-a7d61022b4e7.png)

La función `rossvclient` recibe como argumento el servicio, en este caso `/turtle1/teleport_absolute`. Se espera la respuesta del servidor con el comando `waitForServer(turtleTel)` y se crea el mensaje con `rosmessage`, el cual tiene varios argumentos: distancia en X, en Y y el ángulo de giro de la tortuga, estos son los que se manipulan para mover la tortuga a una posición deseada. Por último para que la tortuga se mueva, se usa la función `call` con los argumentos correspondientes de cliente y mensaje.

Se realiza otra prueba con valores distintos de X, Y y theta.
![mat4](https://user-images.githubusercontent.com/51938754/191163516-4f21a09c-a2ba-40ee-9afb-7b415092e7a5.png)

Para finalizar el modo maestro se usa el comando `rosshutdown`.


