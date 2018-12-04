require 'rails_helper'

RSpec.describe Transaction, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:item) }

    it { should belong_to(:seller) }

    it { should belong_to(:buyer) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
