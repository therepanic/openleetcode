# @param {Integer[][]} is_water
# @return {Integer[][]}
def highest_peak(is_water)
    r = is_water.length
    c = is_water[0].length
    height = Array.new(r) { Array.new(c, Float::INFINITY) }

    (0...r).each do |i|
        (0...c).each do |j|
            if is_water[i][j] == 1
                height[i][j] = 0
            else
                height[i][j] = [height[i][j], height[i - 1][j] + 1].min if i > 0
                height[i][j] = [height[i][j], height[i][j - 1] + 1].min if j > 0
            end
        end
    end

    (0...r).reverse_each do |i|
        (0...c).reverse_each do |j|
            height[i][j] = [height[i][j], height[i + 1][j] + 1].min if i < r - 1
            height[i][j] = [height[i][j], height[i][j + 1] + 1].min if j < c - 1
        end
    end

    height
end
