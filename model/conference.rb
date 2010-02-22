class Conference < Sequel::Model
  set_schema do
    primary_key :id
    varchar :acronym, :unique => true, :empty => false
    varchar :title,   :unique => true, :empty => false
    varchar :url,                      :empty => false 
    time    :abstract            
    time    :deadline,                 :empty => false
    time    :notification,             :empty => false
    varchar :address
    text    :cfp
  end

  create_table unless table_exists?

end
