function  [res, maxdex, mindex] = remove_suspects(vec)
    [my_max, maxdex] = max(vec);
    [my_min, mindex] = min(vec);
    better = [];
    for i=1:length(vec)
        if(~(vec(i) == my_min || vec(i) == my_max))
            better = [better vec(i)];
        end
    end
    res = better';
end