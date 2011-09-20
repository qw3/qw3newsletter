# -*- encoding : utf-8 -*-
class NewslettersController < FrontendController
  
  def create
    
    @newsletter = Newsletter.new :nome => params[:newsletter_nome], :email => params[:newsletter_email]
    if @newsletter.save
      @mensagem = 'Seu cadastro foi feito com sucesso.'
    else
      @mensagem = 'Por favor, preencha os campos corretamente.'
    end
    respond_to do |format|
      format.js 
    end
    
  end
  
end
