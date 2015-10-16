require 'rails_helper'

describe Tag do
  it { should validate_presence_of :category }
  it { should have_and_belong_to_many(:posts) }
end
