
clc
clear all
close all

load M;
b=M(1:length(M),1:12);
I=b';
O=M(1:length(M),13)';
a=b';
load net
output=[];
input=[20 40 60 80 100 ];
output_mse=[];

for ii=1:length(M)
    Opt(ii)=(sim(net,I(1:12,ii)));
end
for kk=1:5
    net=apply_ga_variation(net,Opt,O,input(kk));
    net.trainParam.epochs = 50;

    [net tr]=train(net,I,O);
    for ii=1:length(M)
        Optga(ii)=(sim(net,I(1:12,ii)));
    end
    mse_error=calc_mse(Optga,O);
    output=[output mean(Optga)];
    output_mse=[output_mse mean(mse_error) ];
end
