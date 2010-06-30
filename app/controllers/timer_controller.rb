class TimerController < ApplicationController
  def stop
    timer = Timer.find(params[:id])
    timer.stop_time = DateTime.now()
    timer.save
    render :text => "Timer for #{timer.task.name} stopped at #{timer.stop_time}"
  end

  def delete
	Timer.destroy(params[:id])
	render :nothing => true
  end
end
