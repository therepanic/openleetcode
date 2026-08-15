# @param {Integer[]} inventory
# @param {Integer} orders
# @return {Integer}
def max_profit(inventory, orders)
    t = binary_search(inventory, 0, inventory.max, orders)
    total = 0
    sold = 0
    inventory.each do |ball|
        if ball > t
            cnt = ball - t
            total += (ball + t + 1) * cnt / 2
            sold += cnt
        end
    end
    extra = sold - orders
    res = total - extra * (t + 1)
    res % (10**9 + 7)
end

def binary_search(arr, left, right, target)
    while left < right
        mid = (left + right + 1) / 2
        count = 0
        arr.each do |x|
            if x > mid
                count += x - mid
            end
        end
        if count >= target
            left = mid
        else
            right = mid - 1
        end
    end
    left
end
