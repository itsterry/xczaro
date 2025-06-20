class UploadsController < ApplicationController
  before_action :set_upload, only: %i[ show edit update destroy ]

  expose :q
  expose :upload, ->{ @upload  }
  expose :uploads

  # GET /uploads or /uploads.json
  def index;  end

  # GET /uploads/1 or /uploads/1.json
  def show
    @upload.update access_count: @upload.access_count + 1,
                  last_accessed_at: Time.current

  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads or /uploads.json
  def create
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: "Upload was successfully created." }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1 or /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: "Upload was successfully updated." }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1 or /uploads/1.json
  def destroy
    @upload.destroy!

    respond_to do |format|
      format.html { redirect_to uploads_path, status: :see_other, notice: "Upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def default_sorts
    [ "title asc" ]
  end
  def q
    @q ||= begin
             q = Upload.ransack(params[:q])
             q.sorts = default_sorts if q.sorts.blank?
             q
           end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_upload
    @upload = Upload.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def upload_params
    params.expect(upload: [ :title, :attachment, :optimized ])
  end

  def uploads
    @uploads ||= q.result.page(params[:page]).per(7)
  end
end
