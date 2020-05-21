function mse_calc= mse_test(output,targets)
mse_calc = sum((output-targets).^2)/length(output);
