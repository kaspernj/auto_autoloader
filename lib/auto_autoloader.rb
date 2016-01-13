class AutoAutoloader
  def self.autoload_sub_classes(base, path)
    loader = ::AutoAutoloader.new(base: base, path: path)

    if loader.rails?
      loader.autoload_by_active_support_and_file_scan
    else
      loader.autoload_with_sub_class_autoloader
    end
  end

  def initialize(args)
    @base = args.fetch(:base)
    @path = args.fetch(:path)
  end

  def autoload_with_sub_class_autoloader
    require_relative "auto_autoloader/sub_class_autoloader"
    @base.extend ::AutoAutoloader::SubClassAutoloader::ClassMethods
    path = @path

    @base.class_eval do
      @autoload_path = ::File.dirname(path)
    end
  end

  def autoload_by_active_support_and_file_scan
    dir_path = "#{::File.dirname(@path)}/#{::StringCases.camel_to_snake(@base.name.split("::").last)}"

    ::Dir.foreach(dir_path) do |file|
      next unless (match = file.match(/\A(.+)\.rb\Z/))
      const_snake_case = match[1]
      const_camel_case = ::StringCases.snake_to_camel(const_snake_case)

      base.autoload(const_camel_case, "#{dir_path}/#{file}")
    end
  end

  def rails?
    @rails ||= ::Object.const_defined?("Rails")
  end
end
