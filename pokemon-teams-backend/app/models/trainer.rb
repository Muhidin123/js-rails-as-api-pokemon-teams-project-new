class Trainer < ApplicationRecord
    has_many :pokemons
    validates :pokemons, uniqueness: {scope: :trainer_id}
    

    private


    def num_of_pokemons
        pokemons = self.pokemons
        if pokemons.count <= 5 && pokemons.count != 0
          true
        else
          false
          error.add(:pokemon, "Limit is 5 pokemons")
      end
    end
end
