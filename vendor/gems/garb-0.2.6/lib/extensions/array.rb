class Array
  def group_to_array
    h = Hash.new

    each do |element|
      key = yield(element)
      if h.has_key?(key)
        h[key] << element
      else
        h[key] = [element]
      end
    end

    h.map{|k,v| v}
  end
end
