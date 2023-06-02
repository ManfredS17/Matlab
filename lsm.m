function error = lsm(x_model, x_real)
    x_model = [x_model(:,1); x_model(:,5)];
    error = sum((x_model - x_real).^2);
    %x_model = [x_model(:,5)];
    %error = sum((x_model - x_real).^2);
end