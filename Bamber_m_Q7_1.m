%% Level 1
clear
clc

syms x
y=x^2*exp(-x/20);


N_points=20;
x_start=-2;
x_end=2;
d1x=diff(y,x);
d2x=diff(d1x,x);
xvals=linspace(x_start,x_end,N_points);
subsy=subs(y,x,xvals);
subsd1x=subs(d1x,x,xvals);
subsd2x=subs(d2x,x,xvals);
fh1=figure('Name','Derivative Plots');
fh1.Color='white';
box on
xlabel('x_{values}','FontSize',20)
ylabel('y or d^{n}y/dx^{n}')
ax1=gca;
y_lab=get(ax1,'YLabel');
set(y_lab,'FontWeight','bold')
set(y_lab,'Color','blue')
hold on
sp1=plot(xvals,subsy,'s','MarkerEdgeColor','green','MarkerSize',12);
sp2=plot(xvals,subsd1x,'x:','MarkerEdgeColor','r','Color','k');
sp3=plot(xvals,subsd2x,'o','MarkerEdgeColor','m','MarkerFaceColor','b');
hold off
legend('y','dy/dx','d^{2}y/dx^{2}');

%% Level 2
clear
clc

syms x
y=sin(x)
N_points=50;
x_start=0;
x_end=10;
N_deriv=4;
xvals=linspace(x_start,x_end,N_points);
ysub=subs(y,x,xvals);
for i=1:N_deriv
    dy(i)=diff(y,x,i);
    if dy(i)==0;
        p_num=i-1;
    else
        p_num=i;
    end
end

for j=1:p_num
    fig_title=['Derivative Plot #',num2str(j)];
    fig=figure('Name',fig_title);
    fig.Color='white';
    box on
    yvals=subs(dy(j),x,xvals);
    sp(j)=plot(xvals,yvals,'s','MarkerEdgeColor','b');
    xlabel('x_{values}','FontSize',20)
    ylab=sprintf('y or d^{%.0f}/dx^{%.0f}',j,j);
    ylabel(ylab)
    ax1=gca;
    y_lab=get(ax1,'YLabel');
    set(y_lab,'FontWeight','bold')
    set(y_lab,'Color','blue')
end
