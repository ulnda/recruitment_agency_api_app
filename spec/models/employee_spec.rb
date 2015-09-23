require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { create(:employee) }

  it { expect(employee).to respond_to(:name) }
  it { expect(employee).to respond_to(:contact_info) }
  it { expect(employee).to respond_to(:job_search) }
  it { expect(employee).to respond_to(:salary) }

  it { expect(employee).to be_valid }

  describe 'name validations' do
    describe 'presence validation' do
      before { employee.name = nil }
      it { expect(employee).not_to be_valid }  
    end

    describe 'format validation' do
      names_list = ['Ivanov Ivan Ivanovich', 'Иванов Иван', 'Иванов Иван 1']

      names_list.each do |name|
        before { employee.name = name }
        it { expect(employee).not_to be_valid } 
      end 
    end
  end

  describe 'contact_info validations' do
    describe 'presence validation' do
      before { employee.contact_info = nil }
      it { expect(employee).not_to be_valid }  
    end

    describe 'format validation' do
      describe 'contact_info as phone' do
        context 'with phone without plus' do
          before { employee.contact_info = create(:employee_with_phone).contact_info }
          it { expect(employee).to be_valid }
        end

        context 'with phone with plus' do
          before { employee.contact_info = create(:employee_with_phone_with_plus).contact_info }
          it { expect(employee).to be_valid }
        end

        context 'with incorrect phone' do
          phones_list = ['+790200000000', '890200000000']

          phones_list.each do |phone|
            before { employee.contact_info = phone }
            it { expect(employee).not_to be_valid } 
          end         
        end
      end

      describe 'contact_info as e-mail' do
        context 'with incorrect e-mail' do
          emails_list = ['@test.com', 'test@.com', 'test@gmail.c']

          emails_list.each do |email|
            before { employee.contact_info = email }
            it { expect(employee).not_to be_valid } 
          end
        end
      end
    end
  end

  describe 'job_search validations' do
    describe 'presence validation' do
      before { employee.job_search = nil }
      it { expect(employee).not_to be_valid }  
    end
  end

  describe 'salary validations' do
    describe 'presence validation' do
      before { employee.salary = nil }
      it { expect(employee).not_to be_valid }  
    end

    describe 'integer validation' do
      before { employee.salary = 10.2 }
      it { expect(employee).not_to be_valid }  
    end

    describe 'positive validation' do
      before { employee.salary = 0 }
      it { expect(employee).not_to be_valid }  
    end
  end
end
