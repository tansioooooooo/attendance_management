# frozen_string_literal: true

module WorkDecorator
  def start_time_format
    self.time_format(start_time)
  end
  def end_time_format
    self.time_format(end_time)
  end

  def time_format(datetime)
    datetime.strftime("%H時%M分")
  end
end
