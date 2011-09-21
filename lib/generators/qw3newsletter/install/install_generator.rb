# -*- encoding : utf-8 -*-

require 'rails/generators'
require 'rails/generators/migration'

module Qw3newsletter
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      include Rails::Generators::Migration
      
      source_root File.expand_path("../templates", __FILE__)
      
      # Implement the required interface for Rails::Generators::Migration.
      # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S").to_s + rand(1230).to_s
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end
      
      def create_migrations
        if yes? 'Criar migrations?'
          migration_template 'db/migrate/create_newsletters.rb', 'db/migrate/create_newsletters.rb'
          rake 'db:migrate'
        end
      end
      
      def create_routes
        if yes? 'Criar rotas?'
          route "namespace :administrator do
    controller :newsletters do
      get 'newsletters/index' => :index
      delete 'newsletter/:id' => :destroy
    end
  end
  controller :newsletters do
    post 'newsletters/create' => :create
  end\n"
        end
      end
      
      def insert_menu_calls
        append_file "app/views/administrator/administradores/_menu_detalhes.html.erb" do
          "<li>
  <%= link_to '/administrator/newsletters/index', :class => \"newsletters-leftbar\" do %>
    <span>Cadastros no Newsletter</span>
  <% end %>
</li>\n"
        end
      end
      
      def create_files
        copy_file 'public/javascripts/qw3newsletters.js', 'public/javascripts/qw3/newsletters.js'
      end
      
    end
  end
end
