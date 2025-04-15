# frozen_string_literal: true

require 'test_helper'
require 'rake'

class ImportUsersTest < ActiveSupport::TestCase
  def setup
    App::Application.load_tasks if Rake::Task.tasks.empty?
  end
end
