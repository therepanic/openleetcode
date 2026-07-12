# @param {Integer} n
# @return {Float}
def soup_servings(n)
    return 1.0 if n > 5000
    units = (n / 25.0).ceil
    @memo = {}
    
    calc_prob = lambda do |soup_a, soup_b|
        key = [soup_a, soup_b]
        return @memo[key] if @memo.key?(key)
        if soup_a <= 0 && soup_b <= 0
            return 0.5
        end
        if soup_a <= 0
            return 1.0
        end
        if soup_b <= 0
            return 0.0
        end
        result = 0.25 * (
            calc_prob.call(soup_a - 4, soup_b) +
            calc_prob.call(soup_a - 3, soup_b - 1) +
            calc_prob.call(soup_a - 2, soup_b - 2) +
            calc_prob.call(soup_a - 1, soup_b - 3)
        )
        @memo[key] = result
        result
    end
    
    calc_prob.call(units, units)
end
