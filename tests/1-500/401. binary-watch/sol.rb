# @param {Integer} turned_on
# @return {String[]}
def read_binary_watch(turned_on)
    result = []
    (0...12).each do |hour|
        (0...60).each do |minute|
            if hour.to_s(2).count('1') + minute.to_s(2).count('1') == turned_on
                result << "#{hour}:#{format('%02d', minute)}"
            end
        end
    end
    result
end
