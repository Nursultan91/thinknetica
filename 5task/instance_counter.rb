module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  @@instances = 0

  module ClassMethods
    def instances
      puts @@instances
    end
  end

  module InstanceMethods
    def register_instance
      @@instances += 1
    end
  end

end