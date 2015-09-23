FactoryGirl.define do
  factory :employee do
    name 'Иванов Иван Иванович'
    job_search false
    salary 1000
    contact_info Faker::Internet.email

    factory :employee_with_phone do
      contact_info Faker::PhoneNumber.subscriber_number(11)
    end

    factory :employee_with_phone_with_plus do
      contact_info '+' + Faker::PhoneNumber.subscriber_number(11)
    end
  end
end
