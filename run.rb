require 'rubygems'
require 'sinatra/base'
require 'haml'

module Project

  class Aparta

    def initialize()
      @nom = ''
      @dir = ''
      @nDueno = ''
      @correo = ''
      @internet = False
      @alarma = False
      @parqueo = False
      @agua = False
      @unDor = False
      @dosDor = False
      @unBa = False
      @dosBa = False
      @precio = 0
    end

    def guardarDatos(nom,dir,nDueno,correo,internet,alarma,parqueo,agua,unDor,dosDor,unBa,dosBa,precio)
      File.open('Apartamentos.txt', 'a+') do |f1|
        f1.write @nom+@dir+@nDueno+@correo+@internet+@alarma+@parqueo+@agua+@unDor+@dosDor+@unBa+@dosBa+@precio
      end
    end
  end

  class App < Sinatra::Base
 
    get '/home' do  
      @home = '/home'
      @agregar = '/agregar'
      haml :apartas
    end

    post '/home' do
      @nom = params[:name]
      @dir = params[:direccion]
      @dueno = params[:dueno]
      @correo = params[:correo]
      @internet = params[:internet]
      @alarma = params[:alarma]
      @parqueo = params[:parqueo]
      @agua = params[:agua]
      @unDor = params[:unDorm]
      @dosDor = params[:dosDorm]
      @unBa = params[:unBa]
      @dosBa = params[:dosBa]
      @precio = params[:precio]
      guardarDatos(nom,dir,nDueno,correo,internet,alarma,parqueo,agua,unDor,dosDor,unBa,dosBa,precio)
    end

    get'/' do
      @home = '/home'
      haml :signIn
    end

    get '/agregar' do
      haml :agregar
    end

    
  end
end
