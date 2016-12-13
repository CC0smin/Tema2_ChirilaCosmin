%calculez Ak pentru fiecare Ck pe baza semnalului initial
i=sqrt(-1);
P=40; %perioada semnalului
D=6; %durata semnalului
pi=3.14;
e=2.71;
w=2*pi/P; %=omega
c_0=0.5;
A=ones(1,length(k));


for k=-20:1:20
%calcul coeficienti cu ajutorul integralei(quadgk)
f1=@(t) 0.05.*t.*e.^(-i.*t.*k.*pi/20);
m=quadgk(f1,0,D);
f2=@(t) (-0.05.*t+2).*e.^(-i.*t.*k.*pi/20);
n=quadgk(f2,D,2*D);

%semnalul initial
X=m+n+c_0;
x_t=1/P.*sum(X).*e.^(i*k*w*t);

a=real(1/P.*(m+n));
b=imag(1/P.*(m+n));
A(k+21)=2.*sqrt(a.^2+b.^2);
end 

%afisez spectrul de amplitudini
k=-20:1:20;
fig1=figure;
set(fig1,'name','Spectrul de amplitudini','numbertitle','off')%am folosit functia set pt a avea acces la fig1 si din alt fisier
stem(k,A)
xlabel('k')
ylabel('A_k')
grid


Am folosit formulele de la SS pentru determinarea coeficientilor si implicit a spectrului de amplitudini.
