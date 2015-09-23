require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { create(:skill) }

  it { expect(skill).to respond_to(:title) }

  it { expect(skill).to be_valid }

  describe 'title validations' do
    describe 'presence validation' do
      before { skill.title = nil }
      it { expect(skill).not_to be_valid }  
    end

    describe 'uniqueness validation' do
      let(:new_skill) { skill.dup }
      it { expect(new_skill).not_to be_valid } 
    end
  end
end
