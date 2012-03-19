# -*- coding: utf-8 -*-

Então /^o sistema informa que "([^"]*)"$/ do |arg1|
  should have_content(arg1)
end

Entao /^devo ver ([^"]*)$/ do
  pending # express the regexp above with the code you wish you had
end

Então /^salva o novo ([^"]*) com o usuario logado$/ do |nome_obj|
  id = Projeto.last.id
  visit "/#{nome_obj}s/#{id}"
  should have_content("Criado por: #{@usuario}")
end
