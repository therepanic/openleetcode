# @param {String} s
# @return {String[]}
def remove_invalid_parentheses(s)
    is_valid = ->(str) {
        ctr = 0
        str.each_char do |ch|
            if ch == '('
                ctr += 1
            elsif ch == ')'
                return false if ctr == 0
                ctr -= 1
            end
        end
        ctr == 0
    }
    
    level = Set.new([s])
    loop do
        valid = level.select { |str| is_valid.call(str) }
        return valid unless valid.empty?
        next_level = Set.new
        level.each do |str|
            (0...str.length).each do |i|
                next_level.add(str[0...i] + str[i+1..-1])
            end
        end
        level = next_level
    end
end
