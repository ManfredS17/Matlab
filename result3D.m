x0 = 0;
vx0 = 30;
y0 = 0;
vy0 = 17;
z0 = 1;
vz0 = 0;
xyz0 = [x0;vx0;y0;vy0;z0;vz0];
timeBegin = 0;
timeEnd = 10;
timeStep = 0.25;
times = timeBegin:timeStep:timeEnd;

[t, xyz] = ode45(@magnus3D, times, xyz0);
X_array=xyz(:,1);
Y_array=xyz(:,3);
Z_array=xyz(:,5);
Time=1;
step=length(xyz);

           while Time<step
               scatter3(X_array(Time), Y_array(Time), Z_array(Time))
               hold on;
               
               check=(Time-1)*timeStep;
               Time=Time+1;
           end