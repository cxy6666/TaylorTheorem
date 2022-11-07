syms x;
x0 = 1;
fig = figure;
fplot(exp(x),'r');
xlim([-3 4]);
ylim([-6 20]);
hold on
grid on
im = cell(1, 10);
for i=2:11 %2:5:47   2:2:20
f = taylor(exp(x),x, 'ExpansionPoint', x0,'order',i);
%��һ��1Ϊչ���㣬3Ϊ����(=��������+1)
c=i-1;
title(['x0 = ',num2str(x0), ', n = ',num2str(c)])
h = fplot(f);
pause(0.88);
frame = getframe(fig);
im{i-1} = frame2im(frame);% im{1+(i-2)/5}   im{i/2}
delete(h);
end

filename = 'C:\Users\chen_xinyang\OneDrive\��ѧ\MatlabTask\exp(x).gif'; 

for idx = 1:10
    % ����gif�ļ���ͼ�������index����ͼ��
    [A, map] = rgb2ind(im{idx}, 256);
    if idx == 1
        imwrite(A, map, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 0.88);
    else
        imwrite(A, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.88);
    end
end