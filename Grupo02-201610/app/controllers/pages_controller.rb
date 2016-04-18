class PagesController < ApplicationController
  def home

    @empresaEjm = Empresady.new(:nombre_empresa => "EmpresaEjemplo")
    @empresaEjm.save
    @proyectoEjm = @empresaEjm.proyectos.create(:nombre => "ProyectoEjm")
    @proyectoEjm.empresa = @empresaEjm
    @proyectoEjm.save
    @disenioEjm = @proyectoEjm.disenios.create(:nombre_diseniador => "DiseniadorEjm")
    @disenioEjm.proyecto = @proyectoEjm
    @disenioEjm.save

    @empresas = Empresady.all

    @proyectoEjm.empresa_ids.each do |m|
      puts("asdasdasdasdasdasdasdasd " + m )

      if(@empresaEjm.id == m)
        puts("Leeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeel")
      end

    end



    @empresas.each do |e|
      puts("----- " + e.id)
    end

  end

  def about
    require 'mail'

    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    end

    Mail.deliver do
  to 'example@example.com'
  from 'sender@example.comt'
  subject 'testing send mail'
  body 'Sending email with Ruby through SendGrid!'
end
  end
end
