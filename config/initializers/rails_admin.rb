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




##### START USER  #####
config.model 'User' do

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

  ## create
  create do
    field :email
    field :password 
    field :password_confirmation
    field :first_name
    field :last_name
    field :phone
    field :country, :enum do 
      enum do
        ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
      end
    end
    field :admin
    field :bookings
  end

  ## update
  update do
    field :email
    field :password 
    field :password_confirmation
    field :first_name
    field :last_name
    field :phone
    field :country, :enum do 
      enum do
        ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
      end
    end
    field :admin
    field :bookings
  end

end
##### END USER  #####
###### Start_Itinerary ######

###### Start_trip ######
config.model 'Itinerary' do 
  ##list
  list do 
    field :title
    field :name
    field :description
    field :asset do 
      label 'Image'
    end
    field :trip
    field :created_at
    field :updated_at
  end

  #create
  create do 
    field :title
    field :name
    field :description
    field :asset do 
      label 'Image'
    end
    field :trip
  end

  ##update
  update do 
    field :title
    field :name
    field :description
    field :asset do 
      label 'Image'
    end
    field :trip
  end

  ##show
  show do 
    field :title
    field :name
    field :description
    field :asset do 
      label 'Image'
    end
    field :trip
  end

  
end


###### Start_Guide ######
config.model 'Guide' do 
  list do
    field :id
    field :first_name
    field :last_name
    # field :profile_image  do
    #   # formatted_value do
    #   #   bindings[:view].tag(:img, { :src => bindings[:object].profile_image }) 
    #   # end
    # end
    field :country
    field :trips
    field :asset do 
      label 'Profile Image'
    end
    # field :asset, :active_storage do
    #   # delete_method :remove_asset
    #   pretty_value do
    #     if value
    #       path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
    #       bindings[:view].content_tag(:a, value.filename, href: path)
    #     end
    #   end
    # end
    field :hobby
    field :description
    field :assets do 
      label 'Guide Images'
    end
    field :created_at
    field :updated_at
  end
  
  create do 
    field :first_name
    field :last_name
    field :country, :enum do 
      enum do
        ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
      end
    end
    field :asset, :active_storage do
      label 'Profile Image'
      delete_method :remove_asset
    end
    field :hobby
    field :instagram
    field :description
    field :bg_image, :active_storage do
      label 'Background Image'
      delete_method :remove_asset
    end
    field :position
    field :assets, :multiple_active_storage do
      label 'Guide Images'
      delete_method :remove_assets
    end
    field :trips
  end

  update do 
      field :first_name
      field :last_name
      field :country, :enum do 
        enum do
          ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
        end
      end
      field :asset, :active_storage do
        label 'Profile Image'
        delete_method :remove_asset
      end
      field :hobby
      field :instagram
      field :description
      field :bg_image, :active_storage do
        label 'Background Image'
        delete_method :remove_asset
      end
      field :position
      field :assets, :multiple_active_storage do
        label 'Guide Images'
        delete_method :remove_assets
      end
  end

end

###### End_Guide ######


