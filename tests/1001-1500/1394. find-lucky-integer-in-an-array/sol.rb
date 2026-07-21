# @param {Integer[]} arr
# @return {Integer}
def find_lucky(arr)
    freq = Hash.new(0)
    arr.each { |num| freq[num] += 1 }
    
    lucky = -1
    freq.each do |num, count|
        if num == count
            lucky = [lucky, num].max
        end
    end
    
    lucky
end
