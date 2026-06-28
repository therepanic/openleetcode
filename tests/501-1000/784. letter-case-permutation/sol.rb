# @param {String} s
# @return {String[]}
def letter_case_permutation(s)
    ans = []
    solve = lambda do |idx, curr|
        if idx == s.length
            ans << curr
            return
        end
        if s[idx] =~ /\d/
            solve.call(idx + 1, curr + s[idx])
            return
        end
        solve.call(idx + 1, curr + s[idx].downcase)
        solve.call(idx + 1, curr + s[idx].upcase)
    end
    solve.call(0, "")
    ans
end
