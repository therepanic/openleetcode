# @param {Integer} n
# @return {Integer}
def count_vowel_strings(n)
    if n==1
        return 5
    elsif n==2
        return 15
    elsif n==3
        return 35
    end
    x=[10]
    c=5
    (0...(n-3)).each do |i|
        x.append(x[i]+c)
        c+=1
    end
    y=[10]
    (0...(n-2)).each do |i|
        y.append(y[i]+x[i])
    end
    return y.sum+5
end
