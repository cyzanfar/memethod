class Memethod

  def initialize(extension = '.rb')
    @extension = extension
    extension_file
    count_method
  end

  def extension_file
      ext = File.join("**", "*.rb")
      files = Dir.glob(ext)
  end

  def count_method
    num_files, line_count, method_count = 0, 0, 0
    extension_file.each do |f|
      next if f.index('vendor')
      next if FileTest.directory?(f)
      num_files += 1
      i = 0
      lines = []
      File.new(f).each_line do |line|
        if line.strip[0..2] == 'def'
          method_count += 1
          next
        end
        i += 1
      end
      line_count += i
    end
    display_stat(num_files, line_count, method_count)
  end

  def display_stat(num_files, line_count, method_count)
    puts "\n------------------------------\n#{num_files.to_s} files with #{@extension} extension.\n #{method_count} methods\n#{line_count.to_f} lines of code."
  end


end
