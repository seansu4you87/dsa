class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all.to_a

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    categories = Category.categories_from_string params[:photo][:categories]
    params[:photo][:categories] = categories
    
    params[:photo][:image] = params[:photo][:image].tempfile
    
    @photo = Photo.new(params[:photo])
    @photo.user_id = self.current_user.id

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    categories = Category.categories_from_string params[:photo][:categories]
    params[:photo][:categories] = categories
    
    if params[:photo][:image]
      params[:photo][:image] = params[:photo][:image].tempfile
    else
      params[:photo][:image] = nil
    end
    
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :ok }
    end
  end
  
  def image
    @photo = Photo.find(params[:id])
    respond_to do |format|
      format.html { render layout: false }
    end
    #grid_io_data = photo.image.url
    #bytes = grid_io_data.read
    #send_data(bytes, :type => photo.file_content_type, :disposition => 'inline')
  end
  
end
