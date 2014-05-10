require "bundler/gem_tasks"
require 'erb'
require 'colored'

ROOT_PATH = File.expand_path("..", __FILE__)

module Helper
  def log(label, text)
    puts "#{label}: #{text}"
  end

  def print_separate_line
    "-" * 98
  end

  def find_template_path_by_name(name)
    File.join(ROOT_PATH, "templates", "#{name}.erb")
  end

  def simple_generate_code(name, template_name)
    raise "The file name is required!" if name.nil? || name.lstrip() == ''
    file_path = find_template_path_by_name(template_name)
    template  = ERB.new File.read(file_path)
    puts template.result(binding).blue
  end
end


namespace :generator do
  include Helper

  desc "The tool will genrater a cocos2d::Sprite."
  task :sprite, [:name] do |t, args|
    simple_generate_code(args[:name], "sprite")
  end

  desc "Generate the codes of eventlistener"
  task :event_listener, [:name] do |t, args|
    simple_generate_code(args[:name], "event")
  end
end
