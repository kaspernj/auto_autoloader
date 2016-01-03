class AutoAutoloader
  def self.autoload_sub_classes(base, path)
    base.extend AutoAutoloader::ClassMethods

    base.class_eval do
      @autoload_path = path
    end
  end

  module ClassMethods
    def const_missing(const_name)
      require "string-cases"

      last_name = const_name.to_s.split("::").last
      last_class_name = name.to_s.split("::").last

      path = "#{@autoload_path}/#{::StringCases.camel_to_snake(last_class_name)}/#{::StringCases.camel_to_snake(last_name)}.rb"

      if File.exist?(path)
        require path

        if const_defined?(last_name)
          return const_get(last_name)
        else
          raise LoadError, "Expected path to define #{const_name} but it didnt: #{path}"
        end
      end

      super
    end
  end
end
