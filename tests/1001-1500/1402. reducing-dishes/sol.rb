# @param {Integer[]} satisfaction
# @return {Integer}
def max_satisfaction(satisfaction)
    satisfaction.sort!.reverse!
    presum = 0
    res = 0
    satisfaction.each do |s|
        presum += s
        break if presum < 0
        res += presum
    end
    res
end
