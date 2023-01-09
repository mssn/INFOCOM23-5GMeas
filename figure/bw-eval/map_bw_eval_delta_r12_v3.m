clc;clear;
load('/Users/yanbingliu/ownCloud/5G-INDY/paper/figure_graffle/map-INFOCOM/bw-eval/T-R12_bw_gain_grid.csv.delta.mat')

%R6 range
%ymax    = 39.778; % 1320m
%ymin    = 39.766;
%xmin = -86.167; % 1530m
%xmax = -86.15;

%R1 range
ymax = 39.781;
ymin = 39.761;
xmin = -86.168;
xmax = -86.145;

x_lim = [xmin xmax];
y_lim = [ymin ymax];

scatter(X(:,2)', X(:,1)', 100, y, 'square', 'filled');
set(gca,'Fontsize', 40)

%mycolormap = customcolormap([0 0.45 0.5 0.65 1], {'#00ff06', '#8cffad', '#f5f5f5', '#ff95b0', '#ff3535'});
mycolormap = customcolormap([0 0.45 0.5 0.7 1], {'#0000ff', '#6464ff', '#f5f5f5', '#ff6464', '#ff0000'});
colorbar;
colormap(mycolormap);
axis off;

%%threshold_colormap = 40;
%threshold_colormap = 500;
%%colormap_max = max(y);
%colormap_max = 500;
%oldmap = parula;
%newmap = 0*oldmap;
%tmp = oldmap(1:round(colormap_max/threshold_colormap):end,:);
%newmap(1:size(tmp,1),:) = tmp;
%newmap(size(tmp,1)+1:end,:) = repmat(tmp(end,:), size(oldmap,1)-size(tmp,1),1);
%colormap(newmap);

ylabel('')
xlabel('')
h = colorbar;
% ylabel(h, 'Mbps')
yticklabels({})
xticklabels({})
xlim(x_lim)
ylim(y_lim)
caxis([-200 200])
%a1 = h.TickLabels;
%a1{end,1} = ['>', a1{end,1}];
%a1{1,1} = ['<', a1{1,1}];
%h.TickLabels = a1;
x0=10;
y0=10;

% R6 size
%width=153 * 1.25 * 1.35;
%height=136 * 1.25;
%set(gca, 'LooseInset', [0,0,.3,0]);
%colorbar('FontSize',24,'position',[.75 .05 .05 .9])

%R1 size
width=207 * 1.25 * 1.4;
height=238 * 1.25;

set(gcf,'position',[x0,y0,width,height])
set(gca, 'LooseInset', [0,0,.3,0]);
set(gca,'Visible','off')
set(gcf,'color','none');
set(gca,'color','none');
%colorbar off
colorbar('FontSize',24,'position',[.75 .05 .05 .9])

saveas(gca, '/Users/yanbingliu/ownCloud/5G-INDY/paper/figure_graffle/map-INFOCOM/bw-eval/map-bw-eval-delta-r12.eps','epsc')