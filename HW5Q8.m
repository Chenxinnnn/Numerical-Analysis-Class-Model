for n = [5 10 20 30]
    v = ones(n,1);
    for i = 1:n+1
        v(i) = -1 + (2*(i-1)) / n;
    end
    V = vander(v);
    c = cond(V);
    disp(n);
    disp(c);
end
