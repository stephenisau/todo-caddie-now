class Todo < ApplicationRecord
    attribute :title, :string, default: ""
    attribute :description, :string, default: ""
    attribute :completed, :boolean, default: false
    attribute :due_date, :date, default: Date.today


    scope :completed, -> { where(completed: true) }
    scope :incomplete, -> { where(completed: false) }
    scope :recent, -> { order(created_at: :desc) }
    scope :due_by_date, ->(date) { where(due_date: date) }
    scope :due_by_today, -> { where(due_date: Date.today) }
    scope :due_by_month, -> (month) { having("extract(month from due_date) = ?", month) }

end
