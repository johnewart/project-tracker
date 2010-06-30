class Timer < ActiveRecord::Base
    belongs_to :task

    def to_s
	return "#{start_time} -- #{stop_time}"
    end
end
