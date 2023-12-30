close all; clear; clc;
nmax = 10000;
x = rand(nmax, 1);
y = rand(nmax, 1);
r = x.^2 + y.^2;
xdist = 0:1/nmax:1;
ydist = sqrt(1-xdist.^2);
up = r <= 1;
under = r > 1;
subplot(231), plot(x(under), y(under), '.b', 'MarkerSize', 0.4);
hold on;
plot(x(up), y(up), '.r', 'MarkerSize', 0.4);
hold on;
plot(xdist, ydist, 'k');
title('Losowe X Y');
ylabel('Y');
xlabel('X');

subplot(2,3,[2,3]);
tab(10,nmax) = 0;
for i=1:10
    x = [];
    y = [];
    for j=1:nmax
        x(end+1) = rand();
        y(end+1) = rand();
        r = x.^2 + y.^2;
        under = r < 1;
        s = sum(under)/j;
        pi=4*s;
        tab(i,j)=pi;
    end
    plot(1:nmax, tab(i,:), 'b');
    hold on;
end
plot(1:nmax, pi(), '.k', 'MarkerSize', 5);
title_str = ['Estymacja Pi: ', num2str(mean(tab(:,nmax))), ' (po 10000 losowań)'];
title(title_str);
ylabel('Estymacja pi');
xlabel('n');

subplot(234);
hundred = tab(:, 100:1:109); %przez indeksowanie od 1 w matlabie
boxplot(hundred);
xlim([0 11]);
ylim([2 4]);
hold on;
plot([0, 11], [pi(), pi()], 'k');
title('Po 100 losowaniach')
ylabel('Estymacja pi')
xlabel('Seria')

subplot(235);
thousand = tab(:, 1000:1:1009);
boxplot(thousand)
xlim([0 11]);
ylim([2 4]);
hold on;
plot([0, 11], [pi(), pi()], 'k');
title('Po 1000 losowań')
ylabel('Estymacja pi')
xlabel('Seria')

subplot(236);
tthousand = tab(:, 9990:1:9999);
boxplot(tthousand);
xlim([0 11]);
ylim([2 4]);
hold on;
plot([0, 11], [pi(), pi()], 'k');
title('Po 10000 losowań')
ylabel('Estymacja pi')
xlabel('Seria')