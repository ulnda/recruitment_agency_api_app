class Employee < ActiveRecord::Base
  CONTACT_INFO_REGEX = /(\A[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}\z)|(\A\+?\d{11}\z)/
  NAME_REGEX = /\A[а-яА-Я]+ [а-яА-Я]+ [а-яА-Я]+\z/

  validates :name, presence: true, format: { with: NAME_REGEX }
  validates :contact_info, presence: true, format: { with: CONTACT_INFO_REGEX }
  validates :job_search, inclusion: { in: [true, false] }
  validates :salary, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
