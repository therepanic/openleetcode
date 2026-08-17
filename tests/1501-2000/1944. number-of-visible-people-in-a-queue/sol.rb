# @param {Integer[]} heights
# @return {Integer[]}
def can_see_persons_count(heights)
    n = heights.length
    result = Array.new(n, 0)
    stack = []

    (n-1).downto(0) do |i|
        height = heights[i]
        visibility = 0

        while !stack.empty? && height > stack[-1]
            stack.pop
            visibility += 1
        end

        visibility += 1 unless stack.empty?

        result[i] = visibility
        stack << height
    end

    result
end
