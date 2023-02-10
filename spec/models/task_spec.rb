require 'rails_helper'

RSpec.describe Task, type: :model do
    it "is not valid without a title" do
        task = Task.new(title: nil)
        expect(task).to_not be_valid
    end
    
    it "is not valid without a description" do
        task = Task.new(description: nil)
        expect(task).to_not be_valid
    end
end