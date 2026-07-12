# @param {String} s
# @return {Boolean}
def is_valid(s)
    return true if s == "abc"
    return false if s[0] != "a" || s[-1] != "c"
    l = s.chars
    for j in 0...l.length
        i = 0
        while i <= l.length - 3
            if l == ["a", "b", "c"]
                return true
            end
            if i + 2 <= l.length - 1
                if l[i] + l[i+1] + l[i+2] == "abc"
                    3.times { l.delete_at(i) }
                    i = 0
                else
                    i += 1
                end
            else
                i += 1
            end
        end
    end
    return true if l.length == 0
    return false
end
