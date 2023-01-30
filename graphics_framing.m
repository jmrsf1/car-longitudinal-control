function graphics_framing(xlimits, ylimits, n_xticks, n_yticks, xtype)
    % Set the graphics limits
    xlim(xlimits);
    ylim(ylimits);
    
    % Set the xticks according to the type of graphics
    if strcmp(xtype,'linear')
        xticks_vec = linspace(xlimits(1), xlimits(2), n_xticks);
    elseif strcmp(xtype,'bode')
        left_exp = log10(xlimits(1));
        right_exp = log10(xlimits(2));
        xticks_vec = linspace(left_exp, right_exp, n_xticks);
    else
        error('No such x-axis mode');
    end
    xticks(xticks_vec);
    % Set the yticks
    yticks(linspace(ylimits(1), ylimits(2), n_yticks));
end