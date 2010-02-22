class Conferences < Ramaze::Controller
  map '/'
  layout :default  
  helper :simple_captcha

  def index
    simple_captcha
    @captcha_question = session[:CAPTCHA][:question]
  end

  def add
    # TODO: validation?
    if request.post? and check_captcha(request[:answer])
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
  
  def edit(id)
    @c = Conference[:id => id]
  end

  def view(id)
    @c = Conference[:id => id]
  end

  def update(id)
    if request.post? and check_captcha(request[:answer]) 
      @c = Conference[:id => id]
      @c.acronym = request[:acronym]
      @c.title = request[:title]
      @c.url = request[:url]
      @c.abstract = request[:abstract]
      @c.deadline = request[:deadline]
      @c.notification = request[:notification]
      @c.address = request[:address]
      @c.cfp = request[:cfp]
      @c.save
    else
      redirect_referrer
    end

    redirect route('/conflist')
  end

  def delete(id)
    if check_captcha(request[:answer])
      Conference[:id => id].destroy()
    end
    
    redirect route('/conflist')
  end

private

  def failed(message)
    flash[:error] = message
  end
end
