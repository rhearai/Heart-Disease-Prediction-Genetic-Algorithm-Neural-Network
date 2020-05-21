
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
input=[10 20 30 40 50 60 70 80 90 100 ];
output_mse=[];
output1=[];
output_mse1=[];
for ii=1:length(M)
    Opt(ii)=(sim(net,I(1:12,ii)));
end
for kk=1:length(input)
    for it=1:10
    net=apply_ga_generation_variation(net,Opt,O,input(kk));
    net.trainParam.epochs = 50;

    [net tr]=train(net,I,O);
    for ii=1:length(M)
        Optga(ii)=(sim(net,I(1:12,ii)));
    end
    mse_error=calc_mse(Optga,O);
     output=[output (Optga)];
     output_mse=[output_mse (mse_error) ];
    end
    output1=[output1 mean(output) ];
    output_mse1=[output_mse1 mean(output_mse) ];


end
