module FilingProcessor
  class Base
    attr_reader :parsed_object

    def dig(keys)
      object = parsed_object
      Array.wrap(keys).each do |key|
        if object.present? && object.keys.include?(key)
          object = object[key]
        else
          object = nil
        end
      end
      object
    end
  end
end