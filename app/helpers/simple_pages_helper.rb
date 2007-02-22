module SimplePagesHelper

  def simple_new_page_path
    super
  rescue
    raise helper_error
  end
  
  def simple_page_path
    super
  rescue
    raise helper_error
  end

  def helper_error
    "You must install this plugin's routes!  Add the line 'map.from_plugin :simple_pages' to your config/routes.rb"
  end

end