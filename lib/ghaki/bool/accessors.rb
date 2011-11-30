module Ghaki   #:nodoc:
module Bool    #:nodoc:

# Boolean attribute helpers.
module Accessors

  # Generate boolean style getter.
  def bool_reader *attrs
    attrs.each do |name|
      class_eval <<-"END"
        def #{name}?
          @#{name}
        end
      END
    end
  end

  # Generate boolean style setter.
  def bool_writer *attrs
    attrs.each do |name|
      class_eval <<-"END"
        def #{name}! val=true
          @#{name} = val
        end
      END
    end
  end

  # Generate normal getter and boolean style.
  def bool_attr_reader *attrs
    class_eval do attr_reader *attrs end
    bool_reader *attrs
  end

  # Generate normal setter and boolean style.
  def bool_attr_writer *attrs
    class_eval do attr_writer *attrs end
    bool_writer *attrs
  end

  # Generate normal and boolean style getters and setters.
  def bool_attr_accessor *attrs
    class_eval do attr_accessor *attrs end
    bool_accessor *attrs
  end

  # Generate normal getter and boolean style setter.
  def attr_reader_bool_writer *attrs
    class_eval do attr_reader *attrs end
    bool_writer *attrs
  end

  # Generate boolean style getter and normal setter.
  def bool_reader_attr_writer *attrs
    bool_reader *attrs
    class_eval do attr_writer *attrs end
  end

  # Generate boolean style getter and setter.
  def bool_accessor *attrs
    bool_reader *attrs
    bool_writer *attrs
  end

end

end end
