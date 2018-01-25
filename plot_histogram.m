function [] = plot_histogram(h)
%Histogram bar - h values derived from compute_histogram
bar(h);
%X-axis labeled as 'intensity value'
xlabel('intensity value');
%Y-axis labeled as 'PMF' - probability mass function
ylabel('PMF');
%Set axes for x and y axis from 0 to max
set(gca,'xlim',[0 256]);
set(gca,'ylim',[0 max(h)]);
end
