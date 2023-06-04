function xyz = magnusAnal(t, xyz, k, b)
    g = 9.81;
    m = 0.144;
    omega = 36;
    theta = 45;
    phi = 0;
    omega_x = omega * sind(theta) * cosd(phi);
    omega_y = omega * sind(theta) * sind(phi);
    omega_z = omega * cosd(theta);
    %dxdt=x^.
    xyz1 = xyz(2); 
    %dx^.dt=...
    xyz2 = k/m*(omega_y * xyz(6) - omega_z * xyz(4)) - b/m * xyz(2);
    %vy0
    xyz3 = xyz(4);
    %ay
    xyz4 = k/m*(omega_z * xyz(2) - omega_x * xyz(6)) - b/m * xyz(4);
    %vx0
    xyz5 = xyz(6);
    %az
    xyz6 = k/m*(omega_x * xyz(4) - omega_y * xyz(2)) -g - b/m * xyz(6);
    xyz = [xyz1;xyz2;xyz3;xyz4;xyz5;xyz6];
end