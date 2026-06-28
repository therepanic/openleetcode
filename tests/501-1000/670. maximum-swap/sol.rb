# @param {Integer} num
# @return {Integer}
def maximum_swap(num)
    num_list = num.to_s.chars
    last_index = {}
    num_list.each_with_index { |d, i| last_index[d.to_i] = i }
    num_list.each_with_index do |d, i|
        (9).downto(d.to_i + 1) do |x|
            if last_index.key?(x) && last_index[x] > i
                num_list[i], num_list[last_index[x]] = num_list[last_index[x]], num_list[i]
                return num_list.join.to_i
            end
        end
    end
    num
end
