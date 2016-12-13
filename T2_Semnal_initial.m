%afiseaza semnalul initial
N=50;
P=40; %perioada
D=6; %durata semnalului
pi=3.14;
duty=D/P;%factorul de umplere
e=2.71;
w=2*pi/P; %pulsatia
c_0=0.5;%din calcule
A=1;%amplitudinea maxima a semnalului
t=0:0.02:100;%0.02 rezolutia

for k=-20:1:20
%calcul coeficienti cu ajutorul integralei(quadgk)
f1=@(t) 0.05.*t.*e.^(-i.*t.*k.*pi/20);
m=quadgk(f1,0,D);
f2=@(t) (-0.05.*t+2).*e.^(-i.*t.*k.*pi/20);
n=quadgk(f2,D,2*D);

%semnalul initial
X=m+n+c_0;
x_t=1/P.*sum(X).*e.^(i*k*w*t);
end


sawtooth(x_t,duty)
title('Semnal initial');
xlabel('t[s]');
ylabel('x(t)');