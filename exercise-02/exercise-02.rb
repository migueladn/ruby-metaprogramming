class ConStruct
  def self.new(*properties, &block)
    klass = Class.new do
      attr_accessor *properties
      @properties = properties
      def initialize(*values)
        values.each_with_index do |value,index|
          send("#{self.class.properties[index]}=",value)
        end
      end

      def [](key)
        send key
      end


      def []=(key,value)
        send("#{key}=",value)
      end

      def self.properties
        @properties
      end
    end

    klass.class_eval(&block)
    klass
  end
end

Customer = ConStruct.new(:name, :address) do
    def greeting
      "Hello #{name}!"
    end
end
 
obj = Customer.new("Dave", "123 Main")
 
obj.greeting                            # => "Hello Dave!"
 
puts obj.name                                # => "Dave"
obj[:name] = "Charles"                  # => "Charles"
puts obj["name"]                             # => "Charles"
