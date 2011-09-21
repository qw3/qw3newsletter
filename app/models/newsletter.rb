# -*- encoding : utf-8 -*-
class Newsletter < ActiveRecord::Base
  
  validates :nome, :email, :presence => true
  
end
