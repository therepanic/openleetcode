# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
    can_finish = ->(k) {
        hours = 0
        piles.each do |pile|
            hours += pile / k
            hours += 1 if pile % k != 0
            return false if hours > h
        end
        true
    }

    left, right = 1, piles.max
    ans = right
    while left <= right
        mid = left + (right - left) / 2
        if can_finish.call(mid)
            ans = mid
            right = mid - 1
        else
            left = mid + 1
        end
    end
    ans
end
