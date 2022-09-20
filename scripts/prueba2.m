%Movimiento tortuga
rosinit;
%Subscriber
% velPub = rospublisher('/turtle1/pose','turtlesim/Pose'); %Creacion publicador
turSub = rossubscriber('/turtle1/pose','turtlesim/Pose')
velMsg = turSub.LatestMessage

%%
% CLient-service (teleport_absolute) 
turtleTel = rossvcclient('/turtle1/teleport_absolute');
waitForServer(turtleTel);
turtleMsg = rosmessage(turtleTel);

turtleMsg.X = 1;
turtleMsg.Y = 8;
turtleMsg.Theta = 5*pi/3;

call(turtleTel,turtleMsg)

rosshutdown