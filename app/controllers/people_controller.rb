class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  def index
    @people = Person.all

    render json: @people
  end

  # GET /people/1
  def show
    render json: @person, include: [languages: {only: :name}, attribs: {only: :name}, gender: {only: :name}, religious_order: {only: :name},
                                       birth_date_type: {only: :name}, death_date_type: {only: :name}, flourishing_date_type: {only: :name}]
  end

   # GET /people/1/works
  def showWorks
    # person_new = Person.find(params[:id])
    # person_id = person_new.id
    # render json: person_id
    p = Person.find(params[:id])
    # person_id = person_new.macmorris_id
    pn = p.person_author
    pp = p.person_patron
    pprinter = p.person_printer
    pb = p.person_bookseller
    ppublisher = p.person_publisher
    pWorks = pn + pp + pprinter +pb +ppublisher
    # render json: {id: pn}
    render json: pWorks
  end

  
  def showNames
    people = Person.all
    render json: people, only: [:macmorris_id, :id, :display_name, :other_names]
  end

  def showConnections
    p = Person.find(params[:id])
    # ps = p.person_source.map{|c| c.target_id}
    # pt = p.person_target.map{|c| c.source_id}
    cs = p.person_source
    ct = p.person_target
    cc = cs + ct
    render json: cc, only: :id, include: [:relationship_types, target_id: {only: [:id, :name]}, source_id: {only: [:id, :name]}]
  end

  def showSearch
    ps = Person.joins(:attribs).where(attribs: {id: params[:attribs]})
            .joins(:religious_subtypes).where(religious_subtypes: {id: params[:rSubtype]})
    p = ps.where(gender: params[:gender], religious_order: params[:rOrder])

    render json: p, include: [attribs: {only: :name}, gender: {only: :name}]
  end

  # GET filterData/1,2,3
  def filterData
    p = Person.where(id: (params[:ids]).split(','))
    render json: p, only: :id, include: [attribs: {only: :id}, gender: {only: :id}, religious_designations: {only: :id}]
  end

  # # GET people/gender/:gid/rSubtype/:rid/rOrder/:oid/attribs/:aid
  # def showSearchResults
  #   rOrder = params[:oid]
  #   ps = Person.joins(:attribs).where(attribs: {id: params[:aid]}).
  #         joins(:religious_subtypes).where(religious_subtypes: {id: params[:rid]})
  #   if rOrder == "nil"
  #     p = ps.where(gender:params[:gid], religious_order:nil)
  #   elsif
  #     p = ps.where(gender:params[:gid], religious_order:rOrder)
  #   end
  #   render json: p, include: [attribs: {only: :name}, gender: {only: :name}]
  # end

   # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:macmorris_id, :is_cultural_actor, :first_name, :last_name, :maiden_name, :husbands_name, :aristocratic_title, :pseudonym, :initials, :religious_title, :name_in_religion, :other_names, :display_name, :gender, :birth_date_type_id, :date_of_birth, :place_id, :death_date_type_id, :date_of_death, :florishing_date_type_id, :flourishing_date, :active_in_ireland_start, :active_in_ireland_end, :religious_order_id, :self_described_identity, :quotes, :notes, :reference_text, :odnb_id, :dib_id, :tnop_id, :wikidata_id, :ainm_id, :sdfb)
    end
end
