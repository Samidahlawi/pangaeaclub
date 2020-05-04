RailsAdmin.config do |config|

##########################
## Only the admin can access the admin dashboard
config.authorize_with do
  if warden.user.admin == true 
  else
    redirect_to main_app.root_path 
    flash[:error] = "(: لا يُمكنك الوصول إلى هذه الصّفحة"
  end
end




##### USER  #####
config.model User do
  list do
    field :id
    field :Full_name do
      pretty_value do
        user = User.find(bindings[:object].id.to_s)
        user.first_name + " " + user.last_name
      end
    end 
    field :country
    field :phone 
    field :email
    field :admin

  end
end
###### Start_trip ######
config.model Trip do 
  configure :guide, :belongs_to_association

  list do 
    field :id
    field :title
    field :country
    field :destination
    field :deadline
    field :guide do 
      pretty_value do
        guide = Guide.find(bindings[:object].guide_id.to_s)
        guide.first_name + " " +guide.last_name
      end
    end
  end

  #Create 
  create do 
    field :title
    field :sub_title
    field :description
    field :trip_type
    field :region
    field :start_date
    field :end_date
    field :country 
    field :destination
    field :deadline
    field :level
    field :bg_image
    field :group_size_start
    field :group_size_end
    field :duration
    field :image
    field :price
    field :guide_id, :enum do
      enum do
        Guide.all.collect {|p| [p.first_name + " " + p.last_name, p.id]}
    end
  end

    field :item_includeds
    field :item_not_includeds
    # field :itineraries
    # field :user_trips
  end

  #update 
  update do 
    field :title
    field :sub_title
    field :description
    field :trip_type
    field :region
    field :start_date
    field :end_date
    field :country 
    field :destination
    field :deadline
    field :level
    field :bg_image
    field :group_size_start
    field :group_size_end
    field :duration
    field :image
    field :price
    field :guide_id, :enum do
      enum do
        Guide.all.collect {|p| [p.first_name + " " + p.last_name, p.id]}
    end
  end

    field :item_includeds
    field :item_not_includeds
    field :itineraries
    # field :user_trips
  end
 end
###### End_trip ######


##########################

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

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
