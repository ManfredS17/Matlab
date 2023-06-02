function xyz = NewMagnus3D(t, xyz)
    g = 9.81;
    rho = 1.204;
    % r = 3.7cm
    A = 4.3e-3;
    m = 0.144;
    L = rho * A / 2;
    Cm = 0.2;
    % Cm = 0.2088;
    Cd = 0.204;
    % Cd = 0.21;
    omega = 232.16;
    theta = 45;
    phi = 0;
    omega_x = omega * sind(theta) * cosd(phi);
    omega_y = omega * sind(theta) * sind(phi);
    omega_z = omega * cosd(theta);
    %dxdt=x^.
    xyz1 = xyz(2); 
    %dx^.dt=...
    xyz2 = L/m*(Cm/omega*(omega_y * xyz(6) - omega_z * xyz(4))...
           - Cd * xyz(2)) * sqrt(xyz(2)^2+xyz(4)^2+xyz(6)^2);
    %vy0
    xyz3 = xyz(4);
    %ay
    xyz4 = L/m*(Cm/omega*(omega_z * xyz(2) - omega_x * xyz(6))...
           - Cd * xyz(4)) * sqrt(xyz(2)^2+xyz(4)^2+xyz(6)^2);
    %vx0
    xyz5 = xyz(6);
    %az
    xyz6 = L/m*(Cm/omega*(omega_x * xyz(4) - omega_y * xyz(2))... 
           - Cd * xyz(6)) * sqrt(xyz(2)^2+xyz(4)^2+xyz(6)^2)-g;
    xyz = [xyz1;xyz2;xyz3;xyz4;xyz5;xyz6];
end