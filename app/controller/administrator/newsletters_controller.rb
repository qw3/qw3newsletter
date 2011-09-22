# -*- encoding : utf-8 -*-
class Administrator::NewslettersController < Administrator::AdminController
  
  before_filter :pessoas_menu_detalhes
  
  def index
    @filtros = {}
    @filtros[:email] = params[:email]
    conditions = (@filtros[:email].blank?) ? "" : "email LIKE '%#{@filtros[:email]}%'"
    @newsletters = Newsletter.paginate :page => params[:page], :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy

    respond_to do |format|
      format.html  { redirect_to('/administrator/newsletters/index') }
      format.json  { render :json => {}, :status => :ok }
    end
  end
  
  def exportar
    send_data Newsletter.csv, :filename => "clientes.txt"
  end

end
