# @param {Integer} n
# @param {Integer[]} sums
# @return {Integer[]}
def recover_array(n, sums)
    sums.sort!
    res = []
    
    n.times do
        d = sums[1] - sums[0]
        
        left = []
        right = []
        count = Hash.new(0)
        sums.each { |s| count[s] += 1 }
        
        sums.each do |s|
            if count[s] > 0
                left << s
                right << s + d
                count[s] -= 1
                count[s + d] -= 1
            end
        end
        
        if left.include?(0)
            res << d
            sums = left
        else
            res << -d
            sums = right
        end
    end
    res
end
