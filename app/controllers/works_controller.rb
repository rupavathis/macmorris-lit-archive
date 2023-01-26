class WorksController < ApplicationController
  before_action :set_work, only: [:show, :update, :destroy]

  # GET /works
  def index
    @works = Work.all

    render json: @works,include:  [work_classification: {only: :name}, patron_id: {only: [:id, :display_name]},
    author_id: {only: :display_name}, printer_id: {only: [:id, :display_name]},
    publisher_id: {only: [:id, :display_name]},bookseller_id: {only: [:id, :display_name]}
  ]
  end

   # GET /titles
   def titles
    works = Work.all
    render json: works, only:  [:id, :work_id, :display_title]
  end


  def showNames
    people = Person.all
    render json: people, only: [:macmorris_id, :id, :display_name, :other_names, :date_of_birth, :date_of_death, 
    :flourishing_date]
  end

  # GET /works/1
  def show
    render json: @work, include:  [places: {only: :name}, languages: {only: :name}, work_classification: {only: :name}, patron_id: {only: [:id, :display_name]},
    author_id: {only: :display_name}, printer_id: {only: [:id, :display_name]},publisher_id: {only: [:id, :display_name]},bookseller_id: {only: [:id, :display_name]}
  ]
  end

  def showSearch
    wc = Work.joins(:work_classification).where(work_classifications: {id: params[:wClassification]})
    wl = Work.where(language: params[:language]).or(Work.where(work_format: params[:wFormat])).or(Work.where(place: params[:place])).or(Work.where(display_title: params[:title]))

    query_results = wc.or(wl)    
    render json: query_results
 end

  # GET filterWorkData/1,2,3
  def filterData
    w = Work.where(id: (params[:ids]).split(','))
    render json: w, include:  [places: {only: :id}, languages: {only: :id}, work_classification: {only: :id}]
  end

 # GET worksPeopleSearch?authors=1822&patrons=3935&printers=3935&publishers=3935&booksellers=3935
  def advancedWorkPeople
 
    if(params[:authors].present? && !params[:patrons].present? && !params[:printers].present? &&
      !params[:booksellers].present? && !params[:publishers].present?) then
        w = Work.where(author_id_id: params[:authors])
    else   
      w = Work.joins(:printer_id, :patron_id, :publisher_id, :bookseller_id)  
      if (params[:authors].present?) then
        w = w.where(author_id_id: params[:authors])
      end
      if (params[:patrons].present?) then
          w = w.where(patron_id: {id: params[:patrons]})
      end
      if (params[:printers].present?) then
        w = w.where(printer_id: {id: params[:printers]})
      end
      if (params[:booksellers].present?) then
        w = w.where(bookseller_id: {id: params[:booksellers]})
      end
      if (params[:publishers].present?) then
        w = w.where(publisher_id: {id: params[:publishers]})
      end
    end

    # wnext =  Work.where(author_id_id: params[:authors])
    # wpatron = Work.joins(:patron_id).where(patron_id: {id: params[:patrons]})
    # output =  [wnext,wpatron]

    render json: [w], include: [author_id: {only: :name}, patron_id: {only: [:id, :name]},
    printer_id: {only: [:id, :name]},publisher_id: {only: [:id, :name]},
    bookseller_id: {only: [:id, :name]}]
  end

  # POST /works
  def create
    @work = Work.new(work_params)

    if @work.save
      render json: @work, status: :created, location: @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /works/1
  def update
    if @work.update(work_params)
      render json: @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  # DELETE /works/1
  def destroy
    @work.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(:work_id, :person_id, :authorship_id, :work_form_id, :title, :display_title, :language_id, :work_date, :place_id, :visualisation_location, :shelfmark, :work_source_library_id, :marc_id, :bardic_id, :link_uri, :description)
    end
end
