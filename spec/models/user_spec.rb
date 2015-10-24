require 'rails_helper'

describe User do
  it { should have_many :posts }
  it { should have_many :comments }
  # Do I want to do the test below?
  # it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
end
