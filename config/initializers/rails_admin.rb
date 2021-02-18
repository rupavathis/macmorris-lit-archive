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
  RailsAdmin.config do |config|
    config.main_app_name = ["MACMORRIS", "Admin"]
  end
   # Optional:
  # Configure global RailsAdminImport options
  config.configure_with(:import) do |config|
    config.logging = true
  end
  config.model 'Attrib' do
    label 'Attributes/Roles'
  end

  config.model 'Work' do
    include_all_fields
    field :work_id do
      label 'Work ID'
    end
    field :place do
      label 'Location'
    end
    field :desc do
      label 'Description'
    end
    field :display_title do
      required true
    end
    field :marc_id do
      label 'MARC ID'
    end
    field :bardic_id do
      label 'Bardic ID'
    end
    field :marc_id do
      label 'MARC ID'
    end
      # object_label_method do
      # :custom_label_method
  end

  config.model 'Place' do
    include_all_fields
    field :name_in_EN do
      label 'Name (English)'
    end
    field :name_in_GA do
      label 'Name (Gaelic)'
    end
  end

  config.model 'Event' do
    # exclude_fields :id
    include_all_fields
    field :event_id do
      label 'Event ID'
    end
    field :name_in_EN do
      label 'Name (English)'
    end
    field :name_in_GA do
      label 'Name (Gaelic)'
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
    end
    field :name_in_EN do
      label 'Name (English)'
    end
    field :name_in_GA do
      label 'Name (Gaelic)'
    end
    field :place do
      label 'Location'
    end
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
    field :maidan_name
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
    field :birth_date_type
    field :date_of_birth
    field :death_date_type
    field :date_of_death
    field :flourishing_date_type
    field :flourishing_date
    field :active_in_ireland_start
    field :active_in_ireland_end
    field :religious_subtype
    field :religious_order
    field :attrib do
      label 'Attributes/Role' # Change the label of this field
    end
    field :self_described_identity
    field :quotes
    field :notes
    field :reference_text
    field :odnb_id
    field :dib_id
    field :tnop_id
    field :wikidata_id
    field :ainm_id
    field :patron_id
    field :bardic_id
    field :sdfb
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
