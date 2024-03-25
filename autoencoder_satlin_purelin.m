close all
clear all
clc

x=-10:0.1:10;
y=sin(x);

for hiddenSize = [10, 30, 50]
  for maxEpochs = [50, 150, 250]
     autoenc=trainAutoencoder(y,hiddenSize, ...
         'EncoderTransferFunction','satlin', ...
        'DecoderTransferFunction','purelin', ...
        'MaxEpochs',maxEpochs);
     
     a=0.1;
     yt=y+(a*rand(size(y,1),1));
     
    ye=predict(autoenc,yt);

    reconstructionError = sum((ye-y).^2);

    fprintf('Hidden Layer Size: %d, Number of Epochs: %d, Reconstruction Error: %.2f, EncoderFunction: satlin, DecoderFunction: purelin\n', hiddenSize, maxEpochs, reconstructionError);

    figure;
    plot(ye,'r');grid;hold;plot(yt,'g');legend('Dane wejściowe','Dane wyjściowe')
    title(['Rozmiar warstwy: ', num2str(hiddenSize), ', Liczba epok: ', num2str(maxEpochs), ' Błąd rekonstrukcji: ', num2str(reconstructionError)]);

  end
end