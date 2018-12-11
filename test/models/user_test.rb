require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:one)
  end


  test 'should save valid user' do

    @user.save
    assert @user.valid?

  end

  test 'should not save empty user' do

    user = User.new
    user.save

    refute user.valid?

  end




end
