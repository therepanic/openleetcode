# @param {String[]} strs
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def find_max_form(strs, m, n)
    dp = { [0, 0] => 0 }
    strs.each do |s|
        zeros = s.count('0')
        ones = s.count('1')
        new_dp = dp.dup
        dp.each do |(z, o), size|
            new_z = z + zeros
            new_o = o + ones
            if new_z <= m && new_o <= n
                new_dp[[new_z, new_o]] = [new_dp.fetch([new_z, new_o], 0), size + 1].max
            end
        end
        dp = new_dp
    end
    dp.values.max
end
