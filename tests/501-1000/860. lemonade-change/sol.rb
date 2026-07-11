# @param {Integer[]} bills
# @return {Boolean}
def lemonade_change(bills)
    f = 0
    t = 0
    bills.each do |bill|
        if bill == 5
            f += 1
        elsif bill == 10
            if f >= 1
                f -= 1
                t += 1
            else
                return false
            end
        else
            if f >= 1 && t >= 1
                t -= 1
                f -= 1
            elsif f >= 3
                f -= 3
            else
                return false
            end
        end
    end
    true
end
