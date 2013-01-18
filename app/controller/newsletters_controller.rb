# -*- encoding : utf-8 -*-
class NewslettersController < FrontendController
  
  def create
    
    @newsletter = Newsletter.new :nome => params[:newsletter_nome], :email => params[:newsletter_email]
    if @newsletter.save
      @mensagem = 'Seu cadastro foi feito com sucesso.'
    else
      # Se email for duplicado, somente exibe uma mensagem dizendo que o cadastro foi efetuado corretamente
      if @newsletter.errors.messages[:email].eql?( ["já está em uso"] ) and @newsletter.errors.messages[:nome].blank?
        @mensagem = "Seu cadastro foi feito com sucesso."
      else
        @mensagem = 'Por favor, preencha os campos corretamente.'
      end
    end
    respond_to do |format|
      format.js 
    end
    
  end
  
end
