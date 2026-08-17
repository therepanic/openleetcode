# @param {Integer} n
# @return {Integer}
def min_days(n)
    ans = 0
    queue = [n]
    seen = Set.new
    while !queue.empty?
        newq = []
        queue.each do |x|
            return ans if x == 0
            seen.add(x)
            newq << (x-1) unless seen.include?(x-1)
            newq << (x/2) if x % 2 == 0 && !seen.include?(x/2)
            newq << (x/3) if x % 3 == 0 && !seen.include?(x/3)
        end
        ans += 1
        queue = newq
    end
    ans
end
