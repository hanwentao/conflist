class Conferences < Ramaze::Controller
  map '/'
  layout 'default'

  def add
    # TODO: validation?

    if request.post?
      Conference.create(:acronym => request[:acronym],
                        :title => request[:title],
                        :url => request[:url],
                        :abstract => request[:abstract],
                        :deadline => request[:deadline],
                        :notification => request[:notification],
                        :address => request[:address],
                        :cfp => request[:cfp])
    end

    redirect route('/conflist')
  rescue Sequel::DatabaseError
    redirect route('/conflist')
  end
  
#   def create
#     if request.post? and title = request[:title]
#       title.strip!

#       unless title.empty?
#         Conference.create :title => title
#       end
#     end

#     redirect route('/', :title => title)
#   rescue Sequel::DatabaseError
#     redirect route('/', :title => title)
#   end

#   def close(title)
#     task = Conference[:title => title]
#     task.done = true
#     task.save

#     redirect_referrer
#   end

#   def open(title)
#     task = Conference[:title => title]
#     task.done = false
#     task.save

#     redirect_referrer
#   end

#   def delete(title)
#     task = Conference[:title => title]
#     task.destroy

#     redirect_referrer
#   end
end
