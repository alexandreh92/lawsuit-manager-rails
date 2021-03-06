# frozen_string_literal: true

module ApplicationHelper
  def current_class?(test_path)
    if request.path == test_path
      'item active'
    else
      'item'
    end
  end
end
