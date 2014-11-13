class Sorter
  class << self
    ORDER = %w{f k v}

    def sort(data, order)
      data.sort_by { |key| [
        key[key_name(order[0])],
        key[key_name(order[1])],
        key[key_name(order[2])]
      ]}
    end

    def sanatize_order(order)
      return ORDER if order.nil?
      order = order.split(//).keep_if {|a| a =~ /[fkv]/ }
      order.concat(ORDER).uniq
    end

    private

    def key_name(key)
      case key
      when "f"
        :filename
      when "k"
        :key
      when "v"
        :value
      end
    end
  end
end
