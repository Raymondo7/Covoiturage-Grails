# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @trip = Trip.find(params[:trip_id])
    @comment = @trip.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @trip, notice: 'Commentaire ajouté avec succès.'
    else
      redirect_to @trip, alert: 'Erreur lors de l\'ajout du commentaire.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rating)
  end
end
