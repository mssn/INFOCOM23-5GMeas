clc;clear;
load('/Users/yanbingliu/ownCloud/5G-INDY/paper/figure_graffle/map-INFOCOM/map-cell-num/T-R12_grid_cell_num.csv.mat')

%ymax    = 39.778; % 1320m
%ymin    = 39.766;
%xmin = -86.167; % 1530m
%xmax = -86.15;

ymax = 39.781;
ymin = 39.761;
xmin = -86.168;
xmax = -86.145;

x_lim = [xmin xmax];
y_lim = [ymin ymax];

scatter(X(:,2)', X(:,1)', 100, y, 'square', 'filled');
set(gca,'Fontsize', 40)
%threshold_colormap = 40;
threshold_colormap = 100;
%colormap_max = max(y);
colormap_max = 100;
oldmap = parula;
newmap = 0*oldmap;
tmp = oldmap(1:round(colormap_max/threshold_colormap):end,:);
newmap(1:size(tmp,1),:) = tmp;
newmap(size(tmp,1)+1:end,:) = repmat(tmp(end,:), size(oldmap,1)-size(tmp,1),1);
colormap(newmap);
ylabel('')
xlabel('')
h = colorbar;
% ylabel(h, 'Mbps')
yticklabels({})
xticklabels({})
xlim(x_lim)
ylim(y_lim)
caxis([0 100])
%a1 = h.TickLabels;
%a1{end,1} = ['>', a1{end,1}];
%a1{1,1} = ['<', a1{1,1}];
%h.TickLabels = a1;
x0=10;
y0=10;
width=207 * 1.25;
height=238 * 1.25;
set(gcf,'position',[x0,y0,width,height])
set(gca, 'LooseInset', [0,0,0,0]);
set(gca,'Visible','off')
set(gcf,'color','none');
set(gca,'color','none');
colorbar off
saveas(gca, '/Users/yanbingliu/ownCloud/5G-INDY/paper/figure_graffle/map-INFOCOM/map-cell-num/R12-map-cell-num.eps','epsc')