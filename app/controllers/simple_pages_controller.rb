class SimplePagesController < ApplicationController

  before_filter :can_manage_pages?, :only => [:edit,
                                              :create,
                                              :update,
                                              :destroy]
  before_filter :find_or_initialize, :except => :index
  before_filter :set_title, :except => :index
  
  def index
    @simple_pages = SimplePage.find(:all)
  end
  
  # render show
  
  def edit
    @simple_page.revert_to(params[:version]) if params[:version] && @simple_page.respond_to?(:revert_to)
  end
  
  def create
    @simple_page.update_attributes!(params[:simple_page])
    flash[:success] = "Page successfully created"
    redirect_to simple_page_path(@simple_page)
  end
  
  def update
    @simple_page.update_attributes!(params[:simple_page])
    flash[:success] = "Page successfully modified"
    redirect_to simple_page_path(@simple_page)
  end
  
  def destroy
    @simple_page.destroy
    flash[:success] = "Page successfully deleted"
    redirect_to :action => 'index'
  end
  
  protected
  
    # this is where you customize permissions. Either set up an is_admin? 
    def can_manage_pages?
      super
    rescue
      raise "You need to specify a method named 'can_manage_pages?' in your application.rb.  Have it return true if the current user should be able to create/edit pages and false otherwise"
    end
    helper_method :can_manage_pages?
  
    def find_or_initialize
      @simple_page = params[:id] ? SimplePage.find_by_filename(params[:id]) : SimplePage.new
    end
    
    def set_title
      @title = @simple_page.title if @simple_page.respond_to?(:title)
    end
    
    
    # some super-handy controller code stolen from techno-weenie
    def rescue_action(exception)
      case exception.class.name
      when 'ActiveRecord::RecordInvalid'
        render_invalid_record(exception.record)
      when 'ActionController::RoutingError',
           'ActionController::UnknownAction',
           'ActiveRecord::RecordNotFound'
        render_404
      else
        super
      end
    end

    def render_invalid_record(record)
      render :action => (record.new_record? ? 'new' : 'edit')
    end
    
    def render_404
      render :text => "<h1>Whoops!  That's a bad link.</h1>", :layout => true, :status => "404 Not Found"
    end

end
