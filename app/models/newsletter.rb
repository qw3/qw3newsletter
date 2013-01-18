# -*- encoding : utf-8 -*-
class Newsletter < ActiveRecord::Base
  
  validates :nome, :email, :presence => true
  validates :email, :uniqueness => true
  
  def Newsletter.csv
    csv = []
    Newsletter.all.each do |news|
      csv << news.id << ";" << news.nome << ";" << news.email << ";\n"
    end
    
    return csv.join( "" )
    
  end
  
end
