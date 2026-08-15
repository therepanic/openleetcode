# @param {String} s
# @param {String[][]} knowledge
# @return {String}
def evaluate(s, knowledge)
    mp = {}
    knowledge.each { |k, v| mp[k] = v }
    ans = ""
    i = 0
    n = s.length
    while i < n
        if s[i] == '('
            i += 1
            temp = ""
            while i < n && s[i] != ')'
                temp << s[i]
                i += 1
            end
            ans << (mp[temp] || "?")
            i += 1
        else
            ans << s[i]
            i += 1
        end
    end
    ans
end
