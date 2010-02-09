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

  if empty?
    create(:acronym => "OSDI'10",
           :title => "9th USENIX Symposium on Operating Systems Design and Implementation (OSDI '10)",
           :url => "http://www.usenix.org/event/osdi10/",
           :abstract => Time.now,
           :deadline => Time.now,
           :notification => Time.now,
           :address => "October 4-6, 2010, Vancouver, BC, Canada",
           :cfp => "")
  end
end
