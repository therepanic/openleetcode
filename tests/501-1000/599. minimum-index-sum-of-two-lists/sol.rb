# @param {String[]} list1
# @param {String[]} list2
# @return {String[]}
def find_restaurant(list1, list2)
    mp = {}
    mp[list1[0]] = -Float::INFINITY
    (1...list1.length).each do |i|
        mp[list1[i]] = -i
    end
    if !mp.key?(list2[0])
        mp[list2[0]] = -Float::INFINITY
    else
        if mp[list2[0]] != -Float::INFINITY
            mp[list2[0]] = mp[list2[0]].abs
        else
            mp[list2[0]] = 0
        end
    end
    (1...list2.length).each do |i|
        if mp.key?(list2[i])
            if mp[list2[i]] != -Float::INFINITY
                mp[list2[i]] = mp[list2[i]].abs + i
            else
                mp[list2[i]] = i
            end
        else
            mp[list2[i]] = -i
        end
    end
    min_val = Float::INFINITY
    mp.values.each do |val|
        if val >= 0
            min_val = [min_val, val].min
        end
    end
    ans = []
    mp.each do |key, val|
        if val >= 0 && val == min_val
            ans << key
        end
    end
    ans
end
