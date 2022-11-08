%Final Exam - Moro Bamber
%% Level 1
clear
clc

N_steps=10;

x_vec(1)=0;
y_vec(1)=0;
xpos=0;
ypos=0;

for i=2:N_steps
    xrand=rand;
    yrand=rand;
    if xrand <=.47
        dx=-1;
    elseif xrand>.47 && xrand<=.57
        dx=0;
    else
        dx=1;
    end
    
    if yrand <=.49
        dy=-1;
    elseif yrand>.47 && yrand<=.54
        dy=0;
    else
        dy=1;
    end
    
    xpos=xpos+dx;
    ypos=ypos+dy;
    
    xvec(i)=xpos;
    yvec(i)=ypos;
    
end

width=abs(max(xvec)-min(xvec));
xmin=min(xvec);
height=abs(max(yvec)-min(yvec));
ymin=min(yvec);
xmin=min(xvec);
xmax=max(xvec);
ymin=min(yvec);
ymax=max(yvec);

f1=figure(1);
sp1=plot(xvec,yvec,'r-o');
axis equal
rectangle('Position',[xmin ymin width height],'EdgeColor','m','LineStyle','--')
ax1=gca;
set(ax1,'XLim',[(xmin-2) (xmax+2)]);
set(ax1,'YLim',[(ymin-2) (ymax+2)]);
t1=sprintf('%s%.0f%s','Particle path for ',N_steps,' steps');
title(t1,'FontSize',20);
y_text='\it y_{pos}';
ylabel(y_text)
y_lab=get(ax1,'YLabel');
set(y_lab,'Color','blue');
x_text='x_{pos}';
xlabel(x_text);
x_lab=get(ax1,'XLabel');
set(x_lab,'FontName','Courier New','FontSize',16)
x_lab;

f1=fopen('Bamber_L1_path.txt','wt');

fprintf(f1,'%-15s%-15s%-15s\n','Time (step)','x position','y position');
fprintf(f1,'%-15.0f%-15.1f%-15.2f\n',0,0,0);

for j=2:N_steps
    fprintf(f1,'%-15.0f%-15.1f%-15.2f\n',j,xvec(j),yvec(j));
end

fclose(f1);

%% Level 2
clear
clc


L_boundary=20;

[xvec,yvec,t_steps]=bamber_pathgenf(L_boundary);

width=abs(max(xvec)-min(xvec));
xmin=min(xvec);
height=abs(max(yvec)-min(yvec));
ymin=min(yvec);
xmin=min(xvec);
xmax=max(xvec);
ymin=min(yvec);
ymax=max(yvec);
xbmin=0-L_boundary;


f1=figure(2);
sp1=plot(xvec,yvec,'r-o');
axis equal
rectangle('Position',[xmin ymin width height],'EdgeColor','m','LineStyle','--')
rectangle('Position',[xbmin xbmin 2*L_boundary 2*L_boundary],'EdgeColor','b','LineWidth',3)
legend('Path')
ax1=gca;
set(ax1,'XLim',[(xbmin-2) (L_boundary+2)]);
set(ax1,'YLim',[(xbmin-2) (L_boundary+2)]);
t1=sprintf('%s%.0f%s','Particle path for ',t_steps,' steps');
title(t1,'FontSize',20);
y_text='\it y_{pos}';
ylabel(y_text)
y_lab=get(ax1,'YLabel');
set(y_lab,'Color','blue');
x_text='x_{pos}';
xlabel(x_text);
x_lab=get(ax1,'XLabel');
set(x_lab,'FontName','Courier New','FontSize',16)

filename=['Bamber_L2_path_',num2str(L_boundary),'.txt'];
f2=fopen(filename,'wt');
leg=1:1:t_steps;
fprintf(f2,'%-15s%-15s%-15s\n','Time (step)','x position','y position');
fprintf(f2,'%-15.0f%-15.1f%-15.2f\n',0,0,0);
fprintf(1,'%-15.0f%-15.1f%-15.2f\n',leg,xvec,yvec)
for j=2:t_steps
    fprintf(f2,'%-15.0f%-15.1f%-15.2f\n',j,xvec(j),yvec(j));
end

fclose(f2);

%% Level 3
clear
clc

L_boundary=20;

bottom=0;
total_steps=0;
N=10000;
for i=1:N
    [xvec,yvec,t_steps]=bamber_pathgenf(L_boundary);
    
    if yvec(t_steps)==-L_boundary
        bottom=bottom+1;
    end
    
    total_steps=total_steps+t_steps;
    
end

avg_bot_hits=bottom/N;
percent_bothits=[num2str(avg_bot_hits*100),'%'];
p_bottom_hit=[num2str(round(avg_bot_hits,3)),' ','(',percent_bothits,')']
avg_t_steps=round(total_steps/N,1)

%%
function [xvec,yvec,t_steps] = bamber_pathgenf(L_boundary)
%For Final Exan
%   Creates a random path that ends at a boundary.
xbmax=L_boundary;
xbmin=0-L_boundary;
ybmax=L_boundary;
ybmin=0-L_boundary;

x_vec(1)=0;
y_vec(1)=0;
xpos=0;
ypos=0;
N_steps=0;

    while 1
        N_steps=N_steps+1;
        i=N_steps;
        xrand=rand;
        yrand=rand;
        if xrand <=.47
            dx=-1;
        elseif xrand>.47 && xrand<=.57
            dx=0;
        else
            dx=1;
        end

        if yrand <=.49
            dy=-1;
        elseif yrand>.47 && yrand<=.54
            dy=0;
        else
            dy=1;
        end

        xpos=xpos+dx;
        ypos=ypos+dy;
        xvec(i)=xpos;
        yvec(i)=ypos;

        if xpos==xbmax || xpos==xbmin
            break
        end

        if ypos==ybmax || ypos==ybmin
            break
        end
    end
    
    t_steps=i;
    
end
