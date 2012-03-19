# -*- coding: utf-8 -*-

Dado /^nao preciso informar o "([^"]*)"$/ do |arg1|
  should have_no_content(arg1)
end

Dado /^que estou na pagina "([^"]*)"$/ do |arg1|
  visit "/#{arg1.parameterize.gsub("novo", "").gsub("-","")}s/new" #url_for(url)
end

Dado /^informo o "([^"]*)" "([^"]*)"$/ do |arg1,arg2|
  fill_in arg1.parameterize, :with => arg2
end

Dado /^que estou logado$/ do
  criar_usuario
  entrar
end

Dado /^Nao estou logado$/ do
  visit '/usuarios/sign_out'
end

Dado /^que estou na Pagina Inicial$/ do
  visit "/"
end

Dado /^que estou na tela ([^"]*)$/ do |arg|
  should have_content(arg)
end

Dado /^Informo ([^"]*)$/ do
  pending # express the regexp above with the code you wish you had
end