###### START_trip ######
config.model 'Trip' do 
  configure :guide, :belongs_to_association

  list do 
    field :id
    field :title
    field :destination
    field :guide do 
      pretty_value do
        guide = Guide.find(bindings[:object].guide_id.to_s)
        guide.first_name + " " +guide.last_name
      end
    end
    field :deadline
    field :status
    field :country
    field :asset do 
      label 'Background Image'
    end
    field :assets do 
      label 'Trip Images'
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
    field :country, :enum do 
      enum do
        ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
      end
    end
    field :destination
    field :deadline
    field :level, :enum do
      enum do
        ['متقدم','مبتدئ','متوسط']
      end
    end
    field :asset, :active_storage do
      label 'Background Image'
      delete_method :remove_asset
    end
    field :group_size_start
    field :group_size_end
    field :duration
    field :assets, :multiple_active_storage do
      label 'Trip Images'
      delete_method :remove_assets
    end
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
    field :status
  end

  #update 
  update do 
    field :title do
      help 'Required'
    end
    field :sub_title
    field :description
    field :trip_type
    field :region
    field :start_date
    field :end_date
    field :country, :enum do 
      enum do
        ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
      end
    end
    field :destination
    field :deadline
    field :level, :enum do
      enum do
        ['متقدم','مبتدئ','متوسط']
      end
    end
    field :asset, :active_storage do
      label 'Background Image'
      delete_method :remove_asset
    end
    field :group_size_start
    field :group_size_end
    field :duration
    field :assets, :multiple_active_storage do
      label 'Trip Images'
      delete_method :remove_assets
    end
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
    field :status
  end

  #show
  show do 
    field :status
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
    field :asset do 
      label 'Background Image'
    end
    field :group_size_start
    field :group_size_end
    field :duration
    field :assets do 
      label 'Trip Images'
    end
    field :price
    field :guide do 
      pretty_value do
        guide = Guide.find(bindings[:object].guide_id.to_s)
        guide.first_name + " " +guide.last_name
      end
    end
    field :item_includeds
    field :item_not_includeds
    field :itineraries
    field :bookings
  end
 
end
###### End_trip ######

###### Start Booking ######
config.model 'Booking' do 
  configure :user, :belongs_to_association
  configure :trip, :belongs_to_association
  # configure :participants, :has_many

  list do 
    field :id
    field :status
    field :user do 
      pretty_value do
        user = User.find(bindings[:object].user_id.to_s)
        user.first_name + " " + user.last_name
      end
    end
    field :email do 
      pretty_value do
        user = User.find(bindings[:object].user_id.to_s)
        user.email
      end
    end
    field :created_at
    field :total
    field :tripå
    field :updated_at
    field :participants
    # field :guide_id, :enum do
    #   enum do
    #     Guide.all.collect {|p| [p.first_name + " " + p.last_name, p.id]}
    # end
  end

  

  #create
  create do 
    field :total
    field :user_id, :enum do
      enum do
        User.all.collect {|p| [p.email + ", " + p.first_name + " " + p.last_name, p.id]}
      end
    end
    field :trip
    field :participants
  end

  #update
  update do 
    field :status
    field :total
    field :user_id, :enum do
      enum do
        User.all.collect {|p| [p.email + ", " + p.first_name + " " + p.last_name, p.id]}
      end
    end
    field :trip
    field :participants
  end

  #show
  show do 
    field :id
    field :user do 
      pretty_value do
        user = User.find(bindings[:object].user_id.to_s)
        "Email: " + user.email + " || Name: " + user.first_name + " " + user.last_name
      end
    end
    field :total
    field :trip
    field :status
    field :created_at
    field :updated_at
    field :participants
  end

end
###### End Booking ######

###### START Participant ######
config.model 'Participant' do 
  configure :booking, :belongs_to_association

  #create
  create do 
    field :first_name
    field :last_name
    field :email
    field :gender, :enum do
      enum do
        ['أنثى','ذكر']
      end
    end
    field :booking_id, :enum do
      enum do
        Booking.all.collect {|p| ["Booking No: " + p.id.to_s + " - Trip: " + p.trip.title + " - User: " + p.user.email  , p.id]}
      end
    end
  end

  #update
  update do 
    field :first_name
    field :last_name
    field :email
    field :gender, :enum do
      enum do
        ['أنثى','ذكر']
      end
    end
    field :booking_id, :enum do
      enum do
        Booking.all.collect {|p| ["Booking No: " + p.id.to_s + " - Trip: " + p.trip.title + " - User: " + p.user.email  , p.id]}
      end
    end
  end


end
###### END Participant ######

###### START Attachments ######
config.model 'Attachment' do 
  visible false
end
###### END Attachments ######


###### START Blobs ######
config.model 'Blob' do
  hide_from_navigation
end
###### END Blobs ######




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
    new do 
    
    end
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
  # If you want customize the navigation of dashboard admin on rails_admin
  # config.included_models = [ 'User', 'Guide', 'Trip', 'item_includeds','item_not_includeds', 'Itinerary','Booking','Participant','Region' ]

end
