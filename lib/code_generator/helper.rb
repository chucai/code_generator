module CodeGenerator
  module Helper
    def log(label, text)
      puts "#{label}: #{text}"
    end

    def print_separate_line
      "-" * 98
    end

    def find_template_path_by_name(name)
      template_path = File.join(ROOT_PATH, "templates")
      file_name     = "#{name}.erb"
      [
        File.join(template_path, file_name), 
        File.join(template_path, "ui", file_name)
      ].any? do |path|
        return path if File.exist?(path)
      end
    end

    def parse_input(input)
      raise "The input is required!" if input.nil? || input.lstrip == ''
      yield input if block_given?
    end

    def simple_generate_code(name, template_name)
      raise "The file name is required!" if name.nil? || name.lstrip() == ''
      file_path = find_template_path_by_name(template_name)
      template  = ERB.new File.read(file_path)
      puts template.result(binding).blue
    end
  end
end
