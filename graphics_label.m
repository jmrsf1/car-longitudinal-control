function graphics_label(xlabel_string, ylabel_string, title_string)
    % Set the axis label
    x = xlabel(xlabel_string);
    y = ylabel(ylabel_string);
    
    % Set graphics options for the labels
    Fontsize = 17; 
    Fontname='Arial';
    set(gca, 'FontSize', Fontsize, 'FontName', Fontname);

    
    % If the graphic has a title, set its text and customize its look
    if exist('title_string', 'var')
        t = title(title_string);
        t.FontSize = 18;
        t.FontName = 'Arial';
    end
end