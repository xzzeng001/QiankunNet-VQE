figure

nn=length(y1);
x1=1:nn;
%nn2=length(y2);
%x2=1:nn2;
%nn3=length(y3);
%x3=1:nn3;
nn4=length(y4);
x4=1:nn4;

yy1=smoothdata(y1);
%yy2=smoothdata(y2);
yy4=smoothdata(y4);

y_uhf=-1.933563073080490469e+00;
%y_ump2=-1.941907089762189287e+00;
%y_uccsd=-1.960944312107330667e+00;
y_cisd=-1.959350291322774273e+00;
y_fci=-1.969512165216279698e+00;
y_vqe=-1.967523262701600606e+00;

subplot(1,2,1)
h1=semilogx([1 1e6],[y_uhf,y_uhf],'--','linewidth',2);
col1=get(h1,'color');

hold on
h2=semilogx([1 1e6],[y_cisd,y_cisd],'--','linewidth',2);
col2=get(h2,'color');

h3=semilogx([1 1e6],[y_vqe,y_vqe],'--','linewidth',2);
col3=get(h3,'color');

h4=plot(x1(1:1:end),yy1(1:1:end),'-o','linewidth',2,'Markersize',12);
col4=get(h4,'color');
%h4.Color(4)=0.8;
set(h4,'MarkerFaceColor',col4);

%h5=semilogx(x2(1:1:end),y2(1:1:end),'-o','linewidth',2,'Markersize',12);
%col5=get(h5,'color');
%h5.Color(4)=0.6;
%set(h5,'MarkerFaceColor',col5);

%h6=semilogx(x3(1:1:end),y3(1:1:end),'-o','linewidth',2,'Markersize',12);
%col6=get(h6,'color');
%h6.Color(4)=0.4;
%set(h6,'MarkerFaceColor',col6);

h7=semilogx(x4(1:1:end),yy4(1:1:end),'b-o','linewidth',2,'Markersize',12);
col7=get(h7,'color');
%h7.Color(4)=0.2;
set(h7,'MarkerFaceColor',col7);

semilogx([1 1e6],[y_fci,y_fci],'g--','linewidth',2)
xlim([1 1e6])

set(gca,'fontsize',20)
set(gca,'linewidth',2)

%legend('UHF','CISD','VQE','NNQS','HF+NNQS','CISD+NNQS','VQE+NNQS','FCI')
%legend('boxoff')

legend('UHF','CISD','VQE','QiankunNet','QiankunNet-VQE','FCI')
legend('boxoff')

xlabel('Iterations','interpreter','latex')
ylabel('Energy (Ha)','interpreter','latex')

subplot(1,2,2)
x_sq = [1,1e6,1e6,1];   % 逆时针遍历每个点的x值
y_sq = [1e-10,1e-10,1.6e-3,1.6e-3];   % 逆时针遍历每个点的y值
fill(x_sq,y_sq,'p');   % 填充函数
hold on

h8=loglog([1 1e6],[y_uhf-y_fci,y_uhf-y_fci],'--','color',col1,'linewidth',2);
hold on
h9=loglog([1 1e6],[y_cisd-y_fci,y_cisd-y_fci],'--','color',col2,'linewidth',2);
h10=loglog([1 1e6],[y_vqe-y_fci,y_vqe-y_fci],'--','color',col3,'linewidth',2);

h11=loglog(x1(1:1:end),abs(yy1(1:1:end)-y_fci),'-','linewidth',4,'color',col4,'Markersize',5);
set(h11,'MarkerFaceColor',col4);
%h11.Color(4)=0.8;

%h12=loglog(x2(1:1:end),abs(y2(1:1:end)-y_fci),'-','linewidth',4,'color',col5,'Markersize',5);
%set(h12,'MarkerFaceColor',col5);
%h12.Color(4)=0.8;

%h13=loglog(x3(1:1:end),abs(y3(1:1:end)-y_fci),'-','linewidth',4,'color',col6,'Markersize',5);
%set(h13,'MarkerFaceColor',col6);
%h13.Color(4)=0.8;

h14=loglog(x4(1:1:end),abs(yy4(1:1:end)-y_fci),'-','linewidth',4,'color',col7,'Markersize',5);
set(h14,'MarkerFaceColor',col7);
%h14.Color(4)=0.4;

%loglog([1 1e6],[1.6e-3,1.6e-3],'g--','linewidth',2)

%ylim([1e-15 10])
xlim([1 1e6])

set(gca,'fontsize',20)
set(gca,'linewidth',2)

xlabel('Iterations','interpreter','latex')
ylabel('Absolute Energy error(Ha)','interpreter','latex')
