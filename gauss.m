%gauss() is a bell shaped function that peaks at x=mu (i.e. the mean of the distribution)
% and whose width is controlled by parameter sig (i.e. the standard deviation)

function y=gauss(x,mu,sig)
    y=exp(-(x-mu).^2./(2*sig.^2));
end