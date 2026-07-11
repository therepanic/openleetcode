# @param {String} s
# @return {Integer}
def min_add_to_make_valid(s)
    l = [0]
    s.each_char do |i|
        if l[-1] == '(' && i == ')'
            l.pop
        else
            l.push(i)
        end
    end
    l.length - 1
end
