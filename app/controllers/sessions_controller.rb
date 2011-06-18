class SessionsController < ApplicationController

  def new
    @session = Session.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  def create
    @session = Session.new(params[:session])

    respond_to do |format|
      if @session.save
        session['user_id'] = @session.user.id
        User.current = @session.user
        format.html { redirect_to root_url, notice: 'Session was successfully created.' }
        format.json { render json: @session, status: :created, location: @session }
      else
        format.html { render action: "new" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session['user_id'] = nil
    User.current = nil
    flash[:notice] = "You have been signed out"
    redirect_to new_session_url
  end
end
