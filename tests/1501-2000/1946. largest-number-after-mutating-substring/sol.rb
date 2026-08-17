# @param {String} num
# @param {Integer[]} change
# @return {String}
def maximum_number(num, change)
    a = num.chars
    flag = false
    a.each_with_index do |ch, i|
        b = ch.to_i
        if b < change[b]
            a[i] = change[b].to_s
            flag = true
        elsif b == change[b] || !flag
            next
        else
            break
        end
    end
    a.join
end
