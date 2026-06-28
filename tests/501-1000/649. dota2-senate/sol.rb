# @param {String} senate
# @return {String}
def predict_party_victory(senate)
    r = []
    d = []
    n = senate.length
    
    senate.chars.each_with_index do |c, i|
        if c == 'R'
            r << i
        else
            d << i
        end
    end
    
    while !r.empty? && !d.empty?
        r_idx = r.shift
        d_idx = d.shift
        
        if r_idx < d_idx
            r << r_idx + n
        else
            d << d_idx + n
        end
    end
    
    r.empty? ? "Dire" : "Radiant"
end
