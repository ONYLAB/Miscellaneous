function plotall()
% Automatic plotting 
% Must be placed inside Molec_vs_time folder

filename = 'molectypes.dat';
close all
D = dir('*.dat');
Num = length(D(not([D.isdir])));
col=lines(Num-1);
mylabels ={};

fid = fopen(filename);
tline = fgetl(fid);
i=1;
while ischar(tline)
    mat = dlmread([tline '.dat']);
    mylabels = [mylabels tline];
    loglog(mat(:,2),mat(:,3),'color',col(i,:),'LineWidth',3);
    hold on
    tline = fgetl(fid);
    i=i+1;
end
fclose(fid);
set(gcf,'color','w');
xlabel('Time (s.)');
ylabel('Number of molecules');
legend(mylabels);