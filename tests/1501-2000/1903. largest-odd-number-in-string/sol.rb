# @param {String} num
# @return {String}
def largest_odd_number(num)
    (num.length - 1).downto(0) do |i|
        return num[0..i] if num[i].to_i.odd?
    end
    ""
end
