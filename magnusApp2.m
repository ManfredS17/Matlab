function xyz = magnusApp(t, xyz, omega,m)
    g = 9.81;
    k = 0.0006;
    b = 0.0006;
    %dxdt=x^.
    xyz1 = xyz(2)
    %dx^.dt=...
    xyz2 = k/m*(omega(2) * xyz(6) - omega(3) * xyz(4)) - b/m * xyz(2)
    %vy
    xyz3 = xyz(4)
    %ay
    xyz4 = k/m*(omega(3) * xyz(2) - omega(1) * xyz(6)) - b/m * xyz(4)
    xyz5 = xyz(6)
    xyz6 = k/m*(omega(1) * xyz(4) - omega(2) * xyz(2)) -g - b/m * xyz(6)
    xyz = [xyz1;xyz2;xyz3;xyz4;xyz5;xyz6]
end