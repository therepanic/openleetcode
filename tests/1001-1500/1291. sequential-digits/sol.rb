# @param {Integer} low
# @param {Integer} high
# @return {Integer[]}
def sequential_digits(low, high)
    q = (1..9).to_a
    q.each do |x|
        d = x % 10
        if d < 9
            q << x * 10 + d + 1
        end
    end
    q.select { |x| low <= x && x <= high }
end
