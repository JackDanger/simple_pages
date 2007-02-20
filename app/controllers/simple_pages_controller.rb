class SimplePagesController < ApplicationController

  before_filter :admin_required, :only => [:edit,
                                           :create,
                                           :update,
                                           :destroy]
  before_filter :find_or_initialize, :except => :index
  before_filter :set_title
  
  def index
    @pages = Page.find(:all)
  end
  
  # render show
  
  def edit
    @page.revert_to(params[:version]) if params[:version] && @page.respond_to(:revert_to)
  end
  
  def create
    @page.update_attributes!(params[:page])
    flash[:success] = "Page successfully created"
    redirect_to :action => 'show', :id => @page
  end
  
  def update
    @page.update_attributes!(params[:page])
    flash[:success] = "Page successfully modified"
    redirect_to :action => 'show', :id => @page
  end
  
  def destroy
    @page.destroy
    flash[:success] = "Page successfully deleted"
    redirect_to :action => 'index'
  end
  
  protected
  
    def find_or_initialize
      @page = params[:id] ? Page.find_by_filename(params[:id]) : Page.new
    end
    
    def set_title
      @title = @page.title if @page.respond_to(:title)
    end
    
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
