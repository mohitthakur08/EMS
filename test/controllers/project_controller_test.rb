# frozen_string_literal: true

require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get project_new_url
    assert_response :success
  end

  test 'should get create' do
    get project_create_url
    assert_response :success
  end
end
