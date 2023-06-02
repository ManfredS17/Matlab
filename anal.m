data = xlsread('anal.xlsx', 'Fast');
times = data(2:14, 9);
z = data(2:14, 11);
y = data(2:14, 10);

x0 = 0;
vx0 = 0;
y0 = 0;
vy0 = 43.5;
z0 = 0;
vz0 = 0;
xyz0 = [x0;vx0;y0;vy0;z0;vz0];
min = [0,0,0];

for i=1:1:10
    b = 0.0001+0.0001*i;
    for j=1:1:100
        k = 0.0001+0.00001*i;
        [time, xyz] = ode45(@(t,xyz)magnusAnal(t, xyz, k, b), times, xyz0);
        if min == [0,0,0]
            min = [b, k, lsm(xyz, [x; z])];
            %min = [b, k, lsm(xyz, [z])];
        else
            %if min(3) > lsm(xyz, z)
            if min(3) > lsm(xyz, [y; z])
                min = [b, k, lsm(xyz, [y; z])]
                %min = [b, k, lsm(xyz, z)]
            end
        end
    end
end

X_array=xyz(:,1);
Y_array=xyz(:,3);
Z_array=xyz(:,5);