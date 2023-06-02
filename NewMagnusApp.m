function xyz = NewMagnusApp(t, xyz, omega, m, omega_value)
    g = 9.81;
    rho = 1.204;
    % r = 3.7cm
    A = 4.3e-3;
    L = rho * A / 2;
    Cm = 0.2;
    % Cm = 0.2088;
    Cd = 0.204;
    % Cd = 0.21;
    %dxdt=x^.
    xyz1 = xyz(2); 
    %dx^.dt=...
    xyz2 = L/m*(Cm/omega_value*(omega(2) * xyz(6) - omega(3) * xyz(4))...
           - Cd * xyz(2)) * sqrt(xyz(2)^2+xyz(4)^2+xyz(6)^2);
    %vy0
    xyz3 = xyz(4);
    %ay
    xyz4 = L/m*(Cm/omega_value*(omega(3) * xyz(2) - omega(1) * xyz(6))...
           - Cd * xyz(4)) * sqrt(xyz(2)^2+xyz(4)^2+xyz(6)^2);
    %vx0
    xyz5 = xyz(6);
    %az
    xyz6 = L/m*(Cm/omega_value*(omega(1) * xyz(4) - omega(2) * xyz(2))... 
           - Cd * xyz(6)) * sqrt(xyz(2)^2+xyz(4)^2+xyz(6)^2)-g;
    xyz = [xyz1;xyz2;xyz3;xyz4;xyz5;xyz6];
end