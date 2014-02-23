#!/usr/bin/ruby

require 'open3'

newline = "\n"
stdout, stderr, status = Open3.capture3('./list_executables.sh')

unless status.success?
  $stderr.write stderr
  exit status.exitstatus
end

executables = stdout.split(newline);

File.open('.gitignore', 'r+') do |f|
  ignored = f.read().split(newline)
  new_executables = executables - ignored

  unless new_executables.empty?
    joined = new_executables.join(newline) + newline
    f.write(joined)
    $stdout.write joined
  end
end
