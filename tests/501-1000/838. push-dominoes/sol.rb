# @param {String} dominoes
# @return {String}
def push_dominoes(dominoes)
    s = 'L' + dominoes + 'R'
    res = ''
    prev = 0
    (1...s.length).each do |curr|
        next if s[curr] == '.'
        span = curr - prev - 1
        res += s[prev] if prev > 0
        if s[prev] == s[curr]
            res += s[prev] * span
        elsif s[prev] == 'L' && s[curr] == 'R'
            res += '.' * span
        else
            res += 'R' * (span / 2) + '.' * (span % 2) + 'L' * (span / 2)
        end
        prev = curr
    end
    res
end
