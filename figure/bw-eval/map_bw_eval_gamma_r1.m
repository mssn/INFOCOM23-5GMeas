clc;clear;
load('/Users/yanbingliu/ownCloud/5G-INDY/paper/figure_graffle/map-INFOCOM/bw-eval/A-R1_bw_gain_grid.csv.gamma.mat')

ymax = 39.781;
ymin = 39.761;
xmin = -86.168;
xmax = -86.145;
x_lim = [xmin xmax];
y_lim = [ymin ymax];

scatter(X(:,2)', X(:,1)', 100, y, 'square', 'filled');
set(gca,'Fontsize', 40)

%mycolormap = customcolormap([0 0.45 0.5 0.65 1], {'#00ff06', '#8cffad', '#f5f5f5', '#ff95b0', '#ff3535'});
%mycolormap = customcolormap([0 0.45 0.5 0.7 1], {'#0000ff', '#6464ff', '#f5f5f5', '#ff6464', '#ff0000'});
%mycolormap = customcolormap([0 0.45 0.5 0.7 1], {'#0000ff', '#6464ff', '#dcdcdc', '#ff6464', '#ff0000'});
%mycolormap = customcolormap([0 0.4167 0.5 0.75 1], {'#0000ff', '#00ffff', '#dcf0dc', '#ffff00', '#ff0000'});
mycolormap = customcolormap([0 0.4167 0.5 0.75 1], {'#7d00ff', '#0000ff', '#dcf0dc', '#ffff00', '#ff0000'});
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
caxis([-6 6])
%a1 = h.TickLabels;
%a1{end,1} = ['>', a1{end,1}];
%a1{1,1} = ['<', a1{1,1}];
%h.TickLabels = a1;
x0=10;
y0=10;
width=207 * 1.25 * 1.3;
height=238 * 1.25;
set(gcf,'position',[x0,y0,width,height])
set(gca, 'LooseInset', [0,0,.25,0]);
set(gca,'Visible','off')
set(gcf,'color','none');
set(gca,'color','none');
%colorbar off
colorbar('FontSize',24,'position',[.8 .05 .05 .9])
saveas(gca, '/Users/yanbingliu/ownCloud/5G-INDY/paper/figure_graffle/map-INFOCOM/bw-eval/map-bw-eval-gamma-r1.eps','epsc')
