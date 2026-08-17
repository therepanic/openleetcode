# @param {String} s
# @param {String} t
# @return {Boolean}
def is_transformable(s, t)
    return false if s.chars.sort != t.chars.sort
    
    pos = Array.new(10) { [] }
    s.each_char.with_index do |ss, i|
        pos[ss.to_i] << i
    end
            
    t.each_char do |tt|
        i = pos[tt.to_i].shift
        (0...tt.to_i).each do |ii|
            return false if !pos[ii].empty? && pos[ii][0] < i
        end
    end
    true
end
