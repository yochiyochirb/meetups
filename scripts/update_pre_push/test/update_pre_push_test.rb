require 'minitest/autorun'
require 'minitest/stub_any_instance'
require_relative '../update_pre_push.rb'

include PrePushUpdater

class TestPrePushUpdater < Minitest::Test
  def setup
    @pre_push_file = File.join(File.dirname($PROGRAM_NAME), 'pre_push.test')
    @template_file = File.join(File.expand_path(File.join(File.dirname($PROGRAM_NAME), '..')), 'template', 'pre-push.erb')
  end

  def teardown
    File.delete(@pre_push_file) if File.exist?(@pre_push_file)
  end

  def test_check_if_git_command_exist_returns_true_if_exist
    Object.stub_any_instance(:call_git_version, -> { return 0, '' }) do
      assert check_if_git_command_exist
    end
  end

  def test_check_if_git_command_exist_returns_true_if_does_not_exist
    Object.stub_any_instance(:call_git_version, -> { return 127, '' }) do
      refute check_if_git_command_exist
    end
  end

  def test_git_directory_returns_expected_directory
    Object.stub_any_instance(:call_git_rev_parse_git_dir, -> { return 0, "/repo/.git\n" }) do
      assert_equal '/repo/.git', git_directory
    end
  end

  def test_git_directory_returns_nil_when_command_exited_with_failure
    Object.stub_any_instance(:call_git_rev_parse_git_dir, -> { return 1, '' }) do
      assert_nil git_directory
    end
  end

  def test_git_version_returns_expected_version_when_generic_git
    Object.stub_any_instance(:call_git_version, -> { return 0, 'git version 2.6.4' }) do
      assert_equal '2.6.4', git_version
    end
  end

  def test_git_version_returns_expected_version_when_apple_git
    Object.stub_any_instance(:call_git_version, -> { return 0, 'git version 2.5.4 (Apple Git-61)' }) do
      assert_equal '2.5.4', git_version
    end
  end

  def test_git_version_returns_expected_version_when_windows_git
    Object.stub_any_instance(:call_git_version, -> { return 0, 'git version 2.6.4.windows.1' }) do
      assert_equal '2.6.4.windows.1', git_version
    end
  end

  def test_git_version_returns_nil_when_command_exited_with_failure
    Object.stub_any_instance(:call_git_version, -> { return 1, '' }) do
      assert_nil git_version
    end
  end

  def test_valid_version_returns_true_when_2_4
    assert valid_version?('2.4')
  end

  def test_valid_version_returns_true_when_2_4_1
    assert valid_version?('2.4.1')
  end

  def test_valid_version_returns_true_when_22_44_11
    assert valid_version?('22.44.11')
  end

  def test_valid_version_returns_false_when_2_3_99
    refute valid_version?('2.3.99')
  end

  def test_valid_version_returns_false_when_1_8
    refute valid_version?('1.8')
  end

  def test_valid_version_returns_false_when_1
    refute valid_version?('1')
  end

  def test_update_pre_push_file_create_expected_file_with_admin_flag
    update_pre_push_file(@template_file, @pre_push_file, true)
    content = File.open(@pre_push_file).read
    assert content.include?('if there exists at least 1 commit log which does not start with')
  end

  def test_update_pre_push_file_create_expected_file_without_admin_flag
    update_pre_push_file(@template_file, @pre_push_file, false)
    content = File.open(@pre_push_file).read
    refute content.include?('if there exists at least 1 commit log which does not start with')
  end

  def test_update_pre_push_file_returns_false_on_failure
    refute update_pre_push_file('notexist', @pre_push_file, false)
  end
end
