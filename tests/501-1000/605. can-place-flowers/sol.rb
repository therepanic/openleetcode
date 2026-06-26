# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
    return true if n == 0
    length = flowerbed.length
    (0...length).each do |i|
        if flowerbed[i] == 0
            left = (i == 0) || (flowerbed[i-1] == 0)
            right = (i == length-1) || (flowerbed[i+1] == 0)
            if left && right
                flowerbed[i] = 1
                n -= 1
                return true if n == 0
            end
        end
    end
    return false
end
