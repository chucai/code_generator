require "bundler/gem_tasks"
require 'erb'
require 'colored'

ROOT_PATH = File.expand_path("..", __FILE__)

namespace :generator do
  desc "The tool will genrater a cocos2d::Sprite."
  task :sprite, [:name] do |t, args|
    name = args[:name]
    raise "The Sprite Name is required!" if name.nil? || name.lstrip() == ''

    file_path = File.join(ROOT_PATH, "templates", "sprite.erb")
    template = ERB.new File.read(file_path) 
    puts template.result(binding).blue
  end
end
