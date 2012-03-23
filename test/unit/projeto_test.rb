require 'test_helper'

class ProjetoTest < ActiveSupport::TestCase
	fixtures :usuarios
  test "projeto invalido" do
		projeto = create(:nome=>nil, :user_id=>nil, :descricao=>nil)
		assert(!projeto.valid?)
  end
  
  test "nome projeto deve existir" do
		projeto = create(:nome=>nil)
		assert(!projeto.valid?)
  end
  
  test "descricao projeto deve existir" do
		projeto = create(:descricao=>nil)
		assert(!projeto.valid?)
  end
  
  test "usuario projeto deve existir" do
		projeto = create()
		projeto.usuario_id = nil
		projeto.valid?
		assert(!projeto.valid?)
  end
  
  test "usuario_id nao permit mass assign" do
		projeto = Projeto.create( :usuario_id=>1,
        :nome => "Abre te sesamo",
        :descricao=> "este projeto vai abrir uma grande porta")
		assert(projeto.usuario_id.nil?)
  end
  
  
  private
    def create(options={})
      p = Projeto.create({
        :nome => "Abre te sesamo",
        :descricao=> "este projeto vai abrir uma grande porta"
        }.merge(options))
      p.usuario_id = 1
      return p
    end
end
