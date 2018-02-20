class ExercisesController < ApplicationController

  def create
    @workout = Workout.find(params[:workout_id])
    # @exercises = Exercise.new(@workout)
    @exercises = @workout.exercises.create(params[:exercise].permit(:name, :sets, :reps))

    redirect_to workout_path(@workout)
  end
end
