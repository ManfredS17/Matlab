function error = lsm(x_model, x_real)
    x_model = [x_model(:,1); x_model(:,5)];
    error = sum((x_model - x_real).^2);
    %x_model = [x_model(:,5)];
<<<<<<< HEAD
=======
    %error = sum((x_model - x_real).^2);
>>>>>>> 5d6f52ab9bc0b63ee73001cd1313b5e7ba3d1c1d
end