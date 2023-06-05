<<<<<<< HEAD
function xyz = NewMagnusApp(t, xyz, omega, m, omega_value, v)
    g = 9.81;
    rho = 1.204;
    r_ball = 0.037;
    A = 4.3e-3;
    L = rho * A / 2;
    S = r_ball * omega_value / v;
    
    if S < 0.1
       Cm = 1.5*S;
    else
        Cm = 0.09+0.6*S;
    end
    
    Cd = 0.204;

=======
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
>>>>>>> 5d6f52ab9bc0b63ee73001cd1313b5e7ba3d1c1d
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