%% PLOT

% Init figure, Fullscreen, Background color.
figure('units','normalized','outerposition',[0 0 1 1],'color',[1 1 1]);
% Set color
num_curvas_totales = 6;
color_plot = hsv(num_curvas_totales);
% Data fake
numData = 20;
size_mat_total       = linspace(0,7000,numData);
time_float_MATLAB    = 10+rand(1,numData);
time_double_MATLAB   = 11+rand(1,numData);    
time_float_OCTAVE    = 12+rand(1,numData);
time_double_OCTAVE   = 13+rand(1,numData);
time_save_mat_OCTAVE = 14+rand(1,numData);
time_float_LU_GPU    = 15+rand(1,numData);

maxY = max([max(time_float_MATLAB),max(time_double_MATLAB),max(time_float_OCTAVE),max(time_double_OCTAVE),max(time_save_mat_OCTAVE), max(time_float_LU_GPU)]);
minY = min([min(time_float_MATLAB),min(time_double_MATLAB),min(time_float_OCTAVE),min(time_double_OCTAVE),min(time_save_mat_OCTAVE), min(time_float_LU_GPU)]);

% Plot data
h1 = plot(size_mat_total,time_float_MATLAB ,'o-','LineWidth',2,'Color',color_plot(1,:));
hold on;
h2 = plot(size_mat_total,time_double_MATLAB,'d-','LineWidth',2,'Color',color_plot(2,:));
hold on;
h3 = plot(size_mat_total,time_float_OCTAVE ,'<-','LineWidth',2,'Color',color_plot(3,:));
hold on;
h4 = plot(size_mat_total,time_double_OCTAVE,'*-','LineWidth',2,'Color',color_plot(4,:));
hold on;
h5 = plot(size_mat_total,time_save_mat_OCTAVE,'s-','LineWidth',2,'Color',color_plot(5,:));
hold on;
h6 = plot(size_mat_total,time_float_LU_GPU ,'--','LineWidth',2,'Color',color_plot(6,:));
hold on;
% Legend
legend_text = {'A','B','C','D','E','F'};
legend(legend_text,'Location','NorthWest');

% Texts
title('Matrix Inversion Performance','FontName','Arial','FontSize', 18);
xlabel('Matrix Size','FontName','Arial','FontSize', 16);
ylabel('Time [s]','FontName','Arial','FontSize', 16);
set(gca,'FontSize',14); % change the font for the ticks
%set(gca,'XTick',size_mat_total);
set(gca,'XTick',[0:1000:15000]);
grid on;

% Save fig file
saveas(gcf,'img/inv_matrix_performance_fig','fig');
% Save png with size = x_width X y_width
x_width = 80; %cm 
y_width = round(x_width/2); %cm
set(gcf, 'PaperUnits', 'centimeters','PaperPosition', [0 0 x_width y_width]);
saveas(gcf,'img/inv_matrix_performance01','png');
% Save png with size = x_width X y_width
ylim(gca,[minY maxY]); % Escala en eje y
xlim(gca,[0 1000]); % Escala en eje x
x_width = 80; %cm 
y_width = round(x_width/2); %cm
set(gcf, 'PaperUnits', 'centimeters','PaperPosition', [0 0 x_width y_width]);
saveas(gcf,'img/inv_matrix_performance02','png');
% Save png with size = x_width X y_width
ylim(gca,[minY maxY]); % Escala en eje y
xlim(gca,[0 7000]); % Escala en eje x
x_width = 25.4; %cm POWER POINT DIAPO 25.4 cm
y_width = 16.4; %cm POWER POINT DIAPO 16.4 cm
set(gcf, 'PaperUnits', 'centimeters','PaperPosition', [0 0 x_width y_width]);
saveas(gcf,'img/inv_matrix_performance03','png');