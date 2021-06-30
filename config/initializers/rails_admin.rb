require "nested_form/engine"
require "nested_form/builder_mixin"

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    all
    import

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  # To change the heading of the admin app
  # RailsAdmin.config do |config|
  config.main_app_name = ["MACMORRIS", "Admin"]
  # end
   # Optional:
  # Configure global RailsAdminImport options
  # config.configure_with(:import) do |config|
  #   config.logging = true
  # end
  # config.model 'Attrib' do
  #   label 'Attributes/Roles'
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'WorkClassification' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'WorkSourceLibrary' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'WorkForm' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'siteType' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'Role' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'RelationshipCategory' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'RelationshipType' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'ReligiousDesignation' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'ReligiousOrder' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'PlaceType' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  # config.model 'Language' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end
  # config.model 'Gender' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end
  # config.model 'EventType' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end
  # config.model 'BirthDeathDateType' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end
  # config.model 'Authorship' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end
  # config.model 'ReligiousSubtype' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end
  # config.model 'SiteType' do
  #   include_all_fields
  #   field :name do
  #     required true
  #   end
  # end

  config.model 'Work' do
    include_all_fields
    field :work_id do
      label 'Work ID'
      required true
    end
    field :author_id do
      label 'Author'
    end

    field :patron_id do
      label 'Patron/Collaborator'
    end
    field :place do
      label 'Location'
    end
    field :description do
      label 'Description'
    end
    field :display_title do
      required true
    end
    field :work_date do
      strftime_format "%Y-%m"
    end
    field :marc_id do
      label 'MARC ID'
    end
    # field :bardic_poetry_id do
    #   label 'Bardic ID'
    # end
    field :marc_id do
      label 'MARC ID'
    end
      # object_label_method do
      # :custom_label_method
  end

  config.model 'Place' do
    include_all_fields
    field :name do
      label 'Name (English)'
    end
    field :gaelic_name do
      label 'Name (Gaelic)'
    end
  end

  config.model 'Event' do
    # exclude_fields :id
    include_all_fields
    field :event_id do
      label 'Event ID'
      required true
    end
    # field :name_in_EN do
    #   label 'Name (English)'
    # end
    field :gaelic_name do
      label 'Name (Gaelic)'
    end
    field :start_date do
      strftime_format "%Y-%m"
    end  
    field :end_date do
      strftime_format ("%Y-%m" || "%Y" || "%Y-%m-%d")
    end  
    field :place do
      label 'Location'
    end
  end

  config.model 'Site' do
    # exclude_fields :id
    include_all_fields
    field :site_id do
      label 'Site ID'
      required true
    end
    field :site_type do
      # required false
    end
    field :name do
      label 'Name (English)'
    end
    field :gaelic_name do
      label 'Name (Gaelic)'
    end
    field :place do
      label 'Location'
      # required false
    end
  end

  config.model 'Connection' do
    label 'Bio Connections'
  end
  config.model 'EventsPerson' do
    label 'People to Event Connections'
  end
  config.model 'PeopleSite' do
    label 'People to Site Connections'
  end
  config.model 'Attrib' do
    label 'Attribute'
  end
  config.model 'Person' do
    # field :id do
    #   column_width 50
    # end
    include_all_fields
    field :macmorris_id do
      label 'MACMORRIS ID'
      required true
      column_width 150
    end
    field :is_cultural_actor do
      label 'Is Cultural Actor?'
      column_width 150
    end
    field :first_name
    field :last_name
    field :maiden_name
    field :husbands_name do
      label 'Husband(s) Name'
    end
    field :aristocratic_title
    field :pseudonym
    field :initials
    field :religious_title
    field :name_in_religion
    field :other_names
    field :display_name
    field :gender
    field :birth_date_type do
      required false
    end
    field :date_of_birth do
      strftime_format "%Y"
    end
    field :death_date_type do
      required false
    end
    field :date_of_death do
      strftime_format "%Y"
    end
    field :flourishing_date_type do
      required false
    end
    field :flourishing_date do
      strftime_format "%Y"
    end
    field :active_in_ireland_start 
    #   strftime_format "%Y-%m-%d"
    # end      
    field :active_in_ireland_end 
    #   strftime_format "%Y-%m-%d"
    # end
    # field :religious_order
    # field :attrib do
    #   label 'Attributes/Role' # Change the label of this field
    # end
    field :self_described_identity
    field :nationality do
      label 'Nationality (if not Irish or English)'
    end
    field :quotes
    field :notes
    field :reference_text
    field :odnb_id do
      label 'ODNB ID'
    end
    field :dib_id do
      label 'DIB ID'
    end
    field :tnop_id do
      label 'TNOP ID'
    end
    field :wikidata_id     
    field :ainm_id do
      label 'AINM ID'
    end
    field :sdfb do
      label 'SDFB'
    end
    exclude_fields :person_author
    exclude_fields :person_patron
    exclude_fields :person_printer

    # field :t.timestamps
    # field :created_at
    # config.default_hidden_fields = {
    #   show: [:created_at, :updated_at]
    # }
    # config.default_hidden_fields[:show] = [:created_at, :updated_at]
  end
  # Optional:
  # Configure model-specific options using standard RailsAdmin DSL
  # See https://github.com/sferik/rails_admin/wiki/Railsadmin-DSL
  # config.model 'User' do
  #   import do
  #     include_all_fields
  #     exclude_fields :secret_token
  #   end
  # end
end
