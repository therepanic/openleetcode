# @param {String[]} key_name
# @param {String[]} key_time
# @return {String[]}
def alert_names(key_name, key_time)
    time_to_min = ->(t) { h, m = t.split(':').map(&:to_i); h * 60 + m }
    
    name_to_times = Hash.new { |h, k| h[k] = [] }
    
    key_name.each_with_index do |name, i|
        name_to_times[name] << time_to_min.call(key_time[i])
    end
    
    alerted = []
    
    name_to_times.each do |name, times|
        times.sort!
        (0...(times.length - 2)).each do |i|
            if times[i+2] - times[i] <= 60
                alerted << name
                break
            end
        end
    end
    
    alerted.sort
end
