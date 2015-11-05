require "page_object_on_demand/version"
require "rspec"

module PageObjectOnDemand
  @@page_object_load_paths = nil

  def self.page_object_load_paths
    @@page_object_load_paths ||= if defined? Rails
      @@page_object_load_paths = [
        Rails.root.join('spec', 'features', 'pages'),
        Rails.root.join('spec', 'features', 'support', 'pages'),
        Rails.root.join('spec', 'pages')
      ].select {|path| File.directory? path }
    else
      []
    end
  end

  def method_missing(m, *args, &block)
    if m.to_s =~ /^.+_page$/
      try_to_load_page_object_file base_name: m
      page_class = m.to_s.camelize.constantize
      page_class.new
    else
      super
    end
  end

  private

  def try_to_load_page_object_file(base_name:)
    base_name_with_ext = "#{base_name}.rb"

    possible_paths = PageObjectOnDemand.page_object_load_paths
      .map{ |dir| File.join(dir, base_name_with_ext) }

    first_found = possible_paths.detect{ |path| File.file? path }

    require first_found if first_found
  end
end

RSpec.configure do |config|
  config.include PageObjectOnDemand, type: :feature
end
