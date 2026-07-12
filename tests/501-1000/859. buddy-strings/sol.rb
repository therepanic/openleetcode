# @param {String} s
# @param {String} goal
# @return {Boolean}
def buddy_strings(s, goal)
    return false if s.length != goal.length
    if s == goal
        return s.chars.uniq.length < s.length
    end
    diffs = []
    (0...s.length).each do |i|
        if s[i] != goal[i]
            diffs << i
        end
    end
    return diffs.length == 2 && s[diffs[0]] == goal[diffs[1]] && s[diffs[1]] == goal[diffs[0]]
end
