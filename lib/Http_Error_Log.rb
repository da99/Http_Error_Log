require 'Http_Error_Log/version'
require 'Split_Lines'
require 'time'

def Http_Error_Log file, skip = nil
  h = Http_Error_Log_Helper
  
  lines = Split_Lines(File.read( file ))
  lines
  .map { |l| 

    pieces = l.split %r!,?\s+([\w\_\.\-]+):\s+! 
    
    prefix = pieces.shift
    time_str = prefix.split[0,2].join(' ') 
    
    next if skip && Time.parse(time_str) <= Time.parse(skip)
    
    pieces.each_index { |i|
      if i.even?
        pieces[i] = pieces[i].to_sym
      end
    }
    
    final = Hash[ *pieces ]
    final[:created_at], final[:error], final[:msg] = h.to_time(prefix)
    
    final
    
  }.compact
end # === def Http_Error_Log
  
class Http_Error_Log_Helper

  class << self
    
    def to_kv str
      pieces = str.split(':')
      k = pieces.shift
      v = pieces.join(':')
      [ k.strip.to_sym, v.strip ]
    end

    # 
    # Example input:
    # "2012/05/08 04:08:19 [error] 11563#0: *183 connect() failed (111: Connection refused) while connecting to upstream"
    #
    # Output:
    # [ Time, '[error] 1156#0', rest ]
    # 
    def to_time str
      pieces = str.split
      date = pieces.shift
      time = pieces.shift

      err, msg = pieces.join(' ').split(':')

      [ Time.parse("#{date} #{time}" ), err, msg]
    end

  end # === << self

  
end # === Http_Error_Log_Helper
