require 'rails_helper'

RSpec.describe Item, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:item_type) }

    it { should belong_to(:status) }

    it { should belong_to(:location) }

    it { should have_many(:bookmarks) }

    it { should have_many(:comments) }

    it { should have_many(:transactions) }

    it { should belong_to(:poster) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
