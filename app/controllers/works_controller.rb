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

  # # GET /search/works/1
  # def showWorksSearch
  #   works = Work.find(params[:id])

  #   render json: [works],include:  [work_classification: {only: :name}, patron_id: {only: [:id, :display_name]},
  #   author_id: {only: :display_name}, printer_id: {only: [:id, :display_name]},
  #   publisher_id: {only: [:id, :display_name]},bookseller_id: {only: [:id, :display_name]}
  # ]
  # end

    
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
    render json: @work, include:  [places: {only: :name}, languages: {only: :name}, work_classification: {only: :name}, patron_id: {only: [:macmorris_id, :display_name]},
    author_id: {only: [:macmorris_id, :display_name]}, printer_id: {only: [:macmorris_id, :display_name]},publisher_id: {only: [:macmorris_id, :display_name]},bookseller_id: {only: [:macmorris_id, :display_name]}
  ]
  end

  # GET filterWorkData/1,2,3
  def filterData
    w = Work.where(id: (params[:ids]).split(','))
    render json: w, include:  [places: {only: :id}, languages: {only: :id}, work_classification: {only: :id}]
  end

   # GET search/works/1
   def showWorksSearch
    work = Work.find(params[:id])
    render json: [work], only:  [:id, :work_id, :display_title, :work_date], include:  [languages: {only: :name},
    author_id: {only: :name}]
  end


   # GET /advancedSearch/works?wFormat=1&language=1&wClassification=1&place=1&bardic=yes&author=1
   def showAdvancedWorksSearch

    # wc = Work.joins(:work_classification).where(work_classifications: {id: params[:wClassification]})
    # wl = Work.where(language: params[:language]).or(Work.where(work_format: params[:wFormat])).or(Work.where(place: params[:place])).or(Work.where(display_title: params[:title]))

    wAll = Work.all.includes(:languages, :author_id)
    if (params[:wFormat].present?) then
      wAll = wAll.where(work_format: params[:wFormat])
    end

    if (params[:language].present?) then
      wAll = wAll.where(languages: {id: params[:language]})
    end

    if (params[:wClassification].present?) then
      wAll = wAll.joins(:work_classification).where(work_classifications: {id: params[:wClassification]})
    end

    if (params[:place].present?) then
      wAll = wAll.joins(:places).where(places:params[:place])
    end

    if (params[:bardic].present?) then
      wAll = wAll.where.not(bardic_poetry_id:nil)
    end

    if(params[:author].present?) then
      wAll = wAll.where(author_id_id: params[:author])
    end

    render json: wAll, only:  [:id, :work_id, :display_title, :work_date], include:  [languages: {only: :name},
      author_id: {only: :name}]
    # , include:  [places: {only: :id}, languages: {only: :id}, work_classification: {only: :id}]

  end


 # GET worksPeopleSearch?authors=1822&patrons=3935&printers=3935&publishers=3935&booksellers=3935
  def advancedWorkPeople
 
    if(params[:authors].present? && !params[:patrons].present? && !params[:printers].present? &&
      !params[:booksellers].present? && !params[:publishers].present?) then
        w = Work.where(author_id_id: params[:authors])
    else   
      w = Work.includes(:printer_id, :patron_id, :publisher_id, :bookseller_id)  
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

    p0 = getPeople(w[0])
    o2 = p0.map{ |e| (getWorks(e))}.flatten().uniq


    # wnext =  Work.where(author_id_id: params[:authors])
    # wpatron = Work.joins(:patron_id).where(patron_id: {id: params[:patrons]})
    # output =  [wnext,wpatron]

    render json: [w, o2], include: [author_id: {only: :name}, patron_id: {only: [:id, :name]},
    printer_id: {only: [:id, :name]},publisher_id: {only: [:id, :name]},
    bookseller_id: {only: [:id, :name]}]
  end

  def getWorks(p)
    # return p
    # return  p.person_author + p.person_printer.or(p.person_patron).or(p.person_publisher).or(p.person_bookseller)
    return  (p.person_author + p.person_printer+ p.person_patron + p.person_publisher + p.person_bookseller).uniq { |p| p.id }
  end

  def getPeople(w)
    # return [w.author_id] + w.printer_id.or(w.patron_id).or(w.publisher_id).or(w.bookseller_id)
    return ([w.author_id] + w.printer_id + w.patron_id + w.publisher_id + w.bookseller_id).uniq{ |p| p.id }
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
