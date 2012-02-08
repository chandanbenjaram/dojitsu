class UsermailsController < ApplicationController
  # GET /usermails
  # GET /usermails.json
  def index
    @usermails = Usermail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usermails }
    end
  end

  # GET /usermails/1
  # GET /usermails/1.json
  def show
    @usermail = Usermail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @usermail }
    end
  end

  # GET /usermails/new
  # GET /usermails/new.json
  def new
    @usermail = Usermail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @usermail }
    end
  end

  # GET /usermails/1/edit
  def edit
    @usermail = Usermail.find(params[:id])
  end

  # POST /usermails
  # POST /usermails.json
  def create
    @usermail = Usermail.new(params[:usermail])

    respond_to do |format|
      if @usermail.save
	  UserMailer.welcome_email(@usermail).deliver
        format.html { redirect_to @usermail, :notice => 'Usermail was successfully created.' }
        format.json { render :json => @usermail, :status => :created, :location => @usermail }
      else
        format.html { render :action => "new" }
        format.json { render :json => @usermail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usermails/1
  # PUT /usermails/1.json
  def update
    @usermail = Usermail.find(params[:id])

    respond_to do |format|
      if @usermail.update_attributes(params[:usermail])
        format.html { redirect_to @usermail, :notice => 'Usermail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @usermail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usermails/1
  # DELETE /usermails/1.json
  def destroy
    @usermail = Usermail.find(params[:id])
    @usermail.destroy

    respond_to do |format|
      format.html { redirect_to usermails_url }
      format.json { head :ok }
    end
  end
end
