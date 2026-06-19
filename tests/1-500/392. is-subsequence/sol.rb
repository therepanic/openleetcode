# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
    sp = 0
    tp = 0
    while sp < s.length && tp < t.length
        if s[sp] == t[tp]
            sp += 1
        end
        tp += 1
    end
    sp == s.length
end

def isSubsequence(s, t)
    is_subsequence(s, t)
end
