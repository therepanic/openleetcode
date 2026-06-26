# @param {String} s
# @return {Boolean}
def check_record(s)
    a_count = 0
    l_streak = 0
    
    s.each_char do |c|
        if c == 'A'
            a_count += 1
            return false if a_count >= 2
        end
        if c == 'L'
            l_streak += 1
            return false if l_streak >= 3
        else
            l_streak = 0
        end
    end
    
    true
end
