require "bundler/gem_tasks"
require "code_generator"
require 'erb'
require 'colored'
require 'pry'

ROOT_PATH = File.expand_path("..", __FILE__)

desc "Test all tasks"
task :test do
  {
    "generator:sprite"         => 'TestSprite',
    "generator:event_listener" => "listener",
    "generator:random"         => '10',
    "generator:container"      => ["HelloWorld","block"],
    "generator:ui"             => 'label'
  }.each do |name, args|
    Rake::Task[name].invoke(*[args].flatten)
  end
end

namespace :generator do
  include CodeGenerator::Helper

  desc "The tool will genrater a cocos2d::Sprite."
  task :sprite, [:name] do |t, args|
    simple_generate_code(args[:name], "sprite")
  end

  desc "Generate the codes of eventlistener"
  task :event_listener, [:name] do |t, args|
    simple_generate_code(args[:name], "event")
  end

  desc "Generate a random codes"
  task :random, [:number] do |t, args|
    simple_generate_code(args[:number], "rand")
  end

  desc "Generate a container to hold targets, eg: rake generator:container[HelloWorld, blocks]"
  task :container, [:class_name, :name] do |t, args|
    parse_input(args[:name]) do |name|
      class_name = args[:class_name].capitalize
      file_path  = find_template_path_by_name("container")
      template   = ERB.new File.read(file_path)
      puts template.result(binding).blue
    end
  end

  desc "Genearte ui widgets"
  task :ui, [:widget] do |t, args|
    parse_input(args[:widget]) do |name|
      file_path = find_template_path_by_name("label")
      template  = ERB.new File.read(file_path)
      puts template.result(binding).blue
    end
  end

  desc "Generate UserDefault codes"
  task :user_default do
    simple_generate_code("not need", "user_default") 
  end

  desc "Generate File code"
  task :file do
    simple_generate_code("not need", "file")
  end
end
