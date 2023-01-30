M = 1000;  % car mass in kg
rho = 1.225;  % in kg/m3

%Aerodynamic drag force
Af = 1.6 + 0.00056 * (M-765); 
Cd = 0.27; % drag coefficient
Vwind = 5.5; %m/s

f = 0.015;

rw = 0.35; %radius with no deformation
rstat = 0.34; %radius with deformation
reff = ( asin(acos(rstat/rw)) / acos(rstat/rw)) * rw;

B = 10;
C = 1.9;
D = 1;
Csigma = B * C * D; %longitudinal tire stiffness
Csigma = 1000/0.025;
Cf = Csigma;
Cr = Csigma;

haero = 0.292*2;
g = 9.81;
h = 0.292*2;
Lr = 0.6;
Lf = 0.74;

R =0.5;

Ie = 0.1782;
Iw = 1000; %kg/m2.

for i = 1:100
w(i) = 5*i;
w_cte = w(i);
out = sim('main_sim');
    
t = out.t-1;
a = out.a;
v = out.v;
x = out.x;
u = out.u;
fxr = out.fxr;
fxf = out.fxf;
faero = out.faero;
rxf = out.rxf;
rxr = out.rxr;

neg_forces(i) = mean(faero) + mean(rxf) + mean(rxr);
perc(i) = neg_forces(i) / (mean(fxf) + mean(fxr));
end

fig = figure(1);
p=plot(w, perc);
p(1).LineWidth = 3;
graphics_label('\omega_w [rad/s]', '% of wind and rolling forces');
graphics_framing([5 ceil(max(w))],[0 0.5], 5, 4, 'linear');



% fig=figure(1);
% tiledlayout(2,1)
% nexttile
% p=plot(t,x, t,v,t,a, t, u);
% p(1).LineWidth = 3;
% p(2).LineWidth = 3;
% p(3).LineWidth = 3;
% p(4).LineWidth = 3;
% %%%Aesthetic
% graphics_label('Time [s]', ' ');
% graphics_framing([0 ceil(max(t))],[-10 ceil(max(x))], 5, 4, 'linear');
% lgd = legend({'y = x [m]','y = v [m/s]', 'y = a [m/s^2]', '\omega_w = u [rad/s]'}, 'Location','northwest');
% lgd.FontSize = 11;


% nexttile
% yyaxis left
% hold on;
% p=plot(t,faero, t,rxr, 'g',t,rxf);
% p(1).LineWidth = 3;
% p(2).LineWidth = 3;
% p(3).LineWidth = 3;
% hold off;
% graphics_framing([0 ceil(max(t))],[0 50], 5, 4, 'linear');
% yyaxis right
% p1=plot(t,fxr, t,fxf, "color", [0.6350 0.0780 0.1840]);
% p1(1).LineWidth = 1;
% p1(2).LineWidth = 3;
% graphics_framing([0 ceil(max(t))],[0 80], 5, 4, 'linear');
% %%%Aesthetic
% graphics_label('Time [s]', ' ');
% lgd1 = legend( {'y = F_{aero} [N]', 'y= R_{xr} [N]', 'y= R_{xf} [N]'});
% a=axes('position',get(gca,'position'),'visible','off');
% lgd = legend(a, p1, {'y = F_{xr} [N]', 'y = F_{xf} [N]',}, 'Location','northwest');
% lgd.FontSize = 11;
% lgd1.FontSize = 11;
% figscale(fig, 1, 0.8);
% grid on;




