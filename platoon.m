close all
clear all
clc

vehicles = 4;
x_initial = [150 100 50 0];
v_initial = [30 25 28 27];

v_tar = 30;
t_h_tar = 1;
d_0 = 8;
Kv = 0.5;
Kd_err = 0.3010;
Kv_r = 0.9100;

Kd_err_pl = 0.401;
Kv_r_pl = 0.56;
Ka = 0.55;

H = tf([Kv_r Kd_err],[0.5 1 (Kv_r+Kd_err*t_h_tar) Kd_err]);
H_plus = tf([Ka Kv_r_pl Kd_err_pl], [0.5 1 (Kv_r_pl + Kd_err_pl*t_h_tar) Kd_err_pl]);

% pole(H_plus)
% subplot(1,2,1)
% bode(H_plus)
% subplot(1,2,2)
% impulseplot(H_plus, 20)

open('platoon_model.slx');
sim('platoon_model.slx');



%% animation
time = size(ans.tout,1);
%figure(1);
for i=1:10:time
    %scatter(ans.x(i,:), zeros(1,4)+10, 'filled');
    %pause(0.1);
end


open('platoon_plus.slx');
sim('platoon_plus.slx');

figure(2)
for i=1:10:time
    scatter(ans.x_plus(i,:), zeros(1,4)+10, 'filled');
    pause(0.1);
end