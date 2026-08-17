# @param {String} time
# @return {String}
def maximum_time(time)
    len_time_str = time.length
    ret_val = ''
    i = 0
    while i < len_time_str
        c = time[i]
        if c == '?'
            if i == 0
                if time[i+1] == '?'
                    ret_val += '2'
                elsif ['0', '1', '2', '3'].include?(time[i+1])
                    ret_val += '2'
                else
                    ret_val += '1'
                end
            elsif i == 1
                if time[i-1] == '?'
                    ret_val += '3'
                elsif ['0', '1'].include?(time[i-1])
                    ret_val += '9'
                else
                    ret_val += '3'
                end
            elsif i == 3
                ret_val += '5'
            elsif i == 4
                ret_val += '9'
            end
        else
            ret_val += c
        end
        i += 1
    end
    ret_val
end
