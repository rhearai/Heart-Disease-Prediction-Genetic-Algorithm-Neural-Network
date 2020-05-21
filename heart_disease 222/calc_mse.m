function mse_error=calc_mse(output,targets)

for ii=1:length(output)
    mse_error(ii) = sum((output(ii)-targets(ii)).^2)/length(output);
end

