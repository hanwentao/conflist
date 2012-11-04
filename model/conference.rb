class Conference < Sequel::Model
  set_schema do
    primary_key :id
    varchar :acronym, :unique => true, :empty => false
    varchar :title,   :unique => true, :empty => false
    varchar :url,                      :empty => false
    datetime :abstract
    datetime :deadline,                 :empty => false
    datetime :notification,             :empty => false
    varchar :address
    text    :cfp
  end

  create_table unless table_exists?

end
