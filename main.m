function main
tic;
root='D:/Szakdoga/soundGen/drum/better/';

files=dir(root);
sounds={};
[y,Fs]=audioread([root, files(10).name]);

bitSize=1.5;
soundsLoaded=450;
repertoar=8;

totalSongs=400;
for i=1:soundsLoaded
    idx=randi([3,length(files)-2]);
    y=audioread([root,files(idx).name]);
    if length(y)>=Fs*bitSize
    sounds{i}=y(1:(Fs*bitSize),1);
    else
    sounds{i}=y(:,1);
    end
end
mysongs={};

for i=1:totalSongs
mysound=[];
for j=1:40
    firstDrum=randi([1,repertoar]);
    secondDrum=randi([1,repertoar]);
    tempsound=joinSound(sounds{firstDrum},sounds{secondDrum});
    mysound=[mysound;tempsound];
end
mysongs{i}=mysound;
end
toc

% sound(mysound,Fs);

end

