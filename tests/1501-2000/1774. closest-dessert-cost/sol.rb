def closest_cost(base_costs, topping_costs, target)
    s = [0]
    topping_costs.each do |i|
        ss = []
        s.each do |j|
            ss += [j, j+i, j+2*i]
        end
        s = ss
    end
    s.sort!
    ans = 10**10
    fans = 10**10
    n = s.length
    base_costs.each do |i|
        j = target - i
        x = s.bsearch_index { |v| v >= j } || n
        x -= 1
        x = [x, 0].max
        ans1 = (j - s[x]).abs
        if ans1 < ans
            ans = ans1
            fans = s[x] + i
        elsif ans1 == ans
            fans = [fans, s[x] + i].min
        end
        if x + 1 < n
            x += 1
            ans1 = (j - s[x]).abs
            if ans1 < ans
                ans = ans1
                fans = s[x] + i
            elsif ans1 == ans
                fans = [fans, s[x] + i].min
            end
        end
    end
    fans
end
