# @param {String} s
# @param {Integer} min_jump
# @param {Integer} max_jump
# @return {Boolean}
def can_reach(s, min_jump, max_jump)
    n = s.length
    return false if s[-1] == '1'

    dp = Array.new(n, false)
    dp[0] = true

    reachable = 0

    (1...n).each do |i|
        if i >= min_jump && dp[i - min_jump]
            reachable += 1
        end

        if i > max_jump && dp[i - max_jump - 1]
            reachable -= 1
        end

        if reachable > 0 && s[i] == '0'
            dp[i] = true
        end
    end

    dp[-1]
end
