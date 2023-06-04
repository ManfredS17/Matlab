data = xlsread('anal.xlsx', 'Sliders');
times = data(2:25, 9);
z = data(2:25, 13);
x = data(2:25, 11);
x0 = 0;
vx0 = 0;
y0 = 0;
vy0 = 38;
z0 = 0;
vz0 = 0;
xyz0 = [x0;vx0;y0;vy0;z0;vz0];
v = sqrt(vx0^2+vy0^2+vz0^2);

omega = 241;

r = 0.037;
S = r*omega/v;
if S < 0.1
    Cm = 1.5*S;
else
    Cm = 0.09+0.6*S;
end

min = [0,0,0];

for i=1:1:100
    Cd = 0.1+0.01*i;
        [time, xyz] = ode45(@(t,xyz)NewMagnusAnal(t, xyz,Cm, Cd), times, xyz0);
        if min == [0,0,0]
            min = [Cm, Cd, lsm(xyz, [x;z])];
            %min = [b, k, lsm(xyz, [z])];
        else
            %if min(3) > lsm(xyz, z)
            if min(3) > lsm(xyz, [x;z])
                min = [Cm, Cd, lsm(xyz, [x;z])]
                %min = [b, k, lsm(xyz, z)]
            end
        end
end

X_array=xyz(:,1);
Y_array=xyz(:,3);
Z_array=xyz(:,5);