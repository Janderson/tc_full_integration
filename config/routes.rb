DmixSite::Application.routes.draw do
	devise_for :usuarios, :path => "usuarios", :path_names => { :sign_in => 'entrar', :sign_out => 'sair', :password => 'senha', :confirmation => 'verificacao', :unlock => 'desbloquear', :registration => 'registrar', :sign_up => 'criar' }

	resources :projetos
	root :to=>"inicial#index"
end
