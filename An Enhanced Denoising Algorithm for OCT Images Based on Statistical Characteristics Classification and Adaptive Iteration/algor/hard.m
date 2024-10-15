function y = hard(x, tau)

y = sign(x) .* max(abs(x) - tau, 0);