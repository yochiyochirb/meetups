require 'erb'

module PrePushUpdater
  # Wrap `git rev-parse --git-dir`
  def call_git_rev_parse_git_dir
    result = `git rev-parse --git-dir`
    return $?.exitstatus, result
  rescue => e # A workaround for Windows
    STDERR.puts e
    return 127, ''
  end

  # Wrap `git --version`
  def call_git_version
    result = `git --version`
    return $?.exitstatus, result
  rescue => e # A workaround for Windows
    STDERR.puts e
    return 127, ''
  end

  def check_if_git_command_exist
    status, _result = call_git_version
    status == 0
  end

  # Get .git directory
  def git_directory
    return @git_directory if @git_directory
    status, result = call_git_rev_parse_git_dir
    return nil unless status == 0
    @git_directory = result.chomp
  end

  # Get Git version
  def git_version
    return @git_version if @git_version
    status, result = call_git_version
    return nil unless status == 0
    version_array = result.split.select { |s| s.match(/\A\d+\.\d+\.?\d*.*\Z/) }
    return nil if version_array.empty?
    @git_version = version_array.first
  end

  # Check if Git version is greater than or equal to 2.4
  # as --invert-grep does not work on 2.3 or below.
  def valid_version?(version)
    Gem::Version.new(version) >= Gem::Version.new('2.4')
  end

  # Update pre
  def update_pre_push_file(template_file, destination_file, admin = false)
    erb = ERB.new(File.open(template_file).read, nil, '-')
    result = erb.result(binding)

    File.open(destination_file, 'w') do |f|
      f.write(result)
      f.chmod(0755)
    end
  rescue => e
    STDERR.puts e
    false
  end
end

if __FILE__ == $PROGRAM_NAME
  include PrePushUpdater

  if ARGV[0] == 'admin'
    puts "INFO: pre-push hook will be updated as administrator version."
    admin_flag = true
  end

  unless check_if_git_command_exist
    STDERR.puts 'ERROR: Failed to run git command. Check if git is installed and the excutable path is correctly set in PATH.'
    exit 1
  end

  previous_wd = Dir.getwd
  at_exit { Dir.chdir(previous_wd) }
  Dir.chdir(File.dirname($PROGRAM_NAME))

  unless git_directory
    STDERR.puts 'ERROR: Failed to get .git directory. Are you sure you are in a Git repository?'
    exit 1
  end

  if admin_flag && !git_version
    STDERR.puts 'ERROR: Failed to get git version.'
    exit 1
  end

  if admin_flag && !valid_version?(git_version)
    STDERR.puts 'ERROR: Git version must be greater than or equal to 2.4. Please upgrade Git before updating a pre-push hook.'
    exit 1
  end

  pre_push_file = File.join(git_directory, 'hooks', 'pre-push')

  if File.exist?(pre_push_file)
    puts "WARN: pre-push file already exists (#{pre_push_file}).\nAre you sure you want to overwrite it? (y/n)"
    s = $stdin.gets.chomp
    exit unless s.match(/\Ay\Z/i) || s.match(/\Ayes\Z/i)
  end

  pre_push_template_file = File.join('template', 'pre-push.erb')

  unless update_pre_push_file(pre_push_template_file, pre_push_file, admin_flag)
    STDERR.puts 'An error occurred while updating your pre-push hook.'
    exit 1
  end

  puts "Your pre-push hook (#{pre_push_file}) has been successfully updated!"
end
