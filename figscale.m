function  figscale(fig, widthfactor, heightfactor)
    Width_Default = 560;
    Height_Default = 420;
    
    
    fig.Position(3) =  Width_Default*widthfactor;
    fig.Position(4) =  Height_Default*heightfactor;
end

