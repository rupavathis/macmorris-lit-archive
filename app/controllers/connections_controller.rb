class ConnectionsController < ApplicationController
  before_action :set_connection, only: [:show, :update, :destroy]

  # GET /connections
  def index
    @connections = Connection.all

    render json: @connections
  end

  def showConnections
    connection = Connection.all
    render json: connection, include: [target_id: {only: :name}, source_id: {only: :name}]
  end

   # GET /showConnection/1,2,3
   def showConnection
    degree1Targets = Connection.where(source_id_id: params[:ids].split(','))
    degree1Sources = degree1Targets.map { |element| element.target_id_id }
    degree2Targets = Connection.where(source_id_id: degree1Sources)
    render json: [degree1Targets, degree2Targets], include: [target_id: {only: :name}, source_id: {only: :name}]
  end

  # GET /showROrderConnections/1
  def showROrderConnections(rOrders)
    people = Person.where(religious_order: rOrders.split(','))
    degree1Sources = people.map {|element| element.id }
    degree1Targets = Connection.where(source_id_id: degree1Sources)
    degree2Sources = degree1Targets.map { |element| element.target_id_id }
    degree2Targets = Connection.where(source_id_id: degree2Sources)
    # output = degree1Targets + degree2Targets
    render json: [degree1Targets, degree2Targets], include:
                             [target_id: {only: :name}, source_id: {only: :name}]
  end

  # GET advancedPeopleSearch?rOrders=11&rattribs=1,2 
  def showAttribsConnections(attribs)
    people = Person.joins(:attribs).where(attribs: attribs.split(','))
    degree1Sources = people.map {|element| element.id }
    degree1Targets = Connection.where(source_id_id: degree1Sources)
    degree2Sources = degree1Targets.map { |element| element.target_id_id }
    degree2Targets = Connection.where(source_id_id: degree2Sources)
    # output = degree1Targets + degree2TargetsP
    render json: [degree1Targets, degree2Targets], include: [target_id: {only: :name}, 
                                        source_id: {only: :name}]
  end

  def rOrderAttribsConnections(rOrders, attribs)
    people = Person.joins(:attribs).where(attribs: attribs.split(',')).and(
                              Person.where(religious_order: rOrders.split(',')))
    degree1Sources = people.map {|element| element.id }
    degree1Targets = Connection.where(source_id_id: degree1Sources)
    degree2Sources = degree1Targets.map { |element| element.target_id_id }
    degree2Targets = Connection.where(source_id_id: degree2Sources)
    render json: [degree1Targets, degree2Targets], include: [target_id: {only: :name}, source_id: {only: :name}]
  end

  
  # GET /advancedPeopleSearch?rOrder=1,2&attribs=1
  def advancedPeopleSearch
    if (params[:rOrders].present? && params[:attribs].present?) then
      puts("in if")
      rOrderAttribsConnections(params[:rOrders], params[:attribs])

    elsif (!params[:rOrders].present? && params[:attribs].present?) then
      puts("in 1st elsif")
      showAttribsConnections(params[:attribs])

    else
      puts("in else")
      showROrderConnections(params[:rOrders])
    end
  end


  # GET /showWorkTitleConnections/1
  def showWorkTitleConnections
    works = Work.where(id: params[:id])
    degree1Sources = works.map {|element| element.author_id_id }
    degree1Targets = Work.where(author_id_id: degree1Sources)
    degree2SourcesPatron = degree1Targets.map { |element| element.patron_id.ids }
    # puts("degree2SourcesPatron", degree2SourcesPatron)

    degree2TargetsPatron = Work.joins(:patron_id).where(patron_id: {id: degree2SourcesPatron.flatten(1)})
    # puts("degree2TargetsPatron", degree2TargetsPatron)

    degree2SourcesPrinter = degree1Targets.map { |element| element.printer_id.ids }
    degree2TargetsPrinter = Work.joins(:printer_id).where(printer_id: {id: degree2SourcesPrinter.flatten(1)})
    degree2SourcesPublisher = degree1Targets.map { |element| element.publisher_id.ids }
    degree2TargetsPublisher = Work.joins(:publisher_id).where(publisher_id: {id: degree2SourcesPublisher.flatten(1)})
    degree2SourcesBookSeller = degree1Targets.map { |element| element.bookseller_id.ids }
    degree2TargetsBookSeller = Work.joins(:bookseller_id).where(bookseller_id: {id: degree2SourcesBookSeller.flatten(1)})

    degree2Targets = degree2TargetsPatron

    # + degree2TargetsPrinter + degree2TargetsPublisher + degree2TargetsPublisher
    render json: [degree1Targets, degree2Targets],
                include: [author_id: {only: :name}, patron_id: {only: [:id, :name]},
                printer_id: {only: [:id, :display_name]},publisher_id: {only: [:id, :display_name]},
                bookseller_id: {only: [:id, :display_name]}]
  end

  # GET /connections/1
  def show
    render json: @connection
  end

   # GET /advancedWorkSearch?wClassification=1,2
  def advancedWorkSearch
    degree1Targets = Work.joins(:work_classification).where(work_classifications: {id: params[:wClassification].split(',')})
    degree2SourcesPatron = degree1Targets.map { |element| element.patron_id.ids }
    # puts("degree2SourcesPatron", degree2SourcesPatron)
    degree2SourcesPrinter = degree1Targets.map { |element| element.printer_id.ids }
    degree2SourcesPublisher = degree1Targets.map { |element| element.publisher_id.ids }
    degree2SourcesBookSeller = degree1Targets.map { |element| element.bookseller_id.ids }

    degree2Targets = Work.joins(:patron_id).where(patron_id: {id: degree2SourcesPatron.flatten(1)}).
                      merge(Work.joins(:patron_id).where(patron_id: {id: degree2SourcesPatron.flatten(1)})).
                      merge(Work.joins(:printer_id).where(printer_id: {id: degree2SourcesPrinter.flatten(1)})).
                      merge(Work.joins(:publisher_id).where(publisher_id: {id: degree2SourcesPublisher.flatten(1)})).
                      merge(Work.joins(:bookseller_id).where(bookseller_id: {id: degree2SourcesBookSeller.flatten(1)}))

    # + degree2TargetsPrinter + degree2TargetsPublisher + degree2TargetsPublisher
    render json: [degree1Targets, degree2Targets],
                include: [author_id: {only: :name}, patron_id: {only: [:id, :name]},
                printer_id: {only: [:id, :display_name]},publisher_id: {only: [:id, :display_name]},
                bookseller_id: {only: [:id, :display_name]}]


  end

   # GET /showWorkAuthorConnections/1
   def showWorkAuthorConnections
    degree1Targets = Work.where(author_id_id: params[:id])
    degree2SourcesPatron = degree1Targets.map { |element| element.patron_id.ids }
    # puts("degree2SourcesPatron", degree2SourcesPatron)

    degree2TargetsPatron = Work.joins(:patron_id).where(patron_id: {id: degree2SourcesPatron.flatten(1)})
    # puts("degree2TargetsPatron", degree2TargetsPatron)

    degree2SourcesPrinter = degree1Targets.map { |element| element.printer_id.ids }
    degree2TargetsPrinter = Work.joins(:printer_id).where(printer_id: {id: degree2SourcesPrinter.flatten(1)})
    degree2SourcesPublisher = degree1Targets.map { |element| element.publisher_id.ids }
    degree2TargetsPublisher = Work.joins(:publisher_id).where(publisher_id: {id: degree2SourcesPublisher.flatten(1)})
    degree2SourcesBookSeller = degree1Targets.map { |element| element.bookseller_id.ids }
    degree2TargetsBookSeller = Work.joins(:bookseller_id).where(bookseller_id: {id: degree2SourcesBookSeller.flatten(1)})

    degree2Targets = degree2TargetsPatron

    # + degree2TargetsPrinter + degree2TargetsPublisher + degree2TargetsPublisher
    render json: [degree1Targets, degree2Targets],
                include: [author_id: {only: :name}, patron_id: {only: [:id, :name]},
                printer_id: {only: [:id, :display_name]},publisher_id: {only: [:id, :display_name]},
                bookseller_id: {only: [:id, :display_name]}]
  end

  # GET /connections/1
  def show
    render json: @connection
  end

  # POST /connections
  def create
    @connection = Connection.new(connection_params)

    if @connection.save
      render json: @connection, status: :created, location: @connection
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /connections/1
  def update
    if @connection.update(connection_params)
      render json: @connection
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /connections/1
  def destroy
    @connection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connection
      @connection = Connection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def connection_params
      params.require(:connection).permit(:source_target_type_id, :source, :target, :birth_death_date_type_id, :start_date, :end_date, :time_period_id, :place_id, :reference, :connection_verified)
    end
end
