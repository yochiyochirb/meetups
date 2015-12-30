require 'open-uri'

# TODO 以下はダミーなので、差し替える https://raw.githubusercontent.com/yochiyochirb/meetups/master/scripts/update_pre_push/pre-push.sample
SCRIPT_URI = 'https://raw.githubusercontent.com/yochiyochirb/meetups/master/members/yucao24hours.md'

File.open('.git/hooks/pre-push', 'a') do |f|
  begin
    f.write open(SCRIPT_URI).read
    f.chmod 0755
    puts 'Your pre-push hook ("./.git/hooks/pre-push") has been successfully updated!'
  rescue => e
    puts "An error occurred while updating your pre-push hook.\n#{e}"
  end
end
