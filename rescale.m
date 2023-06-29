%rescale() compresses/stretches the vector/matrix y such that its
%minimum value equals mmin and its maximum value equals mmax.

function y=rescale(y,mmin,mmax)
    y=y-min(min(y));    %sets the minimum value of y to zero
    y=y./max(max(y));   %compresses/stretchess y so that its maximum value equals one
    y=y.*(mmax-mmin);   %compresses/stretchess y so that its maximum value equals (mmax-mmin)
    y=y+mmin;           %adds mmin so that its minimum value equals mmin and its maximum value equals mmax
end