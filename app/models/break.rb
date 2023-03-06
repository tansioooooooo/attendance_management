class Break
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :date, type: Date
  field :start_time, type: Time
  field :end_time, type: Time
end
